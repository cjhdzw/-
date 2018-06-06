<%@ page import="controller.connectMysql,model.book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
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
        .hh
        {
            background: azure;
        }
        .h
        {
            background: #1Effff;
        }
        button
        {
            border:2px solid;
            padding:3px 20px;
            background: #cccccc;
            -webkit-border-radius: 25px;
        }
    </style>
</head>
<body>
<form action="SelectBook.jsp" method="post">
    <div align="center">
        <h1 class="h">查找图书</h1>
    </div>
    <div align="center">
        <table>
            <tr>书名:<br>
                <input type="text" name="book" placeholder="bookname">
            </tr>
            <tr><br>
                <input type="submit" value="select" class="sub">
                <button><a href="login.jsp">return</a></button>
            </tr><br>
        </table>
    </div>

    <%
        String book= request.getParameter("book");
        if(book!="" && request.getParameter("book")!=null){
            connectMysql.init();
            book bk = connectMysql.selectBook(book);
    %>
    <div align="center">
        <h1 class="hh">图书信息</h1>
        <table width="400" border="1" cellspacing="0" cellpadding="0">
            <tr>
                <td>
                    <h3>书名</h3>
                </td>
                <td>
                    <h3>作者</h3>
                </td>
                <td>
                    <h3>出版社</h3>
                </td>
            </tr>
            <tr>
                <td>
                    <%=bk.getBookname()%>
                </td>
                <td>
                    <%=bk.getAuthor()%>
                </td>
                <td>
                    <%=bk.getPress()%>
                </td>
            </tr>
        </table>
    </div>
    <%
        }
    %>
</form>
</body>
</html>
