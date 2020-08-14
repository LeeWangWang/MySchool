package web.servlet;

import service.impl.examPolicyServiceImpl;
import service.impl.highSchoolServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addNewSchoolServlet")
public class addNewSchoolServlet extends HttpServlet {
    @Override
    protected  void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置request编码格式
        request.setCharacterEncoding("utf-8");
        String schoolname = request.getParameter("schoolname");
        String website = request.getParameter("website");
        String intro = request.getParameter("intro");
        String address = request.getParameter("address");
        String area = request.getParameter("area");
        String phone = request.getParameter("phone");
        /*System.out.println("标题："+title+"  内容："+content);*/
        highSchoolServiceImpl eaImpl = new highSchoolServiceImpl();
        eaImpl.addNewSchool(schoolname,website,intro,address,area,phone);
        request.getRequestDispatcher("/adminSchool.jsp").forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
