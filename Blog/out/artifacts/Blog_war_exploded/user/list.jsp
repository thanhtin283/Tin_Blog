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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <title>User List</title>
    <meta charset="utf-8">
</head>
<style>
    table {

        border-collapse: collapse;
        width: 100%;
    }

    td, th {
        border: 1px solid #dddddd;
        text-align: left;
        padding: 8px;
    }

    tr:nth-child(even) {
        background-color: #dddddd;
    }
</style>
<body>
<div>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <h3 class="navbar-brand" href="#">Users</h3>
</nav><br>
<ul class="nav nav-pills flex-column">
    <li class="nav-item">
        <a href="/admin.jsp" class="nav-link bg-secondary"  style="color: aliceblue;">Back to admin page</a><br>
    </li>
</ul>
</div>
<%--<p>
    <a href="/admin.jsp">Back to admin page</a>
</p>--%>
<div class="">
    <span style="font-family: Times New Roman">
<form method="post">
    <table border="1px" style="border-collapse: collapse" >
        <tr>
            <th>STT</th>
            <th>Username</th>
            <th>Role</th>
            <th>Date Create</th>
            <th>Edit / Delete</th>
        </tr>
        <c:forEach items='${requestScope["users"]}' var="user">
            <tr>
                <td><a>${user.getId()}</a></td>
                <td><a href="/users?action=view&id=${user.getId()}">${user.getUsername()}</a></td>
                <td>${user.getRole()}</td>
                <td>${user.getDateCreated()}</td>
                <td><a href="/users?action=edit&id=${user.getId()}">Edit </a>|<a
                        href="/users?action=delete&id=${user.getId()}"> Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</form>
    </span>
</div>
</body>
</html>
