package emoinfocoding

import edu.msu.mi.gwurk.TaskRun

class CodingController {


    def dataService

    def doCoding() {



        String text = $/
This is not a real post.  It is a preview for your consumption. Bacon ipsum dolor amet shankle ball tip tri-tip pork chop, kevin shoulder boudin meatloaf prosciutto drumstick. Pork loin shankle pork boudin pastrami swine beef brisket ground round hamburger frankfurter. Cupim picanha jerky frankfurter meatball pastrami alcatra. Meatloaf boudin meatball short ribs shank venison alcatra pork chop tenderloin sirloin. Tail short loin swine pork loin turducken ribeye tenderloin pig shank. Short loin pork brisket, ball tip shoulder drumstick chuck pork chop. Corned beef jowl tenderloin cupim.
/$
        if (params.workerId) {
            TaskRun tr = TaskRun.get(params.task)

            text = dataService.getPostText(Integer.parseInt(tr.taskProperties.parameter))
        }

        [textToMarkup:text]

    }

    def submitCoding() {
        println "$params"
        render "Success"
    }
}
