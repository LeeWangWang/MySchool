package web.servlet;

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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/findAllViewInfoServlet")
public class findAllViewInfoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        /*所有的学校*/
        List<highSchool> list_sn = new ArrayList<highSchool>();
        highSchoolServiceImpl hsImpl = new highSchoolServiceImpl();
        list_sn = hsImpl.queryAllSchoolName();
        HttpSession session = request.getSession();
        session.setAttribute("schoolName_area",list_sn);

        /*所有的政策资讯*/
        ArrayList<examPolicy> ealist = new ArrayList<examPolicy>();
        examPolicyServiceImpl exImpl = new examPolicyServiceImpl();
        ealist = exImpl.queryAllPolicy();
        session.setAttribute("AllpolicyInfo",ealist);
        /*System.out.println("chenggong");*/
        request.getRequestDispatcher("/highSchoolView.jsp").forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
