
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>欢迎注册</title>

    <style>
        input{
            border: 1px solid #5599FF;
            padding: 7px 0px;
            border-radius: 3px; /*css3属性IE不支持*/
            padding-left:5px;
        }
        h1
        {
            background: #5599FF;
            text-shadow: #1Effff;
        }
        h3
        {

        }
        .sub
        {
            border:2px solid;
            padding:3px 20px;
            background: #2Effff;
            -webkit-border-radius: 25px;
        }
        .but
        {
            border:2px solid;
            padding:3px 60px;
            background: #5599FF;
            -webkit-border-radius: 25px;
        }
    </style>
</head>
<body>
          <form action="register" method="post">
              <div align="center">
                  <h1>欢迎注册</h1>
              </div>
              <div align="center">
                  <h3>username</h3><input type="text" name="username" placeholder="邮箱或手机号">
                  <h3>password</h3><input type="password" name="password1" placeholder="登录密码">
                  <h3>password</h3><input type="password" name="password2" placeholder="确认密码">
                  <br><br><input type="submit" value="注册" class="but">
              </div>
          </form>
</body>
</html>
