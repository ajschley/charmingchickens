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
<input type="hidden" id="results"/>
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

        <h2>Welcome ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['homeForm'].submit()">Home</a> | <a onclick="document.forms['profileForm'].submit()">My Profile</a>  | <a onclick="document.forms['discoverForm'].submit()">Discover</a> | <a onclick="document.forms['messageForm'].submit()">Messaging</a> | <a onclick="document.forms['notificationsForm'].submit()">Notifications</a> | <a onclick="document.forms['logoutForm'].submit()">Logout</a></h2>
    </c:if>

</div>
<div class="container">

    <form:form method="POST" modelAttribute="discoverForm" class="form-signin">
        <h2 class="form-signin-heading">Discover</h2>
        <spring:bind path="search">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="search" class="form-control" placeholder="Search"></form:input>
                <form:errors path="search"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="searchType">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:radiobutton path="searchType" value="user"/>User
                <form:radiobutton path="searchType" value="company"/>Company
                <form:errors path="searchType"></form:errors>
            </div>
        </spring:bind>

        <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>

    </form:form>

</div>
<div>
    <c:if test="${(discoverForm.search != null)}">
        <c:forEach items="${results}" var="item">
            <h3>${item.value}</h3><br>
        </c:forEach>
    </c:if>
</div>

<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
