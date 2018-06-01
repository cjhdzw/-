<%@ page import="controller.connectMysql" %>
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
        if(book!="")
            connectMysql.deleteBook(book);
    %>
</form>
</body>
</html>
