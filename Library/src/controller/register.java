package controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class register extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("gbk");
        PrintWriter out = resp.getWriter();
        String user = req.getParameter("username");
        String password1 = req.getParameter("password1");
        String password2 = req.getParameter("password2");

        connectMysql.init();
        if(connectMysql.seek(user)==-1){
            if(password1!="" && password1.equals(password2)){
                try{
                    connectMysql.insert(user,password1);
                    out.print("<script type=\"text/javascript\" language=\\\"javascript\\\">\n" +
                            "                    alert(\"注册成功！！！\");\n" +
                            "                    window.document.location.href=\"index.jsp\";\n" +
                            "          </script>");
            }catch(Exception e){}
        }else if(password1=="" && password2==""){
                out.print("<script type=\"text/javascript\" language=\\\"javascript\\\">\n" +
                        "                    alert(\"密码不能为空！！！\");\n" +
                        "                    window.document.location.href=\"register.jsp\";\n" +
                        "          </script>");
            }
        else {
                out.print("<script type=\"text/javascript\" language=\\\"javascript\\\">\n" +
                        "                    alert(\"两次密码不一致！！！\");\n" +
                        "                    window.document.location.href=\"register.jsp\";\n" +
                        "          </script>");
            }
        }else {
            out.print("<script type=\"text/javascript\" language=\\\"javascript\\\">\n" +
                    "                    alert(\"该用户名已存在！！！\");\n" +
                    "                    window.document.location.href=\"register.jsp\";\n" +
                    "          </script>");
        }
    }
}
