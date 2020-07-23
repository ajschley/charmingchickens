<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

    <title>Welcome</title>

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
<br>
<div class="container">
    <div id="home">
        <br><br><br><br><br><br><br><br><br><br><br><h1 style="font-size: 70px; color: white; -webkit-text-stroke-width: 1px; -webkit-text-stroke-color: black; margin-left: 25px">StartUS</h1>
        <h1 style="font-size: 50px; color: white; -webkit-text-stroke-width: 1px; -webkit-text-stroke-color: black; margin-left: 25px">We're Working Hard Each Day</h1>
        <h1 style="font-size: 50px; color: white; -webkit-text-stroke-width: 1px; -webkit-text-stroke-color: black; margin-left: 25px">to Connect Minority Owned</h1>
        <h1 style="font-size: 50px; color: white; -webkit-text-stroke-width: 1px; -webkit-text-stroke-color: black; margin-left: 25px">Businesses Across the USA</h1><br>
    </div>
    <br>
    <div id="ourmission">
        <h2><u>Our Mission</u></h2>
        <p>Our mission is to provide resources for minority owned businesses to start, and continue growing, their businesses without the worry of being discriminated against.
        </p>
    </div>
    <br>
    <div id="about">
        <h2><u>What is StartUS?</u></h2>
            <div id="abouttext">
                <div>
                    <h3>How Can We Help Your Business?</h3>
                    <p> So, what is VR? Well, if you don't already know, VR stands for virtual reality. It is a simulated experience that can be similar to or different from the real world. For our purposes, we are working to create the most realistic dental simulations available on the market today. With the COVID-19 pandemic hitting us hard these past few months, practicing dental surgeries on real patients is unsafe, and it is our hope that you share this belief. <br><br>All across the globe, people are staying safe by turning to technology to socialize with friends, and engage with coworkers. But while these applications of virtual technology apply to all people, students have taken a huge blow to their educations. Now, practically every school has been forced to adjust. Classes are being offered online, but we know that it's just not the same as engaging with teachers and peers. For dental students, these changes make it almost impossible to practice. Therefore, it is more than likely that most dental students will have to spend more time at school, leading to increasing amounts of debt. In fact, before the pandemic, the average dental student graduates with <p1><b>$292,169</b></p1> in student loan debt. Simulating Smiles wants to eliminate that debt, or at least some of it! With our simulations students can practice their skills whenever they want, without consequences, so that they can keep their graduation rate on track.<br><br> Additionally, as an oral healthcare provider,or prospective oral healthcare provider, it is your resposibility to care for your patients in the best way possible, and right now, Simulating Smiles is working to offer you the ability to learn without human contact.Right now, Simulating Smiles is working to make our simulations compatible with all virtual reality systems available on the market today.
                    </p>
                </div>
            </div>
            <div id="aboutpic">
                <div>
                    <img id="apic" src="commons_pic_1.jpg">
                </div>
            </div>
    </div>
    <div id="team">
        <div id teamText style="text-align: left">
            <h2><u>Meet Our Team</u></h2>
            <p>Meet our team, who are tirelessly working to bring equal opportunities to minority businesses across the United States.</p>
        </div>

        <div id="members">
            <div id="row">
                <div id="column">
                    <img id="tpic" src="alec-headshot.jpg" />
                    <p>Alec joined StartUS in 2020. </p>
                </div>
                <div id="column">
                    <img id="tpic" src="commons_pic_6.jpg" />
                    <p>Donovan joined StartUS in 2020. </p>
                </div>
            </div>
            <div id="row">
                <div id="column">
                    <img id="tpic" src="commons_pic_7.png" />
                    <p>Brian joined StartUS in 2020. </p>
                </div>
                <div id="column">
                    <img id="tpic" src="alec-headshot.jpg" />
                    <p>Alec joined StartUS in 2020. </p>
                </div>
            </div>
            <div id="row">
                <div id="column">
                    <img id="tpic" src="alec-headshot.jpg" />
                    <p>Alec joined StartUS in 2020. </p>
                </div>
            </div>
        </div>
    </div>
    <div id="contact">
        <div id="contactus">
            <h2><u>Contact Us</u></h2>
            <div id="messagebox">
                <form name="theform">
                    <input style="border: solid gray" type="text" size="25" id="name" name="name" placeholder="Please Enter Your Username"><br><br>
                    <textarea style="border: solid gray" rows="5" cols="50" onKeyup="checkform()" placeholder="Please Enter Your Message"></textarea><br>
                    <input onclick="addEmail()" id="submitbutton" type="submit" disabled="disabled" value="Contact" />
                </form>
            </div>
        </div>
    </div>
</div>

<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
<script>
    function checkform() {
        var f = document.forms["theform"].elements;
        var cansubmit = true;
        for (var i = 0; i < f.length; i++) {
            if (f[i].value.length == 0) cansubmit = false;
        }
        document.getElementById('submitbutton').disabled = !cansubmit;
    }
</script>
</html>
