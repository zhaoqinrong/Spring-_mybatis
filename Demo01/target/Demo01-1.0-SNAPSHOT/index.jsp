<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/1
  Time: 12:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="user/getAll">获取全部用户</a>

<form action="user/getuserIf" method="post">
    <input type="text" name="username">
    <input type="submit">
</form>
</body>
</html>
