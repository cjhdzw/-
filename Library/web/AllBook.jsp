<%@ page import="controller.connectMysql,model.book" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    h1
    {
        background: #5599FF;
    }
    button
    {
        border:2px solid;
        padding:3px 20px;
        background: #cccccc;
        -webkit-border-radius: 25px;
    }
</style>

<div align="center">
    <h1>所有图书：</h1>
    <%
        connectMysql.init();
        ArrayList<book> list = connectMysql.AllBook();
    %>

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
                <button><a href="ManageLogin.jsp">return</a></button>
        </tr>
        <%
            while(!list.isEmpty()){
                book bk = list.get(0);
                System.out.println(list.size());
        %>
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
        <%
                list.remove(0);}
        %>
    </table>
</div>
