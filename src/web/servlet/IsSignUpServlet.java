package web.servlet;

import domain.User;
import service.SignUpUserService;
import service.impl.SignUpUserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/isSignUpServlet")
public class IsSignUpServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String currentCousesVideoName = request.getParameter("cousesVideoName");
        String currentVideoPath = request.getParameter("videoPath");
        String currentTeacherName = request.getParameter("teacherName");
        String currentVideoIntroduce = request.getParameter("videoIntroduce");

        User user = (User) request.getSession().getAttribute("user");
        String userName = user.getName();
        SignUpUserService service = new SignUpUserServiceImpl();
        Boolean result = service.isSignUp(userName);
        if (result == true){
            request.getSession().setAttribute("currentCousesVideoName",currentCousesVideoName);
            request.getSession().setAttribute("currentVideoPath",currentVideoPath);
            request.getSession().setAttribute("currentTeacherName",currentTeacherName);
            request.getSession().setAttribute("currentVideoIntroduce",currentVideoIntroduce);
            response.sendRedirect(request.getContextPath()+"/VideoInterface.jsp");
        }else{
            request.getSession().setAttribute("video_msg","请您先报名后，享受网上教程");
            response.sendRedirect(request.getContextPath()+"/findVideoByPageServlet");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
