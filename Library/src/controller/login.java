package controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("gbk");
        PrintWriter out = resp.getWriter();
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        connectMysql.init();
        if(connectMysql.select(username,password)==1){
            HttpSession session = req.getSession();
            session.setAttribute("username",username);
            resp.sendRedirect("login.jsp");
        }
        else if(connectMysql.select(username,password)==-2){
            out.print("<html>" +
                    "<body>" +
                    "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                    "           alert(\'密码错误！！！\');\n" +
                    "           window.document.location.href=\'index.jsp\';\n" +
                    "</script>" +
                    "</body>");
        }else if(connectMysql.select(username,password)==-1){
            out.print("<html>" +
                    "<body>" +
                    "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                    "           alert(\'不存在该用户！！！\');\n" +
                    "           window.document.location.href=\'index.jsp\';\n" +
                    "</script>" +
                    "</body>");
        }
    }
}
