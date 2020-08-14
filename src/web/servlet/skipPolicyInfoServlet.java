package web.servlet;

import domain.entranceExaminationGrade;
import domain.examPolicy;
import domain.highSchool;
import service.impl.examPolicyServiceImpl;
import service.impl.highSchoolServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.Policy;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet("/skipPolicyInfoServlet")
public class skipPolicyInfoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String title = request.getParameter("title");
        String time = request.getParameter("time");
        String content = request.getParameter("content");
        /*System.out.println("title:"+title+"   time:"+time+"   content:"+content);*/
        HttpSession session = request.getSession();
        session.setAttribute("title",title);
        session.setAttribute("time",time);
        session.setAttribute("content",content);
        request.getRequestDispatcher("/policyInfoView.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
