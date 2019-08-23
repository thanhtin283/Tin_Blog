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
    <title>Create new Category</title>
    <meta charset="utf-8">
    <style>
        .message{
            color:green;
        }
    </style>
</head>
<body>
<div>
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <h3 class="navbar-brand" href="#">Create new Category</h3>
    </nav><br>

</div>
<%--<h1>Create new Category</h1>--%>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<ul class="nav nav-pills flex-column">
    <li class="nav-item">
        <a href="/categories?action=list" class="nav-link bg-secondary"  style="color: aliceblue;">Back to category list</a><br>
    </li>
</ul>
<form method="post">
    <fieldset>
        <legend>Category info</legend>
        <table>
            <tr>
                <td>Name Category: </td>
                <td><input type="text" name="nameCategory" id="nameCategory"></td>
            </tr>
            <tr>
                <td></td>
                <td><input style= "margin-top: 11px;" type="submit" value="Create Category"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
