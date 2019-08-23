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
    <title>Delete Comment</title>
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
            background-color: #dddddd;
        }
    </style>
</head>
<body>
<div>
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <h3 class="navbar-brand" href="#">Delete Comment</h3>
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
    <a href="/comments" class="nav-link bg-secondary"  style="color: aliceblue;">Back to Comments list</a>
    </li>
</ul>
<%}%>
<form method="post">
    <h3>Are you sure?</h3>
    <fieldset>
        <legend>Comments info</legend>
        <table>
            <%--            <tr>
                            <td>ID:</td>
                            <td><a name="id" id="id">${requestScope["comment"].getId()}</a></td>
                        </tr>--%>
            <tr>
                <td>Title Post:</td>
                <td>${requestScope["comment"].getTitlePost()}</td>
            </tr>
            <tr>
                <td>Content:</td>
                <td>${requestScope["comment"].getContents()}</td>
            </tr>
            <tr>
                <td>Date created:</td>
                <td>${requestScope["comment"].getDateCreated()}</td>
            </tr>
            <tr>
                <td>Last Modified Date:</td>
                <td>${requestScope["comment"].getLastModifiedDate()}</td>
            </tr>
            <tr>
                <td>Username:</td>
                <td><a name="un" id="un">${requestScope["comment"].getUsername()}</a></td>
            </tr>
<%--            <tr>
                <td>Id User:</td>
                <td><a name="idUser" id="idUser">${requestScope["comment"].getIdUsers()}</a></td>
            </tr>--%>
            <tr>
                <td>User Password:</td>
                <td><input type="password" name="password" id="password" placeholder="Enter your password"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Delete Comment" class="btn btn-success"></td>
            </tr>
        </table>
    </fieldset>
    <%
        if (session.getAttribute("idPost") != null) {
    %>
    <p>
        <a href="/posts?action=view&id=<%=session.getAttribute("idPost")%>" class="btn btn-success" style="margin-left: 13px;margin-top: 11px;">Back to Post</a>
    </p>
    <%} else if (request.getParameter("id") != null){%>
    <p>
        <a href="/posts?action=view&id=${requestScope["comment"].getId()}" class="btn btn-success" style="margin-left: 13px;margin-top: 11px;">Back to Post</a>
    </p>
    <%} else {%>
    <p>
        <a href="/home" class="btn btn-success" style="margin-left: 13px;margin-top: 11px;">Back Home Page</a>
    </p>
    <%}%>
</form>
</body>
</html>
