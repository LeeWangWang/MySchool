package web.servlet;

import service.CourseService;
import service.impl.CourseServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


/**
 *  @Author: 李旺旺
 *  @Date: 2020/1/5 15:33
 *  @Description:
 */
@WebServlet("/course/*")
public class CourseServlet extends BaseServlet {

    private CourseService courseService = new CourseServiceImpl();

    public void findAllClass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<String> list = courseService.findAllClass();
        System.out.println("CourseServlet的findAllClass方法结果："+list);
        writeValue(list, response);
    }


}
