package web.servlet;

import dao.impl.CollegeDaoImpl;
import dao.impl.CollegeFractionDaoImpl;
import domain.College;
import domain.CollegeFraction;
import domain.PageBean;
import service.CollegeFractionService;
import service.CollegeService;
import service.impl.CollegeFractionServiceImpl;
import service.impl.CollegeServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/collegeDealServlet")
public class CollegeDealServlet extends HttpServlet {
    CollegeService collegeService = new CollegeServiceImpl(new CollegeDaoImpl());
    CollegeFractionService collegeFractionService = new CollegeFractionServiceImpl(new CollegeFractionDaoImpl());
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String funcName = request.getParameter("funcName");
        if("changeCollege".equals(funcName)){
            changeCollege(request,response);
        }
        if("addCollege".equals(funcName)){
            addCollege(request,response);
        }
        if("deleteCollege".equals(funcName)){
            deleteCollege(request,response);
        }
        if("viewCollegeByCollegeId".equals(funcName)){
            viewCollegeByCollegeId(request,response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
    private void viewCollegeByCollegeId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String sCollegeId = request.getParameter("collegeId");
        College detailCollege;
        if(!"xxx".equals(sCollegeId)){
            int collegeId = Integer.valueOf(sCollegeId);
            detailCollege = collegeService.selectCollegeById(collegeId);
            request.setAttribute("detailCollege",detailCollege);
//        request.setAttribute("collegeFractions",collegeFractions);

            request.getRequestDispatcher("/college_info.jsp").forward(request,response);
        }else{
            detailCollege = new College(0,"请输入大学名称","请输入大学地点","请输入大学官网"," 请输入大学是否为双一流，是输入Y否输入N"," 请输入大学是否为985，是输入Y否输入N"," 请输入大学是否为211，是输入Y否输入N","普通本科","综合类","请输入大学的介绍");
            request.setAttribute("detailCollege",detailCollege);
//        request.setAttribute("collegeFractions",collegeFractions);

            request.getRequestDispatcher("/college_infoAdd.jsp").forward(request,response);
        }

    }
    private void changeCollege(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        request.setCharacterEncoding("utf-8");
        int collegeId = Integer.valueOf(request.getParameter("collegeId"));
        String collegeName = request.getParameter("collegeName");
        String collegeLocation = request.getParameter("collegeLocation");
        String collegeWebsite = request.getParameter("collegeWebsite");
        String collegeIsDoubleTop = request.getParameter("collegeIsDoubleTop");
        String collegeIs985 = request.getParameter("collegeIs985");
        String collegeIs211 = request.getParameter("collegeIs211");
        String collegeMainType = request.getParameter("collegeMainType");
        String collegeStudyType = request.getParameter("collegeStudyType");
        String collegeIntroduction = request.getParameter("collegeIntroduction");
        System.out.println(collegeName+collegeLocation+collegeWebsite+collegeIsDoubleTop+collegeIs985+collegeIs211+collegeMainType+collegeStudyType+collegeIntroduction);
        int result = collegeService.updateCollege(collegeId,collegeName,collegeLocation,collegeWebsite,collegeIsDoubleTop,collegeIs985,collegeIs211,collegeMainType,collegeStudyType,collegeIntroduction);
        //1.获取参数
        response.sendRedirect("collegeServlet?funcName=dealCollege");
    }
    private void addCollege(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        request.setCharacterEncoding("utf-8");
        String collegeName = request.getParameter("collegeName");
        String collegeLocation = request.getParameter("collegeLocation");
        String collegeWebsite = request.getParameter("collegeWebsite");
        String collegeIsDoubleTop = request.getParameter("collegeIsDoubleTop");
        String collegeIs985 = request.getParameter("collegeIs985");
        String collegeIs211 = request.getParameter("collegeIs211");
        String collegeMainType = request.getParameter("collegeMainType");
        String collegeStudyType = request.getParameter("collegeStudyType");
        String collegeIntroduction = request.getParameter("collegeIntroduction");
        System.out.println(collegeName+collegeLocation+collegeWebsite+collegeIsDoubleTop+collegeIs985+collegeIs211+collegeMainType+collegeStudyType+collegeIntroduction);
        int result = collegeService.addCollege(collegeName,collegeLocation,collegeWebsite,collegeIsDoubleTop,collegeIs985,collegeIs211,collegeMainType,collegeStudyType,collegeIntroduction);
        //1.获取参数
        response.sendRedirect("collegeServlet?funcName=dealCollege");
    }
    private void deleteCollege(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        request.setCharacterEncoding("utf-8");
        int collegeId = Integer.valueOf(request.getParameter("collegeId"));
        int result = collegeService.deleteCollege(collegeId);
        //1.获取参数
        response.sendRedirect("collegeServlet?funcName=dealCollege");
    }
}
