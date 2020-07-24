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
        <br>
        <div id="profilePic-container">
            <image id="profileImage" src="commons_pic_3.jpeg" />
        </div>
        <%--        <input id="imageUpload" type="file" name="profile_photo" placeholder="Photo" required="" capture>--%>
        <div id="name">
            <h1>${viewCompanyForm.businessName}</h1>
        </div>
        <br>
    </div>
    <div id="rightSide">
        <div id="businessTitle">
            <br>
            <h1>My Companies</h1>
            <br>
        </div>
        <div id="employeeInfo">
            <c:forEach items="${results}" var="item">
                <div style="text-align: left; margin-left: 15px; margin-right: 15px"; border-bottom: 1px dashed black; >
                    <h4 style="padding-top: 5px; text-align: left; margin-left: 10px">${item.value}<button style="background-color: white; width: 50px; float: right; font-size: 12px" type="submit">View</button></h4>
                </div><br>
            </c:forEach>
            <c:forEach items="${results2}" var="item">
                <div style="text-align: left; margin-left: 15px; margin-right: 15px; border-bottom: 1px dashed black; ">
                    <h4 style="padding-top: 5px; text-align: left; margin-left: 10px">${item.value}<button style="background-color: white; width: 50px; float: right; font-size: 12px" type="submit">View</button></h4>
                </div><br>
            </c:forEach>
        </div>
        <br>
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
        }
    }
    $("#imageUpload").change(function(){
        fasterPreview( this );
    });
    // function checkform() {
    //     var f = document.forms["theform"].elements;
    //     var cansubmit = true;
    //     for (var i = 0; i < f.length; i++) {
    //         if (f[i].value.length == 0) cansubmit = false;
    //     }
    //     document.getElementById('submitbutton').disabled = !cansubmit;
    // }
</script>
</html>
