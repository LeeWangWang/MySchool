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
import javax.swing.text.html.HTMLDocument;
import java.io.IOException;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

@WebServlet("/collegeServlet")
public class CollegeServlet extends HttpServlet {
    CollegeService collegeService = new CollegeServiceImpl(new CollegeDaoImpl());
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String funcName = request.getParameter("funcName");
        if("findCollegeAttribute".equals(funcName)){
            findCollegeAttribute(request,response);
        }
        if("findAllCollegePage".equals(funcName)){
            findAllCollegePage(request,response);
        }
        if("dealCollege".equals(funcName)){
            dealCollege(request,response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
    private void findAllCollege(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        List<College> colleges = collegeService.selectAllCollege();
        for(College item : colleges){
            System.out.println(item.toString());
        }
        request.setAttribute("colleges",colleges);
        System.out.println(colleges);
        request.getRequestDispatcher("/college_search.jsp").forward(request,response);
    }
    private void findAllCollegePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        request.setCharacterEncoding("utf-8");
        //1.获取参数
        String currentPage = request.getParameter("currentPage");//当前页码
        String rows = request.getParameter("rows");//每页显示条数
        String keys = request.getParameter("keys");
        String valuess = request.getParameter("valuess");
        request.setAttribute("keys",keys);
        request.setAttribute("valuess",valuess);
        if(currentPage == null || "".equals(currentPage)){
            currentPage = "1";
        }
        if(rows == null || "".equals(rows)){
            rows = "10";
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

    private void dealCollege(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        request.setCharacterEncoding("utf-8");
        //1.获取参数
        String currentPage = request.getParameter("currentPage");//当前页码
        String rows = request.getParameter("rows");//每页显示条数
        String keys = request.getParameter("keys");
        String valuess = request.getParameter("valuess");
        request.setAttribute("keys",keys);
        request.setAttribute("valuess",valuess);
        if(currentPage == null || "".equals(currentPage)){
            currentPage = "1";
        }
        if(rows == null || "".equals(rows)){
            rows = "10";
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
        request.getRequestDispatcher("/college_list.jsp").forward(request,response);
    }

    private void findCollegeByLocation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String location = request.getParameter("location");
        List<College> colleges = collegeService.selectCollegeByLocation(location);
        for(College item : colleges){
            System.out.println(item.toString());
        }
        request.removeAttribute("colleges");
        request.setAttribute("colleges",colleges);
        System.out.println(colleges);
        request.getRequestDispatcher("/college_search.jsp").forward(request,response);
    }
    private void findCollegeByIsDoubouTop(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        List<College> colleges = collegeService.selectCollegeByIsDoubleTop();
        for(College item : colleges){
            System.out.println(item.toString());
        }
        request.removeAttribute("colleges");
        request.setAttribute("colleges",colleges);
        System.out.println(colleges);
        request.getRequestDispatcher("/college_search.jsp").forward(request,response);
    }
    private void findCollegeByIs985(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        List<College> colleges = collegeService.selectCollegeByIs985();
        for(College item : colleges){
            System.out.println(item.toString());
        }
        request.removeAttribute("colleges");
        request.setAttribute("colleges",colleges);
        System.out.println(colleges);
        request.getRequestDispatcher("/college_search.jsp").forward(request,response);
    }
    private void findCollegeByIs211(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        List<College> colleges = collegeService.selectCollegeByIs211();
        for(College item : colleges){
            System.out.println(item.toString());
        }
        request.removeAttribute("colleges");
        request.setAttribute("colleges",colleges);
        System.out.println(colleges);
        request.getRequestDispatcher("/college_search.jsp").forward(request,response);
    }
    private void findCollegeNormal(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        List<College> colleges = collegeService.selectCollegeNormal();
        for(College item : colleges){
            System.out.println(item.toString());
        }
        request.removeAttribute("colleges");
        request.setAttribute("colleges",colleges);
        System.out.println(colleges);
        request.getRequestDispatcher("/college_search.jsp").forward(request,response);
    }
    private void findCollegeByMainType(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String mainType = request.getParameter("mainType");
        List<College> colleges = collegeService.selectCollegeByMainType(mainType);
        for(College item : colleges){
            System.out.println(item.toString());
        }
        request.removeAttribute("colleges");
        request.setAttribute("colleges",colleges);
        System.out.println(colleges);
        request.getRequestDispatcher("/college_search.jsp").forward(request,response);
    }
    private void findCollegeByStudyType(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String studyType = request.getParameter("studyType");
        List<College> colleges = collegeService.selectCollegeByStudyType(studyType);
        for(College item : colleges){
            System.out.println(item.toString());
        }
        request.removeAttribute("colleges");
        request.setAttribute("colleges",colleges);
        System.out.println(colleges);
        request.getRequestDispatcher("/college_search.jsp").forward(request,response);
    }
    private void findCollegeAttribute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        List<String> locations = collegeService.selectLocations();
        List<String> mainTypes = collegeService.selectMainType();
        request.setAttribute("locations",locations);
        request.setAttribute("mainTypes",mainTypes);
        request.getRequestDispatcher("/gaokaoHome.jsp").forward(request,response);
    }
    private void findCollegeByConditions(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
//        JSONObject
//
//        request.setAttribute("locations",locations);
//        request.setAttribute("mainTypes",mainTypes);
        request.getRequestDispatcher("/gaokaoHome.jsp").forward(request,response);
    }

}
