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
    <title>Comment Info</title>
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
        <h3 class="navbar-brand" href="#">Comment</h3>
    </nav>
    <br>
    <ul class="nav nav-pills flex-column">
        <li class="nav-item">
            <a href="/comments" class="nav-link bg-secondary"  style="color: aliceblue;">Back to Comment list</a>
        </li>
    </ul>
</div>
<form method="post">
    <fieldset>
        <legend>Comment info</legend>
        <table>
            <tr>
                <td>ID:</td>
                <td><a name="id" id="id">${requestScope["comment"].getId()}</a></td>
            </tr>
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
                <td>${requestScope["comment"].getUsername()}</td>
            </tr>

        </table>
    </fieldset>
    <%
        if (session.getAttribute("idPost") != null) {
    %>
    <p>
        <a href="/posts?action=view&id=<%=session.getAttribute("idPost")%>" style="margin-left: 13px;margin-top: 11px;" class="btn btn-success">Back to Post</a>
    </p>
    <%} else {%>
    <p>
        <a href="/posts?action=view&id=${requestScope["comment"].getId()}" style="margin-left: 13px;margin-top: 11px;" class="btn btn-success">Back to Post</a>
    </p>
    <%}%>
</form>
</body>
</html>