<%--
  Created by IntelliJ IDEA.
  User: cjh
  Date: 2018/5/29
  Time: 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <style>
        button
        {
            background-color: #cccccc; /* Green */
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            border-radius: 12px;
        }
        h1
        {
            background: aquamarine;
        }
    </style>
</head>
<body>
<div align="center">
    <h1>管理界面</h1>
</div>
<div align="center">
    <table>
        <tr>
            <button class="sub">
                <a href="AddBook.jsp">增加图书</a>
            </button>
        </tr>
        <tr>
            <button class="sub">
                <a href="DeleteBook.jsp">删除图书</a>
            </button>
        </tr>
        <tr>
            <button class="sub">
                <a href="ManageSelectBook.jsp">查找图书</a>
            </button>
        </tr>
        <tr>
            <button class="sub">
                <a href="AllBook.jsp">查看所有图书</a>
            </button>
        </tr>
        <tr>
            <button class="sub">
                <a href="ManageUpdate.jsp">修改密码</a>
            </button>
        </tr>
        <tr>
        <button class="sub">
            <a href="logout.jsp">注销</a>
        </button>
        </tr>
    </table>
</div>

</body>
</html>
