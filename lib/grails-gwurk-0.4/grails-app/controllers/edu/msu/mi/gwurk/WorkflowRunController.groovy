package edu.msu.mi.gwurk

class WorkflowRunController {

    def mturkMonitorService

    def index() {
        [refreshOn:mturkMonitorService.running]
    }

    def manualRefresh() {
        println "$params"
        mturkMonitorService.beat()
        render("OK")
    }

    def autoRefresh() {
        println "$params"
        if (params.state=="true") {
            mturkMonitorService.restart()
        } else {
            mturkMonitorService.halt()
        }
        render("OK")
    }
}
