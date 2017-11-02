<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/1
  Time: 12:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<html>
<head>
    <title> 18211071863</title>
</head>
<body>
${allUser}
<table>
    <tr>
        <td>id</td>
        <td>username</td>
        <td>password</td>
    </tr>
    <c:forEach items="${allUser}" var="user">

        <tr>
            <td>${user.id}</td>
            <td>${user.username}</td>
            <td>${user.passwrod}</td>
        </tr>

    </c:forEach>
</table>
<fmt:formatDate value="" pattern="yy-MM-dd"/>
</body>
</html>
