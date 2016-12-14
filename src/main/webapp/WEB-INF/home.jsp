<%@ taglib prefix="sm" uri="http://jsmartframework.com/v2/jsp/taglib/jsmart" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>JSmart Framework - Rest Archetype</title>
    </head>

    <body class="container">

        <!-- Example of REST request sent via rest component to RequestPath mapped on server -->
        <div class="col-md-6" style="float: none; margin: auto; margin-top: 50px;">

            <!--
                The rest component is used to facilitate the process of sending input data
                via REST request as JSON or XML
            -->
            <sm:rest endpoint="/home/v1/test" method="post">
                <sm:output type="p" value="Enter the values below and push the button to send via Rest" />

                <!--
                    The rest attribute on components indicate the REST attribute name to
                    be sent on payload as tag name for XML or key name for JSON
                -->
                <sm:input rest="input" label="@{texts.rest.archetype.input.label}">
                    <sm:validate text="The input value is required" />
                </sm:input>

                <sm:checkgroup label="Check group values" rest="checkGroup" inline="true">
                    <sm:check label="checkOne" value="checkOne"/>
                    <sm:check label="checkTwo" value="checkTwo"/>
                    <sm:check label="checkThree" value="checkThree"/>
                    <sm:check label="checkFour" value="checkFour"/>
                    <sm:validate text="At least one check group check is required" />
                </sm:checkgroup>

                <!--
                    Here is where the REST request will be triggered, the button attributes to register
                    callbacks for AJAX request phases
                -->
                <sm:button id="rest-btn" ajax="true" label="Rest Request" onSuccess="requestOk" style="float: right;">

                    <!-- This parameters will be sent as query parameters -->
                    <sm:param name="paramOne" value="valueOne" />
                    <sm:param name="paramTwo" value="valueTwo" />

                    <!-- Glyphicon to be placed inside button -->
                    <sm:icon name="glyphicon-globe" />

                    <!-- Animated load will replace the icon during the request -->
                    <sm:load />
                </sm:button>

            </sm:rest>

            <sm:panel id="rest-response" style="display: none; margin-top: 70px;">
                <sm:header title="Rest response as JSON" />
                <sm:panelbody id="rest-response-body">
                    <!-- The REST request response will be placed here -->
                </sm:panelbody>
            </sm:panel>
        </div>

        <!-- Callback functions -->
        <script type="text/javascript">
            function requestOk(data, status, xhr) {
                $('#rest-response-body').text(JSON.stringify(data, null, '\t'));
                $('#rest-response').show();
            }
        </script>
    </body>

</html>
