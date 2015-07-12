<%--
  Created by IntelliJ IDEA.
  User: josh
  Date: 3/4/14
  Time: 11:08 PM
--%>

<%@ page import="edu.msu.mi.gwurk.Credentials" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Credentials</title>
    <meta name="layout" content="gwurkmain"/>
</head>

<body>
<div class="container">
    <h1>Credentials</h1>

    <g:set var="credentials" value="${Credentials.list()}"/>
    <g:if test="${!credentials}">
        <em>No credentials loaded.</em>
    </g:if>
    <g:else>
        <table class="table">
            <thead>
            <tr>

                <th>
                    Name
                </th>
                <th>
                    AWS ID
                </th>
            </tr>
            </thead>

            <g:each in="${Credentials.list()}" var="c">
                <tr>
                    <td>${c.name}</td>
                    <td>${c.awsId}</td>
                </tr>
            </g:each>
        </table>
    </g:else>
    <div class="well">
        <form class="form-inline" action="./add" method="post">

            <div class="form-group">
                <label for="name">Name:</label>
                <g:textField class="form-control" id="name" name="name"/>

            </div>

            <div class="form-group">
                <label for="awsId">ID:</label>
                <g:textField class="form-control" name="awsId" id="awdId"/>

            </div>

            <div class="form-group">
                <label for="awsSecret">Secret:</label>
                <g:passwordField class="form-control" name="awsSecret" id="awsSecret"/>

            </div>

            <g:submitButton class="btn btn-default" name="Submit" value="Add credential"/>
        </form>

    </div>
</div>
</body>
</html>