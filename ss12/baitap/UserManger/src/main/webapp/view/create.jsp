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

<form action="/UserServlet?action=save" method="post">
    <label>id</label>
    <input type="number" name="id">

    <label>name</label>
    <input type="text" name="name">

    <label>email</label>
    <input type="text" name="email">

    <label>country</label>
    <input type="text" name="country">

    <input type="submit" value="submit">
</form>
</body>
</html>
