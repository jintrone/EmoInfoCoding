<%--
  Created by IntelliJ IDEA.
  User: josh
  Date: 3/5/14
  Time: 9:13 PM
--%>

<%@ page import="edu.msu.mi.gwurk.TaskRun; edu.msu.mi.gwurk.WorkflowRun" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="gwurkmain"/>

    <script type="text/javascript">
        function setAutoRefresh() {
            var url = '<g:createLink action="autoRefresh"/>';
            var state = $('#autoRefresh').is(':checked');
            $.ajax({
                url: url,
                data: {state: state}
            }).done(function () {
                $('#refreshnow').prop("disabled",state);
            });
        }

        function manualRefresh() {
            var url = '<g:createLink action="manualRefresh"/>';
            $.ajax({
                url: url

            });
        }



    </script>

</head>

<body>
<div class="container">
    <g:set var="workflowruns" value="${WorkflowRun.list()}"/>
    <g:if test="${!workflowruns}">
        <h2>No runs found.</h2>
    </g:if>
    <g:else>
        <div class="well">
            <form class="form-inline">
                <div class="form-group">
                    <label for="autoRefresh">Auto-refresh</label>
                    <g:checkBox name="autoRefresh" class="form-control" id="autoRefresh" onchange="setAutoRefresh();"
                                value="${refreshOn}"/>
                </div>

                <div class="form-group">
                    <button type="button" class="btn btn-lg" id="refreshnow" placeholder="Password"
                            onclick="manualRefresh();">Refresh Now</button>
                </div>
            </form>

        </div>

        <table class="table">
            <thead>

            <tr>
                <th>
                    Workflow
                </th>
                <th>
                    Status
                </th>
                <th>
                    Waiting Tasks
                </th>
                <th>
                    Active Tasks
                </th>
                <th>
                    Completed Tasks
                </th>
            </tr>
            </thead>

            <g:each in="${workflowruns}" var="w">
                <tr>
                    <td>${w.workflow.name}</td>
                    <td>${w.currentStatus}</td>
                    <td>${w.currentTasks.findAll { it.getTaskStatus() == TaskRun.Status.WAITING }.size()}</td>
                    <td>${w.currentTasks.findAll { it.getTaskStatus() in TaskRun.Status.RUN_STATES }.size()}</td>
                    <td>${w.currentTasks.findAll {
                        it.getTaskStatus() in [TaskRun.Status.COMPLETE, TaskRun.Status.ABORTED]
                    }.size()}</td>
                </tr>
            </g:each>
        </table>
    </g:else>

</div>
</body>
</html>