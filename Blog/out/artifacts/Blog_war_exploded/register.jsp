<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Hai
  Date: 6/24/2019
  Time: 7:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if lt IE 8 ]><html class="no-js ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="no-js ie ie8" lang="en"> <![endif]-->
<!--[if IE 9 ]><html class="no-js ie ie9" lang="en"> <![endif]-->
<!--[if (gte IE 8)|!(IE)]><!--><html class="no-js" lang="en"> <!--<![endif]-->
<head>

    <!--- Basic Page Needs
    ================================================== -->
    <meta charset="utf-8">
    <title>Keep It Simple.</title>
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- mobile specific metas
   ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS
    ================================================== -->
    <link rel="stylesheet" href="css/default.css">
    <link rel="stylesheet" href="css/layout.css">
    <link rel="stylesheet" href="css/media-queries.css">
    <!-- Script
    ================================================== -->
    <script src="js/modernizr.js"></script>

    <!-- Favicons
     ================================================== -->
    <link rel="shortcut icon" href="favicon.png">
    <script>
        function check(input) {
            if (input.value != document.getElementById("password").value){
                input.setCustomValidity("Password must be Matching");
            }else {
                input.setCustomValidity('');
            }
        }
        function checkLong(input) {
            if (input.value.length < 6){
                input.setCustomValidity("Input must be more than 6 character");
            }else {
                input.setCustomValidity('');
            }
        }
    </script>

</head>

<body class="page">

<!-- Header
================================================== -->
<header id="top">

    <div class="row">

        <div class="header-content twelve columns">

            <h1 id="logo-text"><a href="/home" title="">Keep It Simple</a></h1>
            <p id="intro">Simple blog</p>

        </div>

    </div>

    <nav id="nav-wrap">

        <a class="mobile-btn" href="#nav-wrap" title="Show navigation">Show Menu</a>
        <a class="mobile-btn" href="#" title="Hide navigation">Hide Menu</a>

        <div class="row">

            <ul id="nav" class="nav">
                <li><a href="/home">Home</a></li>
                <li><a href="/home?action=Javascript">Javascript</a></li>
                <li><a href="/home?action=Java">Java</a></li>
                <li><a href="/home?action=Python">Python</a></li>
                <%
                    if(session.getAttribute("Admin") == null){
                %>
                <li class="current"><a class="button" href="login.jsp">Login</a></li>
                <%} else{
                    if(session.getAttribute("role") == "admin"){
                %>
                <li><a href="admin.jsp">Management</a></li>
                <%} %>
                <li><a style="margin-left: 200px">Welcome ${sessionScope['Admin']}</a></li>
                <li><a href="<%=request.getContextPath()%>/LogoutServlet">Logout</a></li>
                <%} %>
            </ul> <!-- end #nav -->

        </div>

    </nav> <!-- end #nav-wrap -->

</header> <!-- Header End -->

<!-- Content
================================================== -->
<div id="content-wrap">

    <div class="row">

        <div id="main" class="eight columns">

            <section class="page">

                <div class="respond">
                        <p>
                            <c:if test='${requestScope["message"] != null}'>
                                <span class="message">${requestScope["message"]}</span>
                            </c:if>
                        </p>
                    <p>
                    <a href="/login.jsp">Back to login</a>
                    </p>
                    <h3>Dang ky thanh vien</h3>

                    <!-- form -->
                    <form name="contactForm" id="contactForm" method="post" >
                        <fieldset>

                            <div class="group">
                                <label for="username">Username <span class="required">*</span></label>
                                <input name="username" type="text" id="username" size="35" value="" required oninput="checkLong(this)"/>
                            </div>

                            <div class="group">
                                <label for="password">Password <span class="required">*</span></label>
                                <input name="password" type="password" id="password" size="35" value="" required oninput="checkLong(this)"/>
                            </div>

                            <div class="group">
                                <label for="rePassword">Re_Password <span class="required">*</span></label>
                                <input name="rePassword" type="password" id="rePassword" size="35" value="" oninput="check(this)"/>
                            </div>

                            <%--<div class="message group">
                                <label  for="cMessage">Message <span class="required">*</span></label>
                                <textarea name="cMessage"  id="cMessage" rows="10" cols="50" ></textarea>
                            </div>--%>

                            <button type="submit" class="submit">Submit</button>

                        </fieldset>
                    </form> <!-- Form End -->

                </div> <!-- Respond End -->

            </section> <!-- End page -->

        </div> <!-- End main -->


    </div> <!-- end row -->

</div> <!-- end content-wrap -->


<!-- Footer
================================================== -->
<footer>

</footer> <!-- End Footer-->


<!-- Java Script
================================================== -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="js/jquery-1.10.2.min.js"><\/script>')</script>
<script type="text/javascript" src="js/jquery-migrate-1.2.1.min.js"></script>
<script src="js/main.js"></script>

</body>

</html>
