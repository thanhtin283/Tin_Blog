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
    <title>Create new Comment</title>
    <meta charset="utf-8">
    <style>
        .message{
            color:green;
        }
    </style>
</head>
<body>
<h1>Create new Comment</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/comments">Back to comment list</a>
</p>
<form method="post">
    <fieldset>
        <legend>Comment info</legend>
        <table>
            <tr>
                <td>Content: </td>
                <td><input type="text" name="content" id="content" style="width: 300px"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Create comment"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
