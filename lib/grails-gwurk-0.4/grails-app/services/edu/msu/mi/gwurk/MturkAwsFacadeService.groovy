package edu.msu.mi.gwurk

import com.amazonaws.mturk.requester.Comparator
import com.amazonaws.mturk.requester.HIT
import com.amazonaws.mturk.requester.QualificationRequirement
import com.amazonaws.mturk.service.axis.RequesterService
import com.amazonaws.mturk.util.ClientConfig
import grails.transaction.Transactional
import groovy.util.logging.Log4j
import org.codehaus.groovy.grails.web.mapping.LinkGenerator

import static com.amazonaws.mturk.requester.Comparator.*

@Log4j
@Transactional
class MturkAwsFacadeService {

    def grailsApplication
    LinkGenerator grailsLinkGenerator


    static int retryAttempts = 10
    static long retryDelayMillis = 1000
    static Set<String> retriableErrors = ["Server.ServiceUnavailable"] as Set<String>

    HitView recycle(RequesterService requesterService, HitView hitView) {
        expire(requesterService,hitView)
        launchHit(requesterService,hitView.taskRun)
    }

    def expire(RequesterService requesterService, HitView hitView) {
        hitView.expire(requesterService)
        hitView.taskRun.activeHit = null
        hitView.taskRun.save()
    }

    def refresh(RequesterService requesterService, TaskRun taskRun) {
        taskRun.activeHit.update(requesterService)
    }

    HitView launchHit(RequesterService requesterService, TaskRun taskRun) {
        taskRun.attach()
        MturkHitProperties props = getProperties(taskRun.taskProperties)

        QualificationRequirement qualReq = new QualificationRequirement();
        qualReq.setQualificationTypeId(RequesterService.LOCALE_QUALIFICATION_TYPE_ID);
        qualReq.setComparator(EqualTo);
        com.amazonaws.mturk.requester.Locale country = new com.amazonaws.mturk.requester.Locale();
        country.setCountry("US");
        qualReq.setLocaleValue(country);

        QualificationRequirement qualReq1 = new QualificationRequirement();
        qualReq1 = new QualificationRequirement();
        qualReq1.setQualificationTypeId(RequesterService.APPROVAL_RATE_QUALIFICATION_TYPE_ID)
        qualReq1.setComparator(com.amazonaws.mturk.requester.Comparator.GreaterThanOrEqualTo);
        qualReq1.setIntegerValue(98)

        log.info("Launch hit with taskrun id: "+taskRun.id)
        String url = "https://${grailsApplication.config.gwurk.hostname}:${grailsApplication.config.gwurk.port}${grailsLinkGenerator.link(action:"external",controller: "workflow", params:[task:taskRun.id])}"
        log.info("Would link: ${url}")
        HIT h = requesterService.createHIT(
                null, // hitTypeId
                props.getTitle("No title"),
                props.getDescription("No description"),
                props.getKeywords(null), // keywords
                getExternalQuestion(url, taskRun.taskProperties.height),
                props.getRewardAmount(0),
                props.getAssignmentDuration(60 * 5),
                props.getAutoApprovalDelay(60 * 30),
                taskRun.taskProperties.lifetime,
                props.getMaxAssignments(1),
                "", // requesterAnnotation
                [qualReq,qualReq1] as QualificationRequirement[], // qualificationRequirements
                (String[])["Minimal", "HITDetail", "HITQuestion", "HITAssignmentSummary"] as String[], // responseGroup
                null, // uniqueRequestToken
                null, // assignmentReviewPolicy
                null); // hitReviewPolicy

        HitView result = new HitView(taskRun,h)
        result.save()
        taskRun.addActive(result)
        result

    }

    RequesterService getRequesterService(Credentials credentials, boolean real) {
        ClientConfig config = new ClientConfig()
        config.setAccessKeyId(credentials.awsId)
        config.setSecretAccessKey(credentials.awsSecret)
        config.setRetriableErrors(retriableErrors)
        config.setRetryAttempts(retryAttempts)
        config.setRetryDelayMillis(retryDelayMillis)
        if (real) {
            config.setServiceURL(ClientConfig.PRODUCTION_SERVICE_URL);

        } else {
            config.setServiceURL(ClientConfig.SANDBOX_SERVICE_URL);

        }
        new RequesterService(config)
    }


    static MturkHitProperties getProperties(TaskProperties properties) {
        def props = new MturkHitProperties()
        props.title = properties.title
        props.description = properties.description
        props.autoApprovalDelay = properties.autoApprove?0:24*60*60
        props.keywords = properties.keywords
        props.maxAssignments = properties.maxAssignments
        props.assignmentDuration = properties.assignmentDuration
        props.rewardAmount = properties.rewardAmount
        props.lifetime = properties.lifetime as String

        props
    }

    static String getExternalQuestion(String url,int frameHeight) {
        String question = String.format("<ExternalQuestion xmlns=\"http://mechanicalturk.amazonaws.com/AWSMechanicalTurkDataSchemas/2006-07-14/ExternalQuestion.xsd\">" +
                "<ExternalURL>%s</ExternalURL>" +
                "<FrameHeight>%d</FrameHeight>" +
                "</ExternalQuestion>", url,frameHeight);
        log.info("Attempt to launch external hit: "+question);
        return question;
    }

    BufferedOutputStream getExternalFile() {

    }


}
