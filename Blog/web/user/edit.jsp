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
    <title>Edit User</title>
    <meta charset="utf-8">
    <script>
        function check(input) {
            if (input.value != document.getElementById("newPassword").value){
                input.setCustomValidity("Password must be Matching");
            }else {
                input.setCustomValidity('');
            }
        }
        function checkLong(input) {
            if (input.value.length < 6){
                input.setCustomValidity("Input must be more than 6 character");
            }else {
                input.setCustomValidity('');
            }
        }
        function checkNewPassword(input) {
            if (input.value == document.getElementById("password").value){
                input.setCustomValidity("New password must be different old password");
            }else {
                input.setCustomValidity('');
            }
        }
    </script>
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
            background-color: #dddddd;
        }
    </style>
</head>
<body>
<div>
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <h3 class="navbar-brand" href="#">Edit User</h3>
    </nav><br>
</div>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<%
    if (session.getAttribute("role") == "admin") {
%>
<ul class="nav nav-pills flex-column">
    <li class="nav-item">
        <a href="/users" class="nav-link bg-secondary"  style="color: aliceblue;">Back to User list</a><br>
    </li>
</ul>
<%}%>
<form method="post">
    <fieldset>
        <legend>User info</legend>
        <table>
            <tr>
                <td>Username: </td>
                <td><a name = "username" id = "username">${requestScope["user"].getUsername()}</a></td>
            </tr>
            <%
                if (session.getAttribute("role") == "admin") {
            %>
            <tr>
                <td>Role: </td>
                <td><input type="text" name="role" id="role" value="${requestScope["user"].getRole()}"></td>
            </tr>
            <%}%>
            <tr>
                <td>Password: </td>
                <td><input type="password" name="password" id="password" placeholder="enter user password"></td>
            </tr>
            <tr>
                <td>New Password: </td>
                <td><input type="password" name="newPassword" id="newPassword" placeholder="enter new password" required oninput="checkLong(this),checkNewPassword(this)"></td>
            </tr>
            <tr>
                <td>Re Enter New Password: </td>
                <td><input type="password" name="reNewPassword" id="reNewPassword" placeholder="re enter new password" oninput="check(this)"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Update User"></td>
            </tr>
        </table>
    </fieldset>
    <p>
        <a href="/home" style="font-size: 20px" type="button" class="btn btn-success">Back Home Page</a>
    </p>
</form>

</body>
</html>
