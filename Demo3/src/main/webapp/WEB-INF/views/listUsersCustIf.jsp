<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/2
  Time: 21:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>万能分页查询</title>
</head>
<body>
<%

    String scheme = request.getScheme();//协议
    String serverName = request.getServerName();
    int serverPort = request.getServerPort();//端口

    String servletPath = request.getServletPath();
    String contextPath = request.getContextPath();
    StringBuffer sb= new StringBuffer();
    sb.append(scheme+"://"+serverName+":"+serverPort);
%>
<form action="../user/getUserCustIf" method="post">
    姓名:<input type="text"  name="username" >
    <input type="hidden" name="pagenum" value="1">
    编号: <input type="text" name="id">
    密码: <input type="text" name="password">
    <input type="submit" value="查询">
</form>
<hr>

<div>
    <table>
        <tr>
            <td>id</td>
            <td>username</td>
            <td>password</td>
        </tr>
        <c:forEach items="${users}" var="user">

            <tr>
                <td>${user.id}</td>
                <td>${user.username}</td>
                <td>${user.password}</td>
            </tr>

        </c:forEach>
    </table>
</div>
<%
    String path = request.getContextPath();

    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+ "/";
    pageContext.setAttribute("path",basePath);
%>
<div>
    当前${info.pageNum}页,总${info.pages}页,总${info.total}条记录

        <a href="${bath}/user/getUserCustIf?pagenum=1&username=${param.username}&id=${param.id}&password=${param.password}">首页</a>


  <c:if test="${info.hasPreviousPage}" >
      <a href="${bath}/user/getUserCustIf?pagenum=${info.pageNum-1}&username=${param.username}&id=${param.id}&password=${param.password}">上一页</a>
  </c:if>
    <c:forEach items="${info.navigatepageNums}" var="pageNumber">
        <a href="${bath}/user/getUserCustIf?pagenum=${pageNumber}&username=${param.username}&id=${param.id}&password=${param.password}">${pageNumber}</a>
    </c:forEach>
    <c:if test="${info.hasNextPage}">
        <a href="${bath}/user/getUserCustIf?pagenum=${info.pageNum+1}&username=${param.username}&id=${param.id}&password=${param.password}">下一页</a>
    </c:if>

        <a href="${bath}/user/getUserCustIf?pagenum=${info.pages}&username=${param.username}&id=${param.id}&password=${param.password}">末页</a>



</div>
</body>
</html>
