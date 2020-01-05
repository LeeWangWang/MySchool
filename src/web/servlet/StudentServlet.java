package web.servlet;

import domain.SignUpUser;
import service.SignUpUserService;
import service.impl.SignUpUserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 *  @Author: 李旺旺
 *  @Date: 2020/1/4 19:18
 *  @Description: 学生信息Servlet
 */
@WebServlet("/student/*")
public class StudentServlet extends BaseServlet {

    private SignUpUserService signUpUserService = new SignUpUserServiceImpl();

    public void findAllStudents(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<SignUpUser> list = signUpUserService.findAllStudents();
        //System.out.println("SignUpUserServlet的findAllStudents方法结果："+list);
        writeValue(list, response);
    }

}
