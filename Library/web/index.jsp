
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>登录</title>
      <style>
          h1
          {
              background: #5599FF;
          }
          h2
          {
              background: #1Effff;
          }
          .in{
              border: 1px solid #ccc;
              padding: 7px 0px;
              border-radius: 3px; /*css3属性IE不支持*/
              padding-left:5px;
          }
          .sub
          {
              border:2px solid;
              padding:3px 20px;
              background: #2Effff;
              -webkit-border-radius: 25px;
          }
          .ma
          {
              border:2px solid;
              padding:3px 23px;
              background: #cccccc;
              -webkit-border-radius: 25px;
          }
          .but
          {
              border:2px solid;
              padding:3px 20px;
              background: #5599FF;
              -webkit-border-radius: 25px;
          }
      </style>
  </head>
  <body>
    <%
      if(session.getAttribute("username")==null){
    %>
    <form action="login" method="post">
        <div align="center">
            <h1>图书管理系统</h1>
        </div>
        <div align="center">
            <h2>用户登录</h2>
        </div>

        <div align="center">
            <table>username:
                <tr>
                    <input type="text" name="username" class="in" placeholder="username"><br>
                </tr>password:
                <tr>
                    <input type="password" name="password" class="in" placeholder="password"><br><br>
                </tr>
                <tr>
                    <input type="submit" value="登录" class="sub">
                    <button class="but"><a href="register.jsp">注册</a></button><br>
                </tr>
            </table>
        </div>
        <div align="center" >
            <button class="ma"><a href="Manageindex.jsp">管理员身份登录</a></button>
        </div>

    </form>
    <%
        }else {
            response.sendRedirect("login.jsp");
            }
    %>
  </body>
</html>
