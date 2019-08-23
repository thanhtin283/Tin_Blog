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
    <title>User Info</title>
    <meta charset="utf-8">
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
</head>
<body>
<div>
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <h3 class="navbar-brand" href="#">User</h3>
    </nav>
    <br>
    <ul class="nav nav-pills flex-column">
        <li class="nav-item">
            <%
                if (session.getAttribute("role") == "admin") {
            %>
            <a href="/users" class="nav-link bg-secondary" style="color: aliceblue;">Back to User list</a>
            <%}%>
        </li>
    </ul>
</div>
<form method="post">
    <p>
        <a href="/home"  class="btn btn-success">Back to Home Page</a>
    </p>
    <fieldset>
        <legend>User info</legend>
        <table>
            <tr>
                <td>ID:</td>
                <td>${requestScope["user"].getId()}</td>
            </tr>
            <tr>
                <td>Username:</td>
                <td>${requestScope["user"].getUsername()}</td>
            </tr>
            <tr>
                <td>Date Created:</td>
                <td>${requestScope["user"].getDateCreated()}</td>
            </tr>
            <%
                if (session.getAttribute("role") == "admin") {
            %>
            <tr>
                <td>Role:</td>
                <td>${requestScope["user"].getRole()}</td>
            </tr>
            <tr>
                <td>Final Editor:</td>
                <td>${requestScope["user"].getFinalEditor()}</td>
            </tr>
            <tr>
                <td>Last Modified Date:</td>
                <td>${requestScope["user"].getLastModifiedDate()}</td>
            </tr>
            <%}%>
        </table>
    </fieldset>
    <p>
        <a href="/users?action=edit&id=${sessionScope['idUser']}"  class="btn btn-success">Change password</a>
    </p>
</form>
</body>
</html>
