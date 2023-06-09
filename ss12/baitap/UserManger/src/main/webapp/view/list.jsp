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
<button class="btn btn-primary" onclick="window.location.href = '/UserServlet?action=create'">Create New User</button>
<form action="">
    <label>
        <button type="submit" class="btn btn-primary" onclick="window.location.href = '/UserServlet?action=search&name'">Search</button>
        <input type="text" name="name">
    </label>
</form>

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
                <button style="background: black" class="btn btn-primary" onclick="window.location.href = '/UserServlet?action=update&id=${element.id}'">Update</button>
            </td>
            <td>
                <button style="background: red" type="button" class="btn btn-primary btn-lg" data-bs-toggle="modal" data-bs-target="#modelId"
                        onclick="getIdDelete(${element.getId()} , '${element.getName()}') ">Delete
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>


<!-- Modal -->
<div class="modal fade" id="modelId" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modelTitleId"></h4>
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Bạn có muốn xóa <span id="name" style="color: red"></span> hay không
            </div>
            <div class="modal-footer">
                <form action="/UserServlet">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" id="idDelete">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button style="background: red" type="submit" class="btn btn-primary" >Delete</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    function getIdDelete(id , name ){
        document.getElementById("idDelete").value = id;
        document.getElementById("name").innerHTML = name;
    }

</script>
</html>



