<%--
  Created by IntelliJ IDEA.
  User: Hai
  Date: 6/25/2019
  Time: 8:23 AM
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

<body class="single">

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
                <li class="current"><a class="button" href="/home">Home</a></li>
                <li><a href="/home?action=Javascript">Javascript</a></li>
                <li><a href="/home?action=Java">Java</a></li>
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

            <article class="entry">

                <header class="entry-header">

                    <h2 class="entry-title">
                        ${requestScope["posts"].getTitle()}
                    </h2>

                    <div class="entry-meta">
                        <ul>
                            <li>${requestScope["posts"].getDateCreated()}</li>
                            <span class="meta-sep">&bull;</span>
                            <%--thêm categories vào đây--%>
                            <li>
                                <a href="/home?action=${requestScope["posts"].getNameCategories()}" title="" rel="category tag">${requestScope["posts"].getNameCategories()}</a>,
                            </li>
                            <span class="meta-sep">&bull;</span>
                            <li>${requestScope["posts"].getCreator()}</li>
                        </ul>
                    </div>

                </header>

                <div class="entry-content-media">
                    <div class="post-thumb">
                        <img src="${requestScope["posts"].getImage()}">
                    </div>
                </div>

                <div class="entry-content">
                    <p class="lead">
                        ${requestScope["posts"].getIntroduce()}
                    </p>

                    <p>
                        ${requestScope["posts"].getContent()}
                    </p>

                </div>

                <%--Phần này chưa làm
                <p class="tags">
                    <span>Tagged in </span>:
                    <a href="#">orci</a>, <a href="#">lectus</a>, <a href="#">varius</a>, <a href="#">turpis</a>
                </p>--%>

            </article>

            <!-- Comments
        ================================================== -->
            <div id="comments">

                <h3>Comments</h3>

                <!-- commentlist -->
                <ol class="commentlist">

                    <c:forEach items='${requestScope["comments"]}' var="comment">
                        <li class="depth-1">

                            <div class="avatar">
                                <img width="50" height="50" class="avatar" src="images/user-01.png" alt="">
                            </div>

                            <div class="comment-content">

                                <div class="comment-info">
                                    <cite><a href="/users?action=view&id=${comment.getIdUsers()}" id ="username" name = "username">${comment.getUsername()}</a></cite>

                                    <div class="comment-meta">
                                        <time class="comment-time" datetime="2014-07-12T23:05">${comment.getLastModifiedDate()}
                                        </time>
                                        <%--<span class="sep">/</span><a class="reply" href="#">Reply</a>--%>
                                    </div>
                                </div>

                                <div class="comment-text">
                                    <p>
                                            ${comment.getContents()}
                                    </p>
<%--                                    <%
                                        if((session.getAttribute("role") == "admin")
                                                /*|| (session.getAttribute("Admin")== request.getParameter("username"))*/
                                        ) {
                                    %>--%>
                                    <p>
                                        <a href="/comments?action=edit&id=${comment.getId()}">Edit</a>|
                                        <a href="/comments?action=delete&id=${comment.getId()}">Delete</a>
                                    </p>
<%--                                    <%}%>--%>
                                </div>

                            </div>

                        </li>
                    </c:forEach>

                </ol> <!-- Commentlist End -->

                <!-- respond -->
                <div class="respond">

                    <h3>Leave a Comment</h3>
                    <p style="color: red">
                        <c:if test='${requestScope["message"] != null}'>
                            <span class="message">${requestScope["message"]}</span>
                        </c:if>
                    </p>

                    <!-- form --><%--action="/comments?action=create&id=${comment.getIdPosts()}"--%>
                    <form name="contactForm" id="contactForm" method="post" action="/posts?action=createComment&id=${requestScope["posts"].getId()}">
                        <fieldset>
                            <div class="message group">
                                <td><input type="text" name="content" id="content" style="width: 300px"></td>
<%--                                <label for="content">Content <span class="required">*</span></label>
                                <textarea typeof="text" name="content" id="content" rows="10" cols="50"></textarea>--%>
                            </div>
                            <button type="submit" class="submit">Submit</button>
                        </fieldset>
                    </form> <!-- Form End -->

                </div> <!-- Respond End -->

            </div>  <!-- Comments End -->


        </div> <!-- main End -->

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
                    <li><a href="/home?action=Java">Java</a></li>
                    <li><a href="/home?action=Python">Python</a></li>
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

        <p class="copyright"> &copy; CodeGym - C0419H1 - Team Pro &copy; Copyright 2014 Keep It Simple. &nbsp; Design by
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
