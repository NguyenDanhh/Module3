<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<h1>Simple Calculator</h1>
<form action="/calculator-servlet">
    <fieldset>
        <legend>Calculator</legend>
        <table>
            <tr>
                <td>First operand :</td>
                <td><input type="number" name="first-operand"></td>
            </tr>
            <tr>
                <td>Operator :</td>
                <td>
                    <select name="operator" id="">
                        <option value="addition">+</option>
                        <option value="subtraction">-</option>
                        <option value="multiplication">X</option>
                        <option value="division">/</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Second operand :</td>
                <td><input type="number" name="second-operand"></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <button type="submit">Calculate</button>
                </td>
            </tr>
        </table>
    </fieldset>
</form>
<h2>Result : ${result}</h2>
</body>
</html>