<%--
  Created by IntelliJ IDEA.
  User: josh
  Date: 3/5/14
  Time: 12:44 PM
--%>

<%@ page import="edu.msu.mi.gwurk.Workflow" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="gwurkmain"/>
</head>

<body>

<div class="container">
<g:set var="workflows" value="${Workflow.list()}"/>
    <h1>Select workflow</h1>
    <hr/>
    <g:if test="${!workflows}">
    <i>No workflows defined.</i>
</g:if>
<g:else>
    <g:form action="launchWorkflow">
        <table class="table">
            <thead>

            <tr>
                <th>Select</th>
                <th>
                    Name
                </th>
                <th>
                    Description
                </th>
            </tr>
            </thead>

            <g:each in="${workflows}" var="w">
                <tr>
                    <td><g:radio name="workflow" value="${w.id}"/></td>
                    <td>${w.name}</td>
                    <td>${w.description}</td>
                </tr>
            </g:each>
        </table>


        <g:submitButton name="Launch" value="Launch selected"/>
    </g:form>

</g:else>
</div>
</body>
</html>