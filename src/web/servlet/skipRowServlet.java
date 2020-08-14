package web.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/skipRowServlet")
public class skipRowServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("id");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        System.out.println("id:"+id+"   title:"+title+"  content"+content);
        HttpSession session = request.getSession();
        session.setAttribute("id",id);
        session.setAttribute("title",title);
        session.setAttribute("content",content);

        request.getRequestDispatcher("/changePolicyView.jsp").forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
