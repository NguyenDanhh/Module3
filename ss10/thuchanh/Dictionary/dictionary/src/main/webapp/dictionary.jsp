<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 4/11/2023
  Time: 11:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    PrintWriter out = new PrintWriter(System.out);
    Map<String , String > listMap = new HashMap<>();
%>
<%
    listMap.put("hello" , "Chao xìn ");
    listMap.put("book" , "vở");
    listMap.put("how" , "Như thế nào");
    listMap.put("when" , "Khi nào ");

    String search = request.getParameter("dictionary");
    String result = listMap.get(search);
    if(result!=null){
        out
    }
%>
</body>
</html>
