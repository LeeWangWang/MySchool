package web.servlet;

import dao.impl.CollegeDaoImpl;
import domain.College;
import domain.PageBean;
import service.CollegeService;
import service.impl.CollegeServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet("/collegePageServlet")
public class CollegePageServlet extends HttpServlet {
    CollegeService collegeService = new CollegeServiceImpl(new CollegeDaoImpl());
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //1.获取参数
        String currentPage = request.getParameter("currentPage");//当前页码
        String rows = request.getParameter("rows");//每页显示条数
        if(currentPage == null || "".equals(currentPage)){

            currentPage = "1";
        }
        if(rows == null || "".equals(rows)){
            rows = "8";
        }
        //获取条件查询参数
        Map<String, String[]> condition = request.getParameterMap();

        System.out.println(condition);
        PageBean<College> pb = collegeService.selectAllCollegePage(currentPage,rows,condition);
        System.out.println(pb);
        request.setAttribute("pageColleges",pb);
        //3.将PageBean存入request
        request.setAttribute("pb",pb);
        request.setAttribute("condition",condition);//将查询条件存入request
        //4.转发到list.jsp
        request.getRequestDispatcher("/college_search.jsp").forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
