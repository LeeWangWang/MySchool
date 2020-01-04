package web.servlet;

import domain.SignUpUser;
import service.SignUpUserService;
import service.impl.SignUpUserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 *  @Author: 李旺旺
 *  @Date: 2020/1/4 19:18
 *  @Description: 学生信息Servlet
 */
@WebServlet("/studentServlet")
public class StudentServlet extends HttpServlet {

    private SignUpUserService signUpUserService = new SignUpUserServiceImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String funcName = null;
        funcName = request.getParameter("funcName");
        System.out.println("传到Servlet的方法是：" + funcName);
        if ("findAllStudents".equals(funcName)){
            findAllStudents(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    private void findAllStudents(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<SignUpUser> list = signUpUserService.findAll();
        System.out.println("SignUpUserServlet的findAll方法结果："+list);
        request.setAttribute("students", list);
        request.getRequestDispatcher("/tab_students.jsp").forward(request, response);
    }

}
