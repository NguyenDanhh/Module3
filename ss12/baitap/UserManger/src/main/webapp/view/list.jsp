<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 4/15/2023
  Time: 8:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
<html>
<head>
    <title>Title</title>
</head>
<body>
<button onclick="window.location.href = '/UserServlet?action=create'">Create New User</button>
<table class="table">
    <thead>
    <tr>
        <th>id</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
        <th colspan="2"></th>
    </tr>
    </thead>

    <tbody>
    <c:forEach var="element" items="${userList}">
        <tr>
            <td>${element.id}</td>
            <td>${element.name}</td>
            <td>${element.email}</td>
            <td>${element.country}</td>
            <td>
                <button onclick="window.location.href = '/UserServlet?action=Update&id=${element.id}'">Update</button>
            </td>
            <td>
                <button onclick="window.location.href = '/UserServlet?action=Update&id=${element.id}'">Delete</button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

