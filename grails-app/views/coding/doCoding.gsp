<%--
  Created by IntelliJ IDEA.
  User: josh
  Date: 7/8/15
  Time: 9:16 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title></title>
</head>

<body>

<div class="container">
    <h2>Social Support in Forums</h2>

    <div class="well well-lg">
        In online support groups, members may offer one another different kinds of support:
        <br/> <br/>
        <ul>
            <li><em><b>Emotional support</b>
            </em> messages provide understanding, encouragement, affirmation, sympathy, or caring.
            </li>
            <li><em><b>Informational support</b></em> messages provide advice, referrals or knowledge.</li>
        </ul>

        With these definitions in mind, read the forum post below and indicate the kinds of support it contains.
    </div>

    <div class="col-md-6">
        <h3>Forum Post</h3>
        <blockquote>
            <p id="toSelect">
                ${textToMarkup}
            </p>
        </blockquote>
    </div>
    <g:form action="submitCoding">
        <div class="stage1">
            <div class="col-md-6">
                <h3>Emotional support</h3>

                <div class="bg-info padme">
                    <p>
                        Use your mouse to highlight up to five words or phrases in the post that are evidence of <b>emotional support</b> (there may not be any!).
                    <g:textField id="selectedEmoText" name="selectedEmoText"/>
                    </p>
                </div>



                <br/>

                <div class="clearfix bg-info padme">

                    How much <b>emotional support</b> does this forum post provide?

                    <div class="text-center">
                        <ul class="likert">
                            <li>None</li>
                            <g:radioGroup values="${1..7}"
                                          name="emotionRating" onchange="jQuery('#advanceButton').prop('disabled',false);">
                                <li>${it.radio}</li>

                            </g:radioGroup>
                            <li>A great deal</li>
                        </ul>
                    </div>

                </div>


                <br/>

                <div>
                    <button id="advanceButton" type="button" class="btn btn-lg btn-primary" disabled="disabled" onclick="$('.stage1').hide();
                    $('.stage2').show();resetStage();">Continue</button>
                </div>

            </div>
        </div>

        <div class="stage2">
            <div class="col-md-6">
                <h3>Informational support</h3>


                <div class="bg-info padme">
                    <p>
                        Use your mouse to highlight up to five words or phrases in the post that are evidence of <b>informational support</b> (there may not be any!).
                    <g:textField id="selectedInfoText" name="selectedInfoText"/>
                    </p>
                </div>
                <br/>
                <div class="clearfix bg-info padme">
                    How much <b>informational support</b> does this post provide?
                    <div class="text-center">
                        <ul class="likert">
                            <li>None</li>
                            <g:radioGroup values="${1..7}"
                                          name="informationRating" onchange="jQuery('#submitButton').prop('disabled',false);">
                                <li>${it.radio}</li>

                            </g:radioGroup>
                            <li>A great deal</li>
                        </ul>
                    </div>
                </div>


                <br/>

                <div>
                    <button class="btn btn-lg btn-default" type="button" onclick="$('.stage2').hide();
                    $('.stage1').show();
                    resetStage();">&lt;-- Go back</button>
                    <g:submitButton id="submitButton" class="btn btn-lg btn-primary" name="Submit" disabled="disabled">Submit answers</g:submitButton>
                </div>

            </div>
        </div>
    </g:form>

</div>

</body>
</html>