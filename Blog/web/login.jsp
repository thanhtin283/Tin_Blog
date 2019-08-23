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

</head>

<body class="page">

<!-- Header
================================================== -->
<header id="top">

    <div class="row">

        <div class="header-content twelve columns">

            <h1 id="logo-text"><a href="index.html" title="">Keep It Simple</a></h1>
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
                <li class="current"><a class="button"  href="login.jsp">Login</a></li>
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

                    <h3>Already have account? Login please!</h3>

                    <!-- form -->
                    <form name="loginForm" id="loginForm" method="post" action="<%=request.getContextPath()%>
                    /LoginServlet" onsubmit="return validate()">
                        <fieldset>

                            <div class="group">
                                <label for="loginUsername">Username <span class="required">*</span></label>
                                <input name="loginUsername" type="text" id="loginUsername" size="35" value=""/>
                            </div>

                            <div class="group">
                                <label for="loginPassword">Password <span class="required">*</span></label>
                                <input name="loginPassword" type="password" id="loginPassword" size="35" value=""/>
                            </div>

                            <div class="group">
                                <span style="color:red"><%=(request.getAttribute("errMessage") == null) ? ""
                                        : request.getAttribute("errMessage")%></span>
                            </div>

                            <button type="submit" class="submit">Login</button> <button type="reset" class="submit">Reset</button> <button type="submit" class="submit"><a href="users?action=create" style="color: white">Register</a></button>

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

<script>
    function validate() {
        var username = document.loginForm.loginUsername.value;
        var password = document.loginForm.loginPassword.value;

        if (username === null || username === "") {
            alert("Username cannot be blank");
            return false;
        } else if (password === null || password === "") {
            alert("Password cannot be blank");
            return false;
        }
    }
</script>

</body>

</html>
