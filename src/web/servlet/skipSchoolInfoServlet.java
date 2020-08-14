package web.servlet;

import domain.entranceExaminationGrade;
import domain.highSchool;
import service.impl.highSchoolServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/skipSchoolInfoServlet")
public class skipSchoolInfoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String msg = request.getParameter("msg");

        highSchoolServiceImpl hsImpl = new highSchoolServiceImpl();
        //这里得到学校的简介和详细信息
        highSchool h = new highSchool();
        h = hsImpl.querySchoolBySchoolName(msg);

        //这里的到学校在所有地区的
        List<entranceExaminationGrade> f = new ArrayList<entranceExaminationGrade>();
        f = hsImpl.queryZeXianTu(msg);

        HttpSession session = request.getSession();
        session.setAttribute("schoolInformation",h);
        session.setAttribute("zhuzhuangtu",f);
        request.getRequestDispatcher("/highSchoolInfoView.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    private void judgeArea(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        request.setCharacterEncoding("utf-8");
        highSchoolServiceImpl hsImpl = new highSchoolServiceImpl();
        /*list = hsImpl.queryAllSchoolName();
        HttpSession session = request.getSession();
        session.setAttribute("schoolName_area",list);
        request.getRequestDispatcher("/highSchoolView.jsp").forward(request,response);*/
       /* String area = request.getParameter("area");*/
        System.out.println("访问过来了");
        request.getRequestDispatcher("/highSchoolInfoView.jsp").forward(request,response);
    }
}
