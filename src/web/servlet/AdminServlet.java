package web.servlet;

import domain.Admin;
import domain.ResultInfo;
import org.apache.commons.beanutils.BeanUtils;
import service.AdminService;
import service.impl.AdminServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

/**
 * @Author: 李旺旺
 * @Date: 2019/12/30 16:12
 * @Description: 管理员信息Servlet
 */
@WebServlet("/adminServlet")
public class AdminServlet extends HttpServlet {

    private AdminService adminService = new AdminServiceImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String funcName = request.getParameter("funcName");
        System.out.println("传到Servlet的方法是：" + funcName);
        if ("login".equals(funcName)){
            login(request, response);
        }
        if ("exit".equals(funcName)){
            exit(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    /**
    * @Author:  李旺旺
    * @Date:    2020/1/2 15:49
    * @param:   [request, response]
    * @Return:  void
    * @Exception:
    * @Description: 管理员登陆功能
    */
    public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码
        request.setCharacterEncoding("utf-8");
        //2.获取账号和密码
        Map<String, String[]> map = request.getParameterMap();
        //4.封装User对象
        Admin admin = new Admin();
        try {
            BeanUtils.populate(admin,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        HttpSession session = request.getSession();
        //5.调用Service查询
        Admin loginAdmin = adminService.login(admin);
        if (loginAdmin != null){
            //登录成功
            session.setAttribute("admin", loginAdmin);
            response.sendRedirect(request.getContextPath()+"/index.jsp");
        }else {
            //登录失败
            request.setAttribute("login_msg", "用户名或密码错误!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    /**
    * @Author:  李旺旺
    * @Date:    2020/1/2 15:51
    * @param:   [request, response]
    * @Return:  void
    * @Exception:
    * @Description: 管理员退出登录
    */
    public void exit(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //1.销毁session
        request.getSession().invalidate();
        //2.跳转页面
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }

}

