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

    <title>News</title>

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

    <div id="news-section">
        <div id="news-title">
            <br><br><h1 style="margin-left: 25px; font-size: 70px; text-align: left">Events</h1>
            <h1 style="margin-left: 25px; font-size: 50px; text-align: left">Get active in your community, and join like-minded peers for our sponsored events. These are engineered and geared towards those who are reaching for the stars!
            </h1>
        </div>
        <br>
        <div id="news-about">
            <div id="event1">
                <div id="event1text">
                    <br>
                    <div>
                        <h3>Holiday Hackathon 2020</h3>
                        <p>Routinely hosted in our home base of Milwaukee, Wisconsin, the StartUS annual Holiday Hackathon is an informal gathering of those involved in software development.  Naturally, the ultimate goal for all those participating is to win the <b>$5000</b> grand prize, which was accumulated through the generous donations of our business partness.  However, it is also an excellent opportunity to learn new programming languages, improve upon your understanding of operating systems, and create an original and awesome application.  Additionally, you will be simultaneously interacting with peers, helping to broaden your network of associates, our primary mission here at StartUS.  Could you ask for a more constructive event?                            <br><br>
                            While the most prevalent of attendees are professionals in the industry, we also welcome those who are simply interested in learning more and having a good time as well.  We've spent countless hours developing a balanced schedule, which is considerate of all participants, no matter their skill level. the Holiday Hackathon is sure to teach you something new, improve upon your current skills, or provide you with an opportunity to connect and network with new faces.
                            <br><br>
                            This years Holiday Hackathon will begin at 9am on Friday, December 11th, and it will end at 5pm on Saturday, December 12th.  In consideration of the COVID-19 pandemic plaguing nations across the globe, we are carefully monitoring the current statistics each day.  While we have yet to decide if this years event will continue to be held in person, or if it will be moved online, you should anticipate updates from us.  Regardless, don't be late to the fun!</p>
                    </div>
                </div>
                <div id="event1pic">
                    <div>
                        <img id="epic" src="commons_pic_2.jpg">
                    </div>
                </div>
            </div>
            <div id="event2">
                <div id="event2text">
                    <div>
                        <h3>Coffee & Community</h3>
                        <p>After a number of pandemic related delays, the StartUS team is ecstatic to formally invite you all to our first annual Coffee & Community event.  We've worked hard to get this event off the ground, and we can assure all attendees that we've taken the necessary precautions to combat the spread of COVID-19.  This event will take place on August 20th, 2020, hosted in our home base located in Milwaukee, Wisconsin.<br><br>
                        Coffee & Community is a networking event where you will get a chance to get to know other small business owners in our community.  You will be able to chat over a cup of coffee and other appetizers.  Furthermore, you will be provided with a list of contact information so you can later on reach out to those who you talked to during the event.
                        <br><br>Additionally, we've assembled a group of knowledgeable entrepreneurs from across the state to speak at the event.  These talks are designed to introduce up and coming entrepreneurs to some of the important and relevant concepts that apply to starting a business.  Seasoned entrepreneurs are more than welcome to join us, in fact we encourage it.  At StartUs, our goal is to help support small business owners through our platforms,
                            and help facilitate communications between our users.  If you feel as though you have something to say during this event, don't be afraid to contact us, for the best way to learn is from others.
                            <br><br>From the StartUS team, we hope you can make it!
                        </p>
                    </div>
                </div>
                <div id="event2pic">
                    <div>
                        <img id="e2pic" src="commons_pic_8.png">
                    </div>
                </div>
            </div>
            <div id="event3">
                <div id="event3text">
                    <div>
                        <h3>Holiday Hackathon 2020</h3>
                        <p> So, what is VR? Well, if you don't already know, VR stands for virtual reality. It is a simulated experience that can be similar to or different from the real world. For our purposes, we are working to create the most realistic dental simulations available on the market today. With the COVID-19 pandemic hitting us hard these past few months, practicing dental surgeries on real patients is unsafe, and it is our hope that you share this belief. <br><br>All across the globe, people are staying safe by turning to technology to socialize with friends, and engage with coworkers. But while these applications of virtual technology apply to all people, students have taken a huge blow to their educations. Now, practically every school has been forced to adjust. Classes are being offered online, but we know that it's just not the same as engaging with teachers and peers. For dental students, these changes make it almost impossible to practice. Therefore, it is more than likely that most dental students will have to spend more time at school, leading to increasing amounts of debt. In fact, before the pandemic, the average dental student graduates with <p1><b>$292,169</b></p1> in student loan debt. Simulating Smiles wants to eliminate that debt, or at least some of it! With our simulations students can practice their skills whenever they want, without consequences, so that they can keep their graduation rate on track.<br><br> Additionally, as an oral healthcare provider,or prospective oral healthcare provider, it is your resposibility to care for your patients in the best way possible, and right now, Simulating Smiles is working to offer you the ability to learn without human contact.Right now, Simulating Smiles is working to make our simulations compatible with all virtual reality systems available on the market today.
                        </p>
                    </div>
                </div>
                <div id="event3pic">
                    <div>
                        <img id="e3pic" src="commons_pic_5.jpg">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
