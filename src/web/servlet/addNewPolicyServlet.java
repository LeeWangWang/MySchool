package web.servlet;

import service.impl.examPolicyServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addNewPolicyServlet")
public class addNewPolicyServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置request编码格式
        request.setCharacterEncoding("utf-8");
        String title = request.getParameter("biaoti");
        String content = request.getParameter("neirong");
        /*System.out.println("标题："+title+"  内容："+content);*/
        examPolicyServiceImpl eaImpl = new examPolicyServiceImpl();
        eaImpl.addNewPolicy(title,content);
        request.getRequestDispatcher("/adminPolicy.jsp").forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}


