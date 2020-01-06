package web.servlet;

import domain.PageBean;
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

    public void findStudentByClassAndSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String className = request.getParameter("className");
        String search = request.getParameter("search");
        System.out.println("前端的参数:"+className+"， "+search);
        List<SignUpUser> list = signUpUserService.findStudentByClassAndSearch(className,search);
        //System.out.println("SignUpUserServlet的findStudentByClass方法结果："+list);
        writeValue(list, response);
    }

    public void findStudentPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String className = request.getParameter("className");
        String currentPageStr = request.getParameter("currentPage");
        String search = request.getParameter("search");
        //当前页码，如果不传递，则默认为第一页
        int currentPage = 0;
        if (currentPageStr != null && currentPageStr.length() > 0){
            currentPage = Integer.parseInt(currentPageStr);
        }else {
            currentPage = 1;
        }
        //每页显示条数，如果不传递，默认每页显示10条记录
        int pageSize = 10;
        System.out.println("service查询findStudentPage对象:"+"className:"+className+"  currentPage:"+currentPage+"  pageSize:"+pageSize+"  search:"+search);
        PageBean<SignUpUser> signUpUserPage = signUpUserService.pageQuery(className, currentPage, 10, search);
        //4.将pageBean对象序列化为json，返回
        writeValue(signUpUserPage, response);
    }

}
