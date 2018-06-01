package controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class update extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("gbk");
        PrintWriter out = resp.getWriter();
        HttpSession session = req.getSession();
        String username = (String) session.getAttribute("username");
        String password = req.getParameter("password");
        String password1 = req.getParameter("password1");
        String password2 = req.getParameter("password2");


        System.out.println(username);
        if (connectMysql.select(username, password) == 1) {
            if(!password1.equals(password2)){
                out.print("<html>" +
                        "<body>" +
                        "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                        "           alert(\'两次密码不一致！！！\');\n" +
                        "           window.document.location.href=\'update.jsp\';\n" +
                        "</script>" +
                        "</body>");
            }
            else{
                connectMysql.update(username,password1);
                session.invalidate();
                out.print("<html>" +
                        "<body>" +
                        "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                        "           alert(\'修改成功！！！\');\n" +
                        "           window.document.location.href=\'index.jsp\';\n" +
                        "</script>" +
                        "</body>");
            }
        } else {
            out.print("<html>" +
                    "<body>" +
                    "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                    "           alert(\'原密码错误！！！\');\n" +
                    "           window.document.location.href=\'update.jsp\';\n" +
                    "</script>" +
                    "</body>");
        }
    }
}
