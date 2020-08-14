package web.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/skikRowSchoolServlet")
public class skikRowSchoolServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String name = request.getParameter("name_1");
        String website = request.getParameter("website_1");
        String intro = request.getParameter("intro_1");
        String address = request.getParameter("address_1");
        String area = request.getParameter("area_1");
        String phone = request.getParameter("phone_1");
        //System.out.println("访问到这里了");
        //System.out.println("木正阿勇address:"+address+"   area:"+area+"     phone:"+phone);
        HttpSession session = request.getSession();
        session.setAttribute("name_2",name);
        session.setAttribute("website_2",website);
        session.setAttribute("intro_2",intro);
        session.setAttribute("address_2",address);
        session.setAttribute("area_2",area);
        session.setAttribute("phone_2",phone);

        request.getRequestDispatcher("/changeSchoolView.jsp").forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
