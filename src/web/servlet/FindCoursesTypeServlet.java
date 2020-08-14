package web.servlet;



import service.CoursesService;
import service.impl.CoursesServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet("/findCoursesTypeServlet")
public class FindCoursesTypeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CoursesService service = new CoursesServiceImpl();
        List<String> coursesName = service.findCoursesName();
        request.getSession().setAttribute("coursesName",coursesName);
        response.sendRedirect(request.getContextPath()+"/SignUpInterface.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
