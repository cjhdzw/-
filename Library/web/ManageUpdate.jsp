<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: cjh
  Date: 2018/5/29
  Time: 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        h1
        {
            background: #1Effff;
        }
        input
        {
            border: 1px solid #ccc;
            padding: 7px 0px;
            border-radius: 3px; /*css3属性IE不支持*/
            padding-left:5px;
        }
        .sub
        {
            border:2px solid;
            padding:3px 20px;
            -webkit-border-radius: 25px;
        }
    </style>
</head>
<body>
    <div align="center">
        <h1>修改密码</h1>
    </div>

    <div align="center">
        当前用户：<%=session.getAttribute("username")%>
        <%session.setAttribute("username",session.getAttribute("username"));%>
        <form action="ManageUpdate" method="post">
            <input type="password" name="password" placeholder="原密码"><br>
            <input type="password" name="password1" placeholder="新密码"><br>
            <input type="password" name="password2" placeholder="确认密码"><br>
            <input type="submit" value="submit" class="sub">
        </form>
    </div>
</body>
</html>
