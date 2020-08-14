package web.servlet;

import service.impl.examPolicyServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/changePolicyServlet")
public class changePolicyServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置request编码格式
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("id_change");
        String title = request.getParameter("title_change");
        String content = request.getParameter("content_change");

        examPolicyServiceImpl eaImpl = new examPolicyServiceImpl();
        eaImpl.updatePolicy(Integer.parseInt(id),title,content);
        request.getRequestDispatcher("/adminPolicy.jsp").forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
