<%--
  Created by IntelliJ IDEA.
  User: josh
  Date: 3/5/14
  Time: 1:16 PM
--%>

<%@ page import="edu.msu.mi.gwurk.Credentials; edu.msu.mi.gwurk.Credentials; edu.msu.mi.gwurk.Workflow" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="gwurkmain"/>
</head>

<body>
<div class="container">

    <h1>Launch Workflow: ${workflow.name}</h1>

    <p>
        <b>Description:</b>${workflow.description}
        <b>Tasks:</b>${workflow.allTasks.size()}
    </p>
    <g:form class="form-horizontal" action="doLaunch">
        <g:hiddenField name="workflowId" value="${workflow.id}"/>
        <div class="form-group">
            <label for="type" class="col-sm-2 control-label">Type of run:</label>

            <div class="col-sm-10">
                <g:select class="form-control" from="${["sandbox", "real"]}" name="type" value="sandbox"/>
            </div>
        </div>

        <div class="form-group">
            <label for="iterations" class="col-sm-2 control-label">Iterations:</label>

            <div class="col-sm-10">
                <g:field name="iterations" type="number" value="1"/>

            </div>
        </div>

        <div class="form-group">
            <label for="credentials" class="col-sm-2 control-label">Credentials:</label>

            <div class="col-sm-10">
                <g:select name="credentials" from="${edu.msu.mi.gwurk.Credentials.list()}" optionKey="id"
                          optionValue="name"/><br/>
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
                Global properties
            </div>

            <div class="panel-body">
                <g:render template="/taskPropertiesForm" model="${[prefix: "global", props: workflow.taskProperties]}"/>
            </div>
        </div>

        <g:submitButton name="Launch" value="Launch"/>
        <g:actionSubmit action="index" value="Cancel"/>
    </g:form>
</div>
</body>
</html>