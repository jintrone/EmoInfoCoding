<%--
  Created by IntelliJ IDEA.
  User: josh
  Date: 7/9/15
  Time: 8:21 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="gwurkmain"/>
    <script type="text/javascript">
        function refreshTable() {
            var url = '<g:createLink action="hitlist"/>';
            if ($('#credentialsSelector').val() == null) {

            } else {

                $.ajax({
                    url: url,
                    data: {type: $('#typeSelector').val(), credentials: $('#credentialsSelector').val()},
                    content: 'html'
                }).done(function (data) {

                    $('#hitList').html(data)
                });

            }
        }

        function invertAll() {
            var result = $(':checkbox').map(function () {
                return this.checked = !this.checked;
            }).get().join();
        }

        function getHitsToChange() {
            var result = $(':checkbox:checked').map(function () {
                return this.value;
            }).get().join();
            return (result.trim());
        }


        function sendModify(cmd) {
            var url = '<g:createLink action="modifyhits"/>';
            var check = getHitsToChange();

            if (check && $('#credentialsSelector').val() != null) {
                $.ajax({
                    url: url,
                    method: "POST",
                    data: {
                        type: $('#typeSelector').val(),
                        credentials: $('#credentialsSelector').val(),
                        hits: check,
                        command: cmd
                    },
                    content: 'html'
                }).done(function (data) {
                    alert(data + " : " + cmd)
                    refreshTable()
                });

            }
        }

        function startTimer() {
            setInterval(function () {
                refreshTable();
            }, 30000);
        }

        jQuery(document).ready(function () {

            refreshTable();
            startTimer();
        });



    </script>
</head>

<body>
<div class="container">
    <h1>AMT Hits</h1>
    Type of run? <g:select id="typeSelector" from="${["sandbox", "real"]}" name="type" value="sandbox"
                           onchange="refreshTable();"/> <br/>
    Credentials? <g:select id="credentialsSelector" name="credentials" from="${edu.msu.mi.gwurk.Credentials.list()}"
                           optionKey="id" onchange="refreshTable();" optionValue="name"/><br/>


    <div class="panel panel-primary">
        <div class="panel-heading">
            <div class="panel-title">
                Actions
            </div>
        </div>

        <div class="panel-body">
            <div class="btn-group btn-group-lg" role="group">
                <button type="button" class="btn btn-default" onclick="sendModify('expire');">Expire Selected</button>
                <button type="button" class="btn btn-default" onclick="sendModify('delete');">Delete Selected</button>
            </div>
        </div>

    </div>

    <table class="table">
        <thead>
        <tr>
            <th>
                <button class="btn btn-sm" onclick="invertAll()">Invert</button>
            </th>
            <th>
                Name
            </th>
            <th>
                Assignments Requested
            </th>
            <th>
                Assignments Completed
            </th>
            <th>
                Expires
            </th>
            <th>
                Status
            </th>
        </tr>
        </thead>
        <tbody id="hitList">

        </tbody>

    </thead>
    </table>
</div>

</body>
</html>