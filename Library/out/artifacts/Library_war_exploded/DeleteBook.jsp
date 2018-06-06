<%@ page import="controller.connectMysql" %>
<%@ page contentType="text/html;charset=gb2312" pageEncoding="utf-8" language="java" %>
<%@page import="controller.connectMysql,model.book" %>
<%request.setCharacterEncoding("gb2312");%>
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
        button
        {
            border:2px solid;
            padding:3px 20px;
            background: #cccccc;
            -webkit-border-radius: 25px;
        }
        h1
        {
            background: #1Effff;
        }
    </style>
</head>
<body>
<form action="DeleteBook.jsp" method="post">
    <div align="center">
        <h1>删除图书</h1>
    </div>
    <div align="center">
        <table>
            <tr>书名:<br>
                <input type="text" name="book" placeholder="bookname">
            </tr><br>
            <tr><br>
                <input type="submit" value="delete" class="sub">
                <button><a href="ManageLogin.jsp">return</a></button>
            </tr><br>
        </table>
    </div>
    <%
        String book= request.getParameter("book");
        connectMysql.init();
        if(book!="" && book!=null){
            connectMysql.deleteBook(book);
    %>
    <div align="center">
        <h3>删除书籍成功</h3>
        <table width="400" border="1" cellspacing="0" cellpadding="0">

                <td>
                    <h3>书名</h3>
                </td>


                <td>
                    <%=book%>
                </td>

        </table>
    </div>
    <%}%>
</form>
</body>
</html>
