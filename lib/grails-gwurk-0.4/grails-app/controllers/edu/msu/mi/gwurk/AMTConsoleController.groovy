package edu.msu.mi.gwurk

import com.amazonaws.mturk.requester.HIT
import com.amazonaws.mturk.service.axis.RequesterService

class AMTConsoleController {

    def mturkAwsFacadeService


    def index() {

    }

    def hitlist() {

        Credentials c = Credentials.get(params.credentials)
        boolean real = params.type == "real"
        RequesterService svc = mturkAwsFacadeService.getRequesterService(c, real)
        HIT[] hits = svc.searchAllHITs()
        render(view: "_hittable", model: [hits: hits])


    }

    def modifyhits() {

        Credentials c = Credentials.get(params.credentials)
        boolean real = params.type == "real"
        RequesterService svc = mturkAwsFacadeService.getRequesterService(c, real)
        if (params.command=="expire") {
            params.hits.each {
                if (params.cmd == "expire") {
                    svc.forceExpireHIT(it)
                }
            }
        } else if (params.command=="delete") {
            String[] s = params.hits.toString().split(",")

            svc.deleteHITs(s,true,true,null)
        }
        render("Success")
    }

}