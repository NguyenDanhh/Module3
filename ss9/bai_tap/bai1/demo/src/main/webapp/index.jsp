<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<form action="/index" method="post">
    Product Description :
    <input type="text" name = "nameProduct" > <br>
    List price :
    <input type="number" name = "price" > <br>
    Discount Percent :
    <input type="number" name = "discount" >
    <button type="submit"> result </button>

</form>
</body>
</html>