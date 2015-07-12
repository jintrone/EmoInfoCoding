import edu.msu.mi.gwurk.GwurkEvent
import edu.msu.mi.gwurk.SingleHitTask
import edu.msu.mi.gwurk.Task
import edu.msu.mi.gwurk.Workflow
import groovy.json.JsonSlurper

class BootStrap {

    def dataService
    def mturkTaskService

    def init = { servletContext ->


        if (Workflow.count() < 1) {
            int startingTask = 1
            int max = dataService.postCount
            while (startingTask < max) {

                int next = Math.min(startingTask + 300, max)
                Workflow w = new Workflow("Coding Emo Info ($startingTask - $next)", "Coding emotional and information content in support forums", [
                        controller        : "coding",
                        action            : "doCoding",
                        title             : "Read a message and describe the social support it provides.",
                        description       : "This research is to help understand what kinds of social support users in an online help provide to one another",
                        rewardAmount      : 0.05f,
                        relaunchInterval  : 1000 * 60 * 60,
                        autoApprove       : true,
                        lifetime          : 60 * 60 * 24,
                        assignmentDuration: 300,
                        keywords          : "research, coding, reading",
                        maxAssignments    : 10,
                        height            : 1000,
                        requireApproval   : true
                ]).save([flush: true, failOnError: true])
                w.initStartingTasks((startingTask..next).collect { id ->
                    new SingleHitTask("Coding Task ${id}", [
                            parameter: id
                    ]).save([flush: true, failOnError: true])
                } as Task[])
                w.save()
                startingTask = next+1
            }
        }

        Workflow.list().each { Workflow w ->
            w.startingTasks.each { Task t ->
                mturkTaskService.installTask(t) { type, GwurkEvent evt ->
                    switch (type) {

                        case GwurkEvent.Type.TASK_STARTING:
                            log.info("Task # ${t.id} starting")
                            break

                        case GwurkEvent.Type.HIT_COMPLETE:
                            log.info("Hit complete!")
                            break
                        case GwurkEvent.Type.ASSIGNMENT_COMPLETE:
                            log.info("Assignment complete!")
                            break;

                        case GwurkEvent.Type.TASK_COMPLETE:
                            log.info("Task complete!")
                            break
                    }

                }
            }
            mturkTaskService.installWorkflow(w) { a, b ->
                log.info("Workflow complete!")
            }
        }





        log.info("Bootstrap Complete")
    }
    def destroy = {
    }
}
