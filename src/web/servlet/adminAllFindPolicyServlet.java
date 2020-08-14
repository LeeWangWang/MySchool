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

@WebServlet("/adminAllFindPolicyServlet")
public class adminAllFindPolicyServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        ArrayList<examPolicy> list = new ArrayList<examPolicy>();
        examPolicyServiceImpl epImpl = new examPolicyServiceImpl();
        list = epImpl.queryAllPolicy();
        HttpSession session = request.getSession();
        session.setAttribute("allPolicy",list);
        request.getRequestDispatcher("/adminPolicy.jsp").forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}

