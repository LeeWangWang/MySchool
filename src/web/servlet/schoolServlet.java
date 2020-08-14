package web.servlet;

import domain.School;
import org.apache.commons.beanutils.BeanUtils;
import service.SchoolService;
import service.impl.SchoolServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

/**
 * @Author: 李旺旺
 * @Date: 2020/1/8 20:06
 * @Description:
 */
@WebServlet("/school/*")
public class schoolServlet extends BaseServlet{

    private SchoolService schoolService = new SchoolServiceImpl();

    public void findSchool(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        School school = schoolService.findSchool();
        System.out.println("学校信息：" + school.toString());
        //响应数据
        writeValue(school, response);
    }

    public void updateSchool(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String[]> map = request.getParameterMap();
        //2.封装Admin对象
        School school = new School();
        try {
            BeanUtils.populate(school,map);
        }catch (IllegalAccessException e){
            System.out.println("web.servlet.AdminServlet.login.IllegalAccessException");
        }catch (InvocationTargetException e){
            System.out.println("web.servlet.AdminServlet.login.InvocationTargetException");
        }
        Boolean result = schoolService.updateSchool(school);
        System.out.println("更新学校信息结果:" + result);
        //响应数据
        writeValue(result, response);
    }


}
