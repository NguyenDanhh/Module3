<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 4/15/2023
  Time: 8:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form method="post">
    <label>ID</label>
    <input type="number" name="id" value="${user.getId()}">

    <label>name</label>
    <input type="text" name="name" value="${user.getName()}">

    <label>email</label>
    <input type="text" name="email" value="${user.getEmail()}">

    <label>country</label>
    <input type="text" name="country" value="${user.getCountry()}">

    <input type="submit" value="submit">
</form>
</body>
</html>
