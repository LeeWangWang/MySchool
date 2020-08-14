package web.servlet;

import dao.impl.coursesDao;
import domain.Courses;

import java.io.IOException;
import java.util.List;


public class CoursesServlet extends javax.servlet.http.HttpServlet {
    private coursesDao coursesdao;
//    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
//
//    }

    @Override
    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        try {
            List<Courses> list= coursesDao.getAllcourses();   //执行dao方法
            request.setAttribute("list", list); //保存到request方便前台调用
            request.getRequestDispatcher("/index.jsp").forward(request,response);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
