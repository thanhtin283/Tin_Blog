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
    <title>Edit Post</title>
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
    /*tr:nth-child(even) {
        background-color: #ddcca3;
    }*/
</style>
<body>
<div>
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <h3 class="navbar-brand" href="#">Edit Post</h3>
    </nav><br>
</div>

<p>
    <c:if test='${requestScope["message"] != null}'>
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
        <legend>EDIT A POST</legend>
        <table>
            <tr>
                <td>Title</td>
                <td><input type="text" name="title" id="title" size="40"
                           value="${requestScope["posts"].getTitle()}"></td>
            </tr>
            <tr>
                <td>Introduce</td>
                <td>
                    <textarea rows="4" cols="100" name="introduce" id="introduce">
                        ${requestScope["posts"].getIntroduce()}
                    </textarea>
                </td>
            </tr>
            <tr>
                <td>Content</td>
                <td>
                    <textarea rows="10" cols="100" name="content" id="content">
                        ${requestScope["posts"].getContent()}
                    </textarea>
                </td>
            </tr>
            <tr>
                <td>Image</td>
                <td><input type="text" name="image" id="image"
                           value="${requestScope["posts"].getImage()}"></td>
            </tr>
            <tr>
                <td>Categories</td>
                <td><input type="text" name="categories" id="categories"
                           value="${requestScope["posts"].getIdCategories()}">
                </td>
            </tr>
<%--            <tr>
                <td>User</td>
                <td><input type="text" name="user" id="user"
                           value="${requestScope["posts"].getIdUsers()}">
                </td>
            </tr>--%>
            <tr>
                <td></td>
                <td></td>
            </tr>
        </table>
        <input type="submit" value="Update post" class="btn btn-success">
    </fieldset>
</form>
</body>
</html>