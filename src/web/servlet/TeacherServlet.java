package web.servlet;

import domain.School;
import domain.Teacher;
import org.apache.commons.beanutils.BeanUtils;
import service.SchoolService;
import service.TeacherService;
import service.impl.SchoolServiceImpl;
import service.impl.TeacherServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

/**
 * @Author: 李旺旺
 * @Date: 2020/1/8 20:06
 * @Description:
 */
@WebServlet("/teacher/*")
public class TeacherServlet extends BaseServlet{

    private TeacherService teacherService = new TeacherServiceImpl();
    private SchoolService schoolService = new SchoolServiceImpl();

    public void findTeacher(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Teacher> list = teacherService.findTeacher();
        System.out.println("教师列表信息：" + list.toString());
        //响应数据
        writeValue(list, response);
    }

    public void updateTeacher(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        int id = Integer.parseInt(idStr);
        String name = request.getParameter("name");
        String introduce = request.getParameter("introduce");
        Boolean result = teacherService.updateTeacher(id, name, introduce);
        System.out.println("更新教师信息结果:" + result);
        //响应数据
        writeValue(result, response);
    }

    public void findOneTeacher(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        int id = Integer.parseInt(idStr);
        Teacher teacher = teacherService.findOneTeacher(id);
        writeValue(teacher, response);
    }



}
