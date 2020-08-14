package web.servlet;

import service.impl.examPolicyServiceImpl;
import service.impl.highSchoolServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/changeSchoolServlet")
public class changeSchoolServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置request编码格式
        System.out.println("过来了");
        request.setCharacterEncoding("utf-8");
        String schoolname = request.getParameter("mingzi");
        String website = request.getParameter("wangzhan");
        String address = request.getParameter("lianxi");
        String area = request.getParameter("diqu");
        String phone = request.getParameter("shouji");
        String intro = request.getParameter("jianjie");
        System.out.println("简介:"+intro);
        highSchoolServiceImpl eaImpl = new highSchoolServiceImpl();
        eaImpl.updateSchool(schoolname,website,address,area,phone,intro);
        request.getRequestDispatcher("/adminSchool.jsp").forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
