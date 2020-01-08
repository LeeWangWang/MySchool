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
import java.util.*;

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

    public void findOneStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tele = request.getParameter("tele");
        String className = request.getParameter("className");
        SignUpUser signUpUser = signUpUserService.findOneStudent(tele, className);
        System.out.println("学生信息："+signUpUser.toString());
        writeValue(signUpUser, response);
    }

    public void updateStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String[]> map = request.getParameterMap();
        Set<String> keyset = map.keySet();
        String userTele = null;
        String className = null;
        SignUpUser student = new SignUpUser();
        //遍历map
        System.out.println("********************遍历map********************");
        for (String key:keyset){
            String value = map.get(key)[0];
            if (key.equals("userTele")){ userTele = value; }
            if (key.equals("className")){ className = value; }
            if (key.equals("name")){ student.setName(value); }
            if (key.equals("tele")){ student.setTele(value); }
            if (key.equals("age")){ int age = Integer.parseInt(value); student.setAge(age); }
            if (key.equals("sex")){ student.setSex(value); }
            if (key.equals("address")){ student.setAddress(value); }
            if (key.equals("parentName")){ student.setParentName(value); }
            if (key.equals("parentTele")){ student.setParentTele(value); }
            if (key.equals("coursesName")){ student.setCoursesName(value); }
            System.out.println(key+" : " + value);
        }
        System.out.println("****************生成student内容******************");
        System.out.println(student.toString());
        System.out.println("****************生成student内容******************");
        //调用service更新学生信息
        SignUpUser signUpUser = signUpUserService.updateStudent(student, userTele, className);
        if (signUpUser != null){
            System.out.println("更新成功");
        }else {
            System.out.println("更新失败");
        }
        writeValue(signUpUser, response);
    }

    public void deleteStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tele = request.getParameter("tele");
        String coursesName = request.getParameter("coursesName");
        System.out.println("deleteStudent的参数  tele:" + "coursesName" + tele + coursesName);
        signUpUserService.deleteStudent(tele, coursesName);
    }


}
