<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  User: 赵钦荣
  Date: 2017/11/3 20:38
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>条件查询后分页</title>
</head>
<body>
<form action="/user/getUserPageIf" method="post">
    姓名:<input type="text"  name="username">
    <input type="hidden" name="pagenum" value="1">
    <input type="submit" value="查询">
</form>
<hr>
<table>
    <tr>
        <td>编号</td>
        <td>用户名</td>
        <td>密码</td>
    </tr>
    <c:forEach items="${users}" var="user">
        <tr>
            <td>${user.id}</td>
            <td>${user.username}</td>
            <td>${user.password}</td>
        </tr>
    </c:forEach>
</table>
当前${info.pageNum}页,共有${info.pages}页,共有${info.total}条记录 <br>
<%
    String path=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/"+request.getContextPath()+"/";
    pageContext.setAttribute("path",path);
%>
<a href="${path}/user/getUserPageIf?pagenum=1&username=${param.username}">首页</a>
<c:if test="${info.hasPreviousPage}">
    <a href="${path}/user/getUserPageIf?pagenum=${info.pageNum-1}&username=${param.username}">前一页</a>
</c:if>
<c:forEach var="page" items="${info.navigatepageNums}">
    <a href="${path}/user/getUserPageIf?pagenum=${page}&username=${param.username}">${page}</a>
</c:forEach>

<c:if test="${info.hasNextPage}">
    <a href="${path}/user/getUserPageIf?pagenum=${info.pageNum+1}&username=${param.username}">后一页</a>
</c:if>
<a href="${path}/user/getUserPageIf?pagenum=${info.pages}&username=${param.username}">末页</a>

</body>
</html>
