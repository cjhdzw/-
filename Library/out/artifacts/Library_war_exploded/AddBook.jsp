<%--
  Created by IntelliJ IDEA.
  User: cjh
  Date: 2018/5/31
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
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
    <form action="AddBook.jsp" method="post">
        <div align="center">
            <h1>添加图书</h1>
        </div>
        <div align="center">
            <table>
                <tr>书名:<br>
                    <input type="text" name="bookname" placeholder="bookname">
                </tr><br>
                <tr>作者:<br>
                    <input type="text" name="author" placeholder="author">
                </tr><br>
                <tr>出版社:<br>
                    <input type="text" name="press" placeholder="press">
                </tr><br>
                <tr><br>
                    <input type="submit" value="submit" class="sub">
                    <button><a href="ManageLogin.jsp">return</a></button>
                </tr><br>
            </table>
        </div>


         <%
             String bookname= request.getParameter("bookname");
             String author= request.getParameter("author");
             String press= request.getParameter("press");
             connectMysql.init();
             if(bookname!=""){
                connectMysql.insertBook(bookname,author,press);
                if(bookname!=null){
        %>
        <div align="center">
            <h3>添加书籍成功</h3>
            <table width="400" border="0" cellspacing="0" cellpadding="0">
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
                        <%=bookname%>
                    </td>
                    <td>
                        <%=author%>
                    </td>
                    <td>
                        <%=press%>
                    </td>
                </tr>
            </table>
        </div>
        <%
            }
             }
        %>
    </form>

</body>
</html>
