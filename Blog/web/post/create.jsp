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
    <title>Create new post</title>
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
/*    tr:nth-child(even) {
        background-color: #ddcca3;
    }*/
</style>
<body>
<div>
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <h3 class="navbar-brand" href="#">Create new post</h3>
    </nav><br>
</div>
<p>
    <c:if test="${requestScope['message'] != null}">
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<ul class="nav nav-pills flex-column">
    <li class="nav-item">
        <a href="/posts" class="nav-link bg-secondary"  style="color: aliceblue;">Back to post list</a><br>
    </li>
</ul>
<form method="post">
    <fieldset>
        <legend>CREATE A POST</legend>
        <table>
            <tr>
                <td>Title</td>
                <td><input type="text" name="title" id="title" size="40"></td>
            </tr>
            <tr>
                <td>Introduce </td>
                <td><textarea rows="4" cols="100" name="introduce" id="introduce"></textarea></td>
            </tr>
            <tr>
                <td>Content </td>
                <td><textarea rows="10" cols="100" name="content" id="content"></textarea></td>
            </tr>
            <tr>
                <td>Image </td>
                <td><input type="text" name="image" id="image"></td>
            </tr>
            <tr>
                <td>Categories </td>
                <td><input type="text" name="categories" id="categories"></td>
            </tr>
<%--            <tr>
                <td>User </td>
                <td><input type="text" name="user" id="user"></td>
            </tr>--%>
            <tr>
            </tr>
        </table>
        <td><input type="submit" value="Create product"></td>
        <td><input type="reset" value="Reset"></td>
    </fieldset>
</form>
</body>
</html>
