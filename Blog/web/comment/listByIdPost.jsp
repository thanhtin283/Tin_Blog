<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Nhat
  Date: 6/26/2019
  Time: 9:02 PM
  Email: nhatnpa2508@gmail.com 
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <title>List Comment</title>
    <meta charset="utf-8">
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
</head>
<body>
<div>
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <h3 class="navbar-brand" href="#">Comment</h3>
    </nav><br>
    <ul class="nav nav-pills flex-column">
        <li class="nav-item">
            <a href="/admin.jsp" class="nav-link bg-secondary"  style="color: aliceblue;">Back to admin page</a><br>
        </li>
    </ul>
</div>
<%--<h1>Comment</h1>
<p>
    <a href="/comments?action=create">Create new Comment</a>
</p>--%>
<form method="post">
    <table border="1px">
        <tr>
            <th>ID</th>
            <th>Title Post</th>
            <th>Id Post</th>
            <th>Username</th>
            <th>Id User</th>
            <th>Content</th>
            <th>Date comment</th>
            <th>Edit / Delete</th>
        </tr>
        <c:forEach items='${requestScope["comments"]}' var="comment">
            <tr>
                <td><a>${comment.getId()}</a></td>
                <td><a href="/posts?action=view&id=${post.getId()}">${comment.getTitlePost()}</a></td>
                <td>${comment.getIdPosts()}</td>
                <td><a href="/users?action=view&id=${user.getId()}">${comment.getUsername()}</a></td>
                <td>${comment.getIdUsers()}</td>
                <td>${comment.getContents()}</td>
                <td>${comment.getDateCreated()}</td>
                <td><a href="/comments?action=edit&id=${comment.getId()}"> Edit </a>|
                    <a href="/comments?action=delete&id=${comment.getId()}"> Delete </a></td>
            </tr>
        </c:forEach>
    </table>
</form>
<h4 ><a href="/comments" type="button" class="btn btn-success" style="margin-left: 13px;margin-top: 11px;">Click here to see all comment</a></h4><br>
<form method="post" action="/comments?action=listByIdUser">
    <h3>Enter the ID USER you want to see comment list</h3>
    <input style="margin-left: 16px " type="number" id="viewByIdUser" name="viewByIdUser" placeholder="enter id user" required>
    <input type="submit" value="View Comment List">
</form>
</body>
</html>
