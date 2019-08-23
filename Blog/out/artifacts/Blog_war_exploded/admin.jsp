<%--
  Created by IntelliJ IDEA.
  User: Hai
  Date: 6/26/2019
  Time: 9:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <title>Admin Page</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <style>
        .fakeimg {
            height: 200px;
            background: black;
        }
    </style>
</head>
<body>
<div class="row no-gutters">
    <div class="col-md-3">
        <div class="jumbotron text-center" style="padding: 89px">
            <img src="girr.png" class="img-thumbnail" alt="Hot girl" width="283" height="265">
            <h1>Admin's Home</h1>
            <p>Welcome <%=session.getAttribute("Admin") %>
            </p><br><br>
                <p><a href="<%=request.getContextPath()%>/LogoutServlet"><b>LOGOUT</b></a></p>
        </div>
    </div>
    <div class="col-md-9">
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <a class="navbar-brand" href="#" style="font-size: +35px">Management</a>
        </nav><br>

        <ul class="nav nav-pills flex-column ">
            <li class="nav-item">
                <a class="nav-link bg-secondary" href="/users?action=list" style="color: aliceblue;font-size: 25px;margin-top: 30px;">Users</a><br>
            </li>
            <li class="nav-item">
                <a class="nav-link bg-secondary" href="/categories?action=list" style="color: aliceblue;font-size: 25px">Categories </a><br>
            </li>
            <li class="nav-item">
                <a class="nav-link bg-secondary" href="/posts?action=list" style="color: aliceblue;font-size: 25px">Posts </a><br>
            </li>
            <li class="nav-item">
                <a class="nav-link bg-secondary" href="/comments?action=list" style="color: aliceblue;font-size: 25px">Comments </a><br>
            </li>
        </ul>
        <p>
        <a href="/home" style="font-size: 20px" type="button" class="btn btn-success">Back Home Page</a>
        </p>
    </div>
</div>

</body>
</html>