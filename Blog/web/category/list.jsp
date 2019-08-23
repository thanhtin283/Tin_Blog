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
    <title>List Category</title>
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
        <h3 class="navbar-brand" href="#">Categories</h3>
    </nav><br>
    <ul class="nav nav-pills flex-column">
        <li class="nav-item">
            <a href="/admin.jsp" class="nav-link bg-secondary"  style="color: aliceblue;">Back to admin page</a><br>
        </li>
    </ul>
</div>
<form method="post">
    <table border="1px">
        <tr>
            <th>ID</th>
            <th>Name Category</th>
            <th>Date Created</th>
            <th>Last Modified Date</th>
            <th>Editor</th>
            <th>Edit / Delete</th>
        </tr>
        <c:forEach items='${requestScope["categories"]}' var="category">
            <tr>
                <td>${category.getId()}</td>
                <td><a href="/categories?action=view&id=${category.getId()}">${category.getNameCategories()}</a></td>
                <td>${category.getDateCreated()}</td>
                <td>${category.getLastModifiedDate()}</td>
                <td>${category.getFinalEditor()}</td>
                <td><a href="/categories?action=edit&id=${category.getId()}"> Edit </a>|
                    <a href="/categories?action=delete&id=${category.getId()}"> Delete </a></td>
            </tr>
        </c:forEach>
    </table>
</form>
<p>
    <a href="/categories?action=create" type="button" class="btn btn-success" style="margin-left: 13px;margin-top: 11px;"> Create new category</a>
</p>
</body>
</html>
