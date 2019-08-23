<%--
  Created by IntelliJ IDEA.
  User: Nhat
  Date: 6/25/2019
  Time: 10:02 AM
  Email: nhatnpa2508@gmail.com 
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <title>Category Info</title>
    <meta charset="utf-8">
</head>
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
        background-color: #ddcca3;
    }
</style>
<body>
<div>
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <h3 class="navbar-brand" href="#">Category</h3>
    </nav><br>
    <ul class="nav nav-pills flex-column">
        <li class="nav-item">
            <a href="/categories" class="nav-link bg-secondary"  style="color: aliceblue;">Back to Category list</a><br>
        </li>
    </ul>
</div>
<form method="post">
    <fieldset>
        <legend>Category info</legend>
        <table>
            <tr>
                <td>ID: </td>
                <td>${requestScope["category"].getId()}</td>
            </tr>
            <tr>
                <td>Name Category: </td>
                <td>${requestScope["category"].getNameCategories()}</td>
            </tr>
            <tr>
                <td>Date Created: </td>
                <td>${requestScope["category"].getDateCreated()}</td>
            </tr>
            <tr>
                <td>Final Editor: </td>
                <td>${requestScope["category"].getFinalEditor()}</td>
            </tr>
            <tr>
                <td>Last Modified Date: </td>
                <td>${requestScope["category"].getLastModifiedDate()}</td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
