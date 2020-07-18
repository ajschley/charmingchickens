<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Profile</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="container">

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="homeForm" method="GET" action="/welcome">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <form id="profileForm" method="GET" action="/profile">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <form id="discoverForm" method="GET" action="/discover">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <h2>Welcome ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['homeForm'].submit()">Home</a> | <a onclick="document.forms['profileForm'].submit()">My Profile</a>  | <a onclick="document.forms['discoverForm'].submit()">Discover</a> | <a onclick="document.forms['notificationsForm'].submit()">Notifications</a> | <a onclick="document.forms['News'].submit()">News</a> | <a onclick="document.forms['logoutForm'].submit()">Logout</a></h2>
    </c:if>

</div>
<div class="container">

    <form:form method="POST" modelAttribute="editForm" class="form-signin">
        <h2 class="form-signin-heading">Profile</h2>
        <spring:bind path="name">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="name" class="form-control" placeholder="Please enter your full name"
                            autofocus="true"></form:input>
                <form:errors path="name"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="email">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="email" class="form-control" placeholder="Please enter your email"
                            autofocus="true"></form:input>
                <form:errors path="email"></form:errors>
                    <%--                <form:input type="text" path="location" class="form-control" placeholder="Location"></form:input>--%>
            </div>
        </spring:bind>

        <spring:bind path="about">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="about" class="form-control" placeholder="Tell us about yourself"
                            autofocus="true"></form:input>
                <form:errors path="about"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="from1">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:select path="from1" class="form-control">
                    <form:option value="NONE" label="--- Select a Start Hour ---"/>
                    <form:option value="1" item="1" />
                    <form:option value="2" item="2" />
                    <form:option value="3" item="3" />
                    <form:option value="4" item="4" />
                    <form:option value="5" item="5" />
                    <form:option value="6" item="6" />
                    <form:option value="7" item="7" />
                    <form:option value="8" item="8" />
                    <form:option value="9" item="9" />
                    <form:option value="10" item="10" />
                    <form:option value="11" item="11" />
                    <form:option value="12" item="12" />
                </form:select>
                <form:errors path="from1"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="from2">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:select path="from2" class="form-control">
                    <form:option value="NONE" label="--- Select a Start Minute ---"/>
                    <form:option value="00" item="00" />
                    <form:option value="15" item="15" />
                    <form:option value="30" item="30" />
                    <form:option value="45" item="45" />
                </form:select>
                    <%--                <form:input type="text" path="location" class="form-control" placeholder="Location"></form:input>--%>
                <form:errors path="from2"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="to1">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:select path="to1" class="form-control">
                    <form:option value="NONE" label="--- Select an End Hour ---"/>
                    <form:option value="1" item="1" />
                    <form:option value="2" item="2" />
                    <form:option value="3" item="3" />
                    <form:option value="4" item="4" />
                    <form:option value="5" item="5" />
                    <form:option value="6" item="6" />
                    <form:option value="7" item="7" />
                    <form:option value="8" item="8" />
                    <form:option value="9" item="9" />
                    <form:option value="10" item="10" />
                    <form:option value="11" item="11" />
                    <form:option value="12" item="12" />
                </form:select>
                <form:errors path="to1"></form:errors>

            </div>
        </spring:bind>

        <spring:bind path="to2">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:select path="to2" class="form-control">
                    <form:option value="NONE" label="--- Select an End Minute ---"/>
                    <form:option value="00" item="00" />
                    <form:option value="15" item="15" />
                    <form:option value="30" item="30" />
                    <form:option value="45" item="45" />
                </form:select>
                <form:errors path="to2"></form:errors>
            </div>
        </spring:bind>
        <%--                <form:input type="text" path="location" class="form-control" placeholder="Location"></form:input>--%>

        <spring:bind path="recurring">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:select path="recurring" class="form-control">
                    <form:option value="NONE" label="--- Select a Frequency ---"/>
                    <form:option value="Daily" item="Daily" />
                    <form:option value="Weekly" item="Weekly" />
                    <form:option value="Monthly" item="Monthly" />
                </form:select>
                <form:errors path="recurring"></form:errors>
            </div>
        </spring:bind>

        <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
    </form:form>

</div>
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>


