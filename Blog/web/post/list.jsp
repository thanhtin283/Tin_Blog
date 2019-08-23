<%--
  Created by IntelliJ IDEA.
  User: Nhat
  Date: 6/25/2019
  Time: 10:03 AM
  Email: nhatnpa2508@gmail.com 
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <title>List posts</title>
    <meta charset="utf-8">
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        td, th {
            border: 1px solid #dda777;
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
        <h3 class="navbar-brand" href="#">Posts</h3>
    </nav><br>
    <ul class="nav nav-pills flex-column">
        <li class="nav-item">
            <a href="/admin.jsp" class="nav-link bg-secondary"  style="color: aliceblue;">Back to admin page</a><br>
        </li>
    </ul>
</div>
<table border="1">
    <tr>
        <th>Title</th>
        <th>Introduce</th>
        <th>Content</th>
        <th>Image</th>
        <th>Creator</th>
        <th>Date created</th>
        <th>Final editor</th>
        <th>Last modified date</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach items="${requestScope['posts']}" var="post">
        <tr>
            <td><a href="/posts?action=view&id=${post.getId()}">${post.getTitle()}</a></td>
            <td>${post.getIntroduce()}</td>
            <td>${post.getContent()}</td>
            <td>${post.getImage()}</td>
            <td>${post.getCreator()}</td>
            <td>${post.getDateCreated()}</td>
            <td>${post.getFinalEditor()}</td>
            <td>${post.getLastModifiedDate()}</td>
            <td><a href="/posts?action=edit&id=${post.getId()}">Edit</a></td>
            <td><a href="/posts?action=delete&id=${post.getId()}">Delete</a></td>
        </tr>
    </c:forEach>
</table>
<p >
    <a href="/posts?action=create" type="button" class="btn btn-success" style="margin-left: 13px;margin-top: 11px;"> Create new post</a>
</p>
</body>
</html>
