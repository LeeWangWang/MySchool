package web.servlet;



import dao.impl.CollegeDaoImpl;
import dao.impl.CollegeFractionDaoImpl;
import domain.College;
import domain.CollegeFraction;
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

@WebServlet("/collegeFractionServlet")
public class CollegeFractionServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("没进入doPost");
        request.setCharacterEncoding("utf-8");
        System.out.println("没获取参数");
        String funcName = request.getParameter("funcName");

        System.out.println("没进入查找方法");
        System.out.println(funcName);
        if("findCollegeFractionByCollegeId".equals(funcName)){
            findCollegeFractionByCollegeId(request,response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    private void findCollegeFractionByCollegeId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int collegeId = Integer.valueOf(request.getParameter("collegeId"));
        System.out.println("没进入Service");
        CollegeFractionService collegeFractionService = new CollegeFractionServiceImpl(new CollegeFractionDaoImpl());
        CollegeService collegeService = new CollegeServiceImpl(new CollegeDaoImpl());
        List<CollegeFraction> collegeFractions = collegeFractionService.selectCollegeFractionByCollegeId(collegeId);
        for(CollegeFraction item : collegeFractions){
            System.out.println(item.toString());
        }
        System.out.println(collegeId);
        College detailCollege = collegeService.selectCollegeById(collegeId);
        System.out.println(detailCollege);
        request.setAttribute("detailCollege",detailCollege);

        request.setAttribute("collegeFractions",collegeFractions);
        String studentWenli = request.getParameter("studentWenli");
        String studentFraction = request.getParameter("studentFraction");
        request.setAttribute("studentWenli",studentWenli);
        request.setAttribute("studentFraction",studentFraction);
        System.out.println(studentWenli+studentFraction);

        request.getRequestDispatcher("/college_detail.jsp").forward(request,response);
    }

}
