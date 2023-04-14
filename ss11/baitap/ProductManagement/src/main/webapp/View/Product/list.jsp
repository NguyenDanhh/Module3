<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 4/12/2023
  Time: 2:12 PM
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
<button class="btn btn-primary"><a href="/product?actionUser=create" style="color: white ;text-decoration: none">Create</a></button>
<form>
<div>Search <input type="text" name="name"></div>
<button name="actionUser" value="search" class="btn btn-primary"  style="color: white ;text-decoration: none" type="submit">search</button>
</form>
<table class="table">
    <thead>
    <tr>
        <th>ID</th>
        <th>Name Product</th>
        <th>Price</th>
        <th>Update</th>
        <th>Delete</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="element" items="${product}" varStatus="id">
        <tr>
            <td scope="row">${id.count}</td>
            <td>${element.name}</td>
            <td>${element.price}</td>
            <td><button type="submit" class="btn btn-primary" ><a href="/product?actionUser=update&id=${element.id}" style="color: white ;text-decoration: none">Update</a></button></td>
            <td><button type="submit" class="btn btn-primary"><a href="/product?actionUser=delete&id=${element.id}" style="color: white ;text-decoration: none">Delete</a></button></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>