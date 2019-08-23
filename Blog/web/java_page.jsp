<%--
  Created by IntelliJ IDEA.
  User: Hai
  Date: 6/24/2019
  Time: 7:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<body>

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
                <li class="current"><a class="button"  href="/home?action=Java">Java</a></li>
                <li><a href="/home?action=Python">Python</a></li>
                <%
                    if(session.getAttribute("Admin") == null){
                %>
                <li><a href="login.jsp">Login</a></li>
                <%} else{
                    if(session.getAttribute("role") == "admin"){
                %>
                <li><a href="admin.jsp">Management</a></li>
                <%} %>
                <li><a style="margin-left: 200px" href="/users?action=view&id=${sessionScope['idUser']}">Welcome ${sessionScope['Admin']}</a></li>
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

            <c:forEach items="${requestScope['postByCategory']}" var="post">
                <article class="entry">

                    <header class="entry-header">

                        <h2 class="entry-title">
                            <a href="/posts?action=view&id=${post.getId()}" title="">${post.getTitle()}</a>
                        </h2>

                        <div class="entry-meta">
                            <ul>
                                <li>${post.getDateCreated()}</li>
                                <span class="meta-sep">&bull;</span>
                                <li>${post.getCreator()}</li>
                            </ul>
                        </div>

                    </header>

                    <div class="entry-content">
                        <p>
                                ${post.getIntroduce()}
                        </p>
                    </div>

                </article>
                <!-- end entry -->
            </c:forEach>

            <div class="pagenav">
                <p>
                    <a rel="prev" href="#">Prev</a>
                    <a rel="next" href="#">Next</a>
                </p>
            </div>


        </div> <!-- end main -->

        <div id="sidebar" class="four columns">

            <div class="widget widget_search">
                <h3>Search</h3>
                <form method="post" action="/home?action=search">

                    <input type="text" value="Search here..." name="search" id="search"
                           onblur="if(this.value == '') { this.value = 'Search here...'; }"
                           onfocus="if (this.value == 'Search here...') { this.value = ''; }" class="text-search">
                    <input type="submit" value="" class="submit-search">

                </form>
            </div>

            <div class="widget widget_categories group">
                <h3>Categories.</h3>
                <ul>
                    <li><a href="/home?action=Javascript">Javascript</a></li>
                    <li><a href="/home?action=Java" title="">Java</a></li>
                    <li><a href="/home?action=Python" title="">Python</a></li>
                </ul>
            </div>

        </div> <!-- end sidebar -->

    </div> <!-- end row -->

</div> <!-- end content-wrap -->


<!-- Footer
================================================== -->
<footer>

    <div class="row">

        <div class="twelve columns">
            <ul class="social-links">
                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                <li><a href="#"><i class="fa fa-github-square"></i></a></li>
                <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                <li><a href="#"><i class="fa fa-flickr"></i></a></li>
                <li><a href="#"><i class="fa fa-skype"></i></a></li>
            </ul>
        </div>

        <div class="six columns info">

            <h3>About Keep It Simple</h3>

            <p>This is Photoshop's version of Lorem Ipsum. Proin gravida nibh vel velit auctor aliquet.
                Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem
                nibh id elit.
            </p>

            <p>Lorem ipsum Sed nulla deserunt voluptate elit occaecat culpa cupidatat sit irure sint
                sint incididunt cupidatat esse in Ut sed commodo tempor consequat culpa fugiat incididunt.</p>

        </div>

        <div class="four columns">

            <h3>Photostream</h3>

            <ul class="photostream group">
                <li><a href="#"><img alt="thumbnail" src="images/thumb.jpg"></a></li>
                <li><a href="#"><img alt="thumbnail" src="images/thumb.jpg"></a></li>
                <li><a href="#"><img alt="thumbnail" src="images/thumb.jpg"></a></li>
                <li><a href="#"><img alt="thumbnail" src="images/thumb.jpg"></a></li>
                <li><a href="#"><img alt="thumbnail" src="images/thumb.jpg"></a></li>
                <li><a href="#"><img alt="thumbnail" src="images/thumb.jpg"></a></li>
                <li><a href="#"><img alt="thumbnail" src="images/thumb.jpg"></a></li>
                <li><a href="#"><img alt="thumbnail" src="images/thumb.jpg"></a></li>
            </ul>

        </div>

        <div class="two columns">
            <h3 class="social">Navigate</h3>

            <ul class="navigate group">
                <li><a href="#">Home</a></li>
                <li><a href="#">Blog</a></li>
                <li><a href="#">Demo</a></li>
                <li><a href="#">Archives</a></li>
                <li><a href="#">About</a></li>
            </ul>
        </div>

        <p class="copyright">&copy; CodeGym - C0419H1 - Team Pro &copy; Copyright 2014 Keep It Simple. &nbsp; Design by
            <a title="Styleshout" href="http://www.styleshout.com/">Styleshout</a>.</p>

    </div> <!-- End row -->

    <div id="go-top"><a class="smoothscroll" title="Back to Top" href="#top"><i class="fa fa-chevron-up"></i></a></div>

</footer> <!-- End Footer-->


<!-- Java Script
================================================== -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="js/jquery-1.10.2.min.js"><\/script>')</script>
<script type="text/javascript" src="js/jquery-migrate-1.2.1.min.js"></script>
<script src="js/main.js"></script>

</body>

</html>
