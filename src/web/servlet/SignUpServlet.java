package web.servlet;

import domain.SignUpUser;
import org.apache.commons.beanutils.BeanUtils;
import service.CoursesService;
import service.SignUpUserService;
import service.impl.CoursesServiceImpl;
import service.impl.SignUpUserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.Map;

@WebServlet("/signUpServlet")
public class SignUpServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        Map<String, String[]> parameterMap = request.getParameterMap();
        String coursesName = request.getParameter("coursesName");
        String name = request.getParameter("name");
        SignUpUser signUpUser = new SignUpUser();
        try {
            BeanUtils.populate(signUpUser,parameterMap);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        System.out.println("///////////////////////"+signUpUser);
        SignUpUserService service = new SignUpUserServiceImpl();
        Boolean signUpResult = service.signUp(signUpUser,name,coursesName);
        System.out.println(signUpResult);
        if (signUpResult == true){
            CoursesService coursesService = new CoursesServiceImpl();
            Date cousesTime = coursesService.findCousesTime(coursesName);
            request.getSession().setAttribute("signUpUser",signUpUser);
            request.getSession().setAttribute("cousesTime",cousesTime);
            response.sendRedirect(request.getContextPath()+"/SignUpSuccessInterface.jsp");

        }else {
            request.getSession().setAttribute("signUp_msg","报名失败");
            request.getRequestDispatcher("/SignUpInterface.jsp").forward(request,response);
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
