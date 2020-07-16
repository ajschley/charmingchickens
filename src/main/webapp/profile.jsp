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
<div class="container" id="profileInfo">
    <div id="leftSide">
        <div id="pic">
            <h2>asdfasdfa</h2>
        </div>
        <div id="name">
            <h2>Alec Schley</h2>
        </div>
        <div id="about">
            <h3>Hello my name is Alec Schley, and I work for blah blah blah</h3>
        </div>
        <div id="edit">
            <form action="/editProfile" method="get">
                <button type="submit">Edit Profile</button>
            </form>
<%--            <button type="button" id="editButton">Edit Profile</button>--%>
        </div>
        <br>
        <div id="connections">
            <form action="/editProfile" method="get">
                <button type="submit">My Connections</button>
            </form>
            <%--            <button type="button" id="editButton">Edit Profile</button>--%>
        </div>
    </div>
    <div id="rightSide">
        <div id="businessTitle">
            <h2>Associated Businesses</h2>
        </div>
        <div id="businesses">
            <h3>Business</h3>
        </div>
        <div id="createCompany">
            <form action="/createCompany" method="get">
                <button type="submit">Create Company</button>
            </form>
            <%--            <button type="button" id="editButton">Edit Profile</button>--%>
        </div>
        <br>
        <div>
            <form action="/createCompany" method="get">
                <button type="submit">Join Company</button>
            </form>
        </div>
    </div>
    <div id="middle">
        <h1>Your Wall</h1>
        <div id="post">
            <label for="leavePost">Leave a post...</label>
            <input type="text" id="leavePost">
            <form action="/profile" method="get">
                <button type="submit">Post</button>
            </form>
<%--            <button type="button" id="postButton" onclick=setPost(>Post</button>--%>
        </div>
        <div id="pastPosts">
            <h4>asdfasdfsadfsdfsadfsdfsdfsdfsd</h4>
            <h4>asdfasdfsadfsdfsadfsdfsdfsdfsd</h4>
            <h4>asdfasdfsadfsdfsadfsdfsdfsdfsd</h4>
            <h4>asdfasdfsadfsdfsadfsdfsdfsdfsd</h4>
        </div>
    </div>
</div>
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>

