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

    <title>Join Company</title>

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
        <form id="newsForm" method="GET" action="/news">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <h2>Welcome ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['homeForm'].submit()">Home</a> | <a onclick="document.forms['profileForm'].submit()">My Profile</a>  | <a onclick="document.forms['discoverForm'].submit()">Discover</a> | <a onclick="document.forms['notificationsForm'].submit()">Notifications</a> | <a onclick="document.forms['newsForm'].submit()">News</a> | <a onclick="document.forms['logoutForm'].submit()">Logout</a></h2>
    </c:if>

</div>
<div class="container">

    <form:form method="POST" modelAttribute="joinCompanyForm" class="form-signin">
        <h2 class="form-signin-heading">Profile</h2>
        <spring:bind path="search">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="search" class="form-control" placeholder="Business Name"
                            autofocus="true"></form:input>
                <form:errors path="search"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="searchType">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:select path="searchType" class="form-control">
                    <form:option value="NONE" label="--- Select an Industry ---"/>
                    <form:option value="Aviation" item="Aviation" />
                    <form:option value="Arts" item="Arts" />
                    <form:option value="Business" item="Business" />
                    <form:option value="Education" item="Education" />
                    <form:option value="Law Enforcement" item="Law Enforcement" />
                    <form:option value="Media" item="Media" />
                    <form:option value="Medical" item="Medical" />
                    <form:option value="Service" item="Service" />
                    <form:option value="Technology" item="Technology" />
                </form:select>
                    <%--                <form:input type="text" path="location" class="form-control" placeholder="Location"></form:input>--%>
                <form:errors path="searchType"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="location">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:select path="location" class="form-control">
                    <form:option value="NONE" label="--- Select a Location ---"/>
                    <form:option value="Alabama" item="Alabama" />
                    <form:option value="Alaska" item="Alaska" />
                    <form:option value="Arizona" item="Arizona" />
                    <form:option value="Arkansas" item="Arkansas" />
                    <form:option value="California" item="California" />
                    <form:option value="Colorado" item="Colorado" />
                    <form:option value="Connecticut" item="Connecticut" />
                    <form:option value="Delaware" item="Delaware" />
                    <form:option value="Florida" item="Florida" />
                    <form:option value="Georgia" item="Georgia" />
                    <form:option value="Hawaii" item="Hawaii" />
                    <form:option value="Idaho" item="Idaho" />
                    <form:option value="Illinois" item="Illinois" />
                    <form:option value="Indiana" item="Indiana" />
                    <form:option value="Iowa" item="Iowa" />
                    <form:option value="Kansas" item="Kansas" />
                    <form:option value="Kentucky" item="Kentucky" />
                    <form:option value="Louisiana" item="Louisiana" />
                    <form:option value="Maine" item="Maine" />
                    <form:option value="Maryland" item="Maryland" />
                    <form:option value="Massachusetts" item="Massachusetts" />
                    <form:option value="Michigan" item="Michigan" />
                    <form:option value="Minnesota" item="Minnesota" />
                    <form:option value="Mississippi" item="Mississippi" />
                    <form:option value="Missouri" item="Missouri" />
                    <form:option value="Montana" item="Montana" />
                    <form:option value="Nebraska" item="Nebraska" />
                    <form:option value="Nevada" item="Nevada" />
                    <form:option value="New Hampshire" item="New Hampshire" />
                    <form:option value="New Jersey" item="New Jersey" />
                    <form:option value="New Mexico" item="New Mexico" />
                    <form:option value="New York" item="New York" />
                    <form:option value="North Carolina" item="North Carolina" />
                    <form:option value="North Dakota" item="North Dakota" />
                    <form:option value="Ohio" item="Ohio" />
                    <form:option value="Oklahoma" item="Oklahoma" />
                    <form:option value="Oregon" item="Oregon" />
                    <form:option value="Pennsylvania" item="Pennsylvania" />
                    <form:option value="Rhode Island" item="Rhode Island" />
                    <form:option value="South Carolina" item="South Carolina" />
                    <form:option value="South Dakota" item="South Dakota" />
                    <form:option value="Tennessee" item="Tennessee" />
                    <form:option value="Texas" item="Texas" />
                    <form:option value="Utah" item="Utah" />
                    <form:option value="Vermont" item="Vermont" />
                    <form:option value="Virginia" item="Virginia" />
                    <form:option value="Washington" item="Washington" />
                    <form:option value="West Virginia" item="West Virginia" />
                    <form:option value="Wisconsin" item="Wisconsin" />
                    <form:option value="Wyoming" item="Wyoming" />
                </form:select>
                    <%--                <form:input type="text" path="location" class="form-control" placeholder="Location"></form:input>--%>
                <form:errors path="location"></form:errors>
            </div>
        </spring:bind>

        <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
    </form:form>

</div>
<br>
<div id="searchResults" class="container" style="padding-bottom: 15px">
    <h2>Results</h2>
    <div>
        <c:if test="${(joinCompanyForm.search != null)}">
            <c:forEach items="${results}" var="item">
<%--                <div id="company">--%>
                    <h3 style="padding-top: 15px; border-top: 1px dashed black">${item.value}<button style="float: right" type="submit">Join</button></h3>
<%--                </div>--%>

            </c:forEach>
        </c:if>
    </div>
</div>
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
