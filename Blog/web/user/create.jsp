<%--
  Created by IntelliJ IDEA.
  User: Nhat
  Date: 6/25/2019
  Time: 10:03 AM
  Email: nhatnpa2508@gmail.com 
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<title>Create new User</title>
<meta charset="utf-8">
<style>
    .message{
        color:green;
    }
</style>
</head>
<body>
<h1>Create new User</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/users">Back to User list</a>
</p>
<form method="post">
    <fieldset>
        <legend>User info</legend>
        <table>
            <tr>
                <td>Username: </td>
                <td><input type="text" name="username" id="username"></td>
            </tr>
            <tr>
                <td>Password: </td>
                <td><input type="text" name="password" id="password"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Create User"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
