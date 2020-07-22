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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
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
        <form id="newsForm" method="GET" action="/news">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <h2>Welcome ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['homeForm'].submit()">Home</a> | <a onclick="document.forms['profileForm'].submit()">My Profile</a>  | <a onclick="document.forms['discoverForm'].submit()">Discover</a> | <a onclick="document.forms['notificationsForm'].submit()">Notifications</a> | <a onclick="document.forms['newsForm'].submit()">News</a> | <a onclick="document.forms['logoutForm'].submit()">Logout</a></h2>
    </c:if>

</div>
<br>
<div class="container">
    <div id="leftSide">
        <%--        <div id="pic">--%>
        <%--            <h2>asdfasdfa</h2>--%>
        <%--        </div>--%>
        <br>
        <div id="profilePic-container">
            <image id="profileImage" src="commons_pic_3.jpeg" />

            <%--            <input id="imageProfile" type="file" name="profile_photo" placeholder="Photo" required="" capture>--%>
        </div>
        <input id="imageUpload" type="file" name="profile_photo" placeholder="Photo" required="" capture>
        <div id="name">
            <h1>${profileForm.name}</h1>
        </div>
        <div id="email">
            <h3>${profileForm.email}</h3>
        </div>
        <br>
        <div id="profileAbout">
            <div id="about">
                <h3 style="text-align: left; margin-left: 10px"><u>Bio:</u></h3>
                <h4 style="text-align: left; margin-left: 10px">${profileForm.about.trim()}</h4>
            </div>
        </div>
        <br>
        <div id="officeHours">
            <h3 style="text-align: left; margin-left: 10px"><u>Office Hours: ${profileForm.recurring}</u></h3>
            <h4>Start: ${profileForm.from1}:${profileForm.from2} | End: ${profileForm.to1}:${profileForm.to2}</h4>
        </div>
        <br>
        <div id="edit">
            <form action="/editProfile" method="get">
                <button class="profileButton" type="submit">Edit Profile</button>
            </form>
            <%--            <button type="button" id="editButton">Edit Profile</button>--%>
        </div>
        <br>
        <div id="connections">
            <form action="/connections" method="get">
                <button class="profileButton" type="submit">My Connections</button>
            </form>
            <%--            <button type="button" id="editButton">Edit Profile</button>--%>
        </div>
        <br>
    </div>
    <div id="rightSide">
        <div id="businessTitle">
            <br>
            <h1>Companies</h1>
            <br>
        </div>
        <div id="businessInfo">
            <c:forEach items="${results}" var="item">
                <c:if test="${item.key == 1}">
                    <h4 style="height: 50px;margin: auto;text-align: left; margin-left: 10px">${item.value}<button style="float: right" type="submit">View</button></h4>
                </c:if>
                <h4 style="height:50px;margin: auto;padding-top: 5px; border-top: 1px dashed black; text-align: left; margin-left: 10px">${item.value}<button style="float: right" type="submit">View</button></h4>
            </c:forEach>
        </div>
        <br>
        <div id="createCompany">
            <form action="/createCompany" method="get">
                <button class="profileButton" type="submit">Create Company</button>
            </form>
            <%--            <button type="button" id="editButton">Edit Profile</button>--%>
        </div>
        <br>
        <div id="joinCompany">
            <form action="/joinCompany" method="get">
                <button class="profileButton" type="submit">Join Company</button>
            </form>
        </div>
        <br>
    </div>
    <div id="middle" >
        <br>
        <div id="post" style="text-align: left; margin-left: 25px">
            <form:form method="POST" modelAttribute="profileForm">
                <h1 class="form-signin-heading"><u>Your Wall</u></h1>
                <spring:bind path="post">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:textarea rows="5" cssStyle="font-size: medium; width: 95%; text-align: left" type="text" path="post" class="form-control" placeholder="Leave a post..."></form:textarea>
                        <form:errors path="post"></form:errors>
                    </div>
                </spring:bind>

                <button style="text-align: left" type="submit">Post</button>

            </form:form>
            <%--            <form name="theform">--%>
            <%--                <textarea id="p" style="border:1px solid black" rows="5" cols="57" placeholder="Leave a post..." onKeyup="checkform()"></textarea>--%>
            <%--            </form>--%>
            <%--            <form action="/post" method="post">--%>
            <%--                <input id="submitbutton2" type="submit" disabled="disabled" value="Post" />--%>
            <%--            </form>--%>
        </div>
        <br>
        <div id="pastPosts" >
            <h1 class="form-signin-heading" style="text-align: left; margin-left: 25px"><u>Past Activity</u></h1>
            <c:forEach items="${results2}" var="item">
                <div style="text-align: left; margin-left: 25px; margin-right: 25px" id="posts">
                    <h4 style="text-align: left; margin-left: 10px; padding-bottom: 30px">${item.value}</h4>
                </div><br>
            </c:forEach>
        </div>
    </div>
</div>
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
<script>
    $("#profileImage").click(function(e) {
        $("#imageUpload").click();
    });
    function fasterPreview( uploader ) {
        if ( uploader.files && uploader.files[0] ){
            $('#profileImage').attr('src',
                window.URL.createObjectURL(uploader.files[0]) );
            <%--            ${profileForm.profilePic} = $('#profileImage').src.valueOf();--%>
            ${profileForm.profilePic} = new URL(window.URL.createObjectURL(uploader.files[0]) );
        }
    }
    $("#imageUpload").change(function(){
        fasterPreview( this );
    });
</script>
</html>


