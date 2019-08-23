<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Nhat
  Date: 6/25/2019
  Time: 10:03 AM
  Email: nhatnpa2508@gmail.com 
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <title>Delete User</title>
    <meta charset="utf-8">
    <style>
        table {
            border-collapse: collapse;
            width: 30%;
        }
        td, th {
            border: 1px solid #ddc785;
            text-align: left;
            padding: 6px;
        }
        tr:nth-child(even) {
            background-color: #dddddd;
        }
    </style>
</head>
<body>
<div>
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <h3 class="navbar-brand" href="#">Delete User</h3>
    </nav><br>
</div>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<ul class="nav nav-pills flex-column">
    <li class="nav-item">
    <a href="/users" class="nav-link bg-secondary"  style="color: aliceblue;">Back to User list</a>
    </li>
</ul>
<form method="post">
    <h3>Are you sure?</h3>
    <fieldset>
        <legend>User info</legend>
        <table>
            <tr>
                <td>Username: </td>
                <td>${requestScope["user"].getUsername()}</td>
            </tr>
            <tr>
                <td>Role User: </td>
                <td>${requestScope["user"].getRole()}</td>
            </tr>
<%--            <tr>
                <td>Admin password: </td>
                <td><input type="password" id="password" name="password" placeholder=" ADMIN PASSWORD"></td>
            </tr>--%>
            <tr>
                <td></td>
                <td><input type="submit" value="Delete User" style="margin-left: 13px;margin-top: 11px;"  class="btn btn-success"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
