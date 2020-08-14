package web.servlet;


import domain.VideoPageBean;
import service.CousesVideoService;
import service.impl.CousesVideoServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/findVideoByPageServlet")
public class FindVideoByPageServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String rows = request.getParameter("rows");
        String currentPage = request.getParameter("currentPage");
        if (rows==null||"".equals(rows)){
            rows="8";
        }
        if (currentPage==null||"".equals(currentPage)){
            currentPage="1";
        }
        CousesVideoService service = new CousesVideoServiceImpl();
        VideoPageBean pageBean = service.findVideoByPage(rows,currentPage);
        request.setAttribute("pageBean",pageBean);
        request.getRequestDispatcher("/VideoListInterface.jsp").forward(request,response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
