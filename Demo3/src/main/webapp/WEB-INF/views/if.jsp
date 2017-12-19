<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/1
  Time: 16:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="../../user/getuserIf" method="post">
    <input type="text" name="username">
    <input type="submit" >
</form>
<hr>
<table>
    <tr>
        <td>id</td>
        <td>用户名</td>
        <td>密码</td>
    </tr>
    <c:forEach items="${userif}" var="user">
    <tr>

        <td>${user.id}</td>
        <td>${user.username}</td>
        <td>${user.password}</td>

    </tr>
    </c:forEach>

</body>
</html>
