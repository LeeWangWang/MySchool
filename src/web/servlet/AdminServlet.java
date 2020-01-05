package web.servlet;

import domain.Admin;
import domain.ResultInfo;
import org.apache.commons.beanutils.BeanUtils;
import service.AdminService;
import service.impl.AdminServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

/**
 * @Author: 李旺旺
 * @Date: 2019/12/30 16:12
 * @Description: 管理员信息Servlet
 */
@WebServlet("/admin/*")
public class AdminServlet extends BaseServlet {

    private AdminService adminService = new AdminServiceImpl();

    /**
    * @Author:  李旺旺
    * @Date:    2020/1/5 11:27
    * @param:   [request, response]
    * @Return:  void
    * @Exception:
    * @Description: 管理员登录
    */
    public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.获取账号和密码
        Map<String, String[]> map = request.getParameterMap();
        //2.封装Admin对象
        Admin admin = new Admin();
        try {
            BeanUtils.populate(admin,map);
        }catch (IllegalAccessException e){
            System.out.println("web.servlet.AdminServlet.login.IllegalAccessException");
        }catch (InvocationTargetException e){
            System.out.println("web.servlet.AdminServlet.login.InvocationTargetException");
        }
        //3.调用service查询
        Admin ad = adminService.login(admin);

        ResultInfo resultInfo = new ResultInfo();

        //4.判断管理员对象是否为空
        if (ad == null){
            resultInfo.setFlag(false);
            resultInfo.setErrorMsg("账号或密码错误");
        }
        if (ad != null){
            //登录成功标记
            System.out.println("登录成功   账号：  "+ ad.getAccount()+"  密码：  "+ad.getPassword());
            request.getSession().setAttribute("admin",ad);
            resultInfo.setFlag(true);
        }
        //响应数据
        writeValue(resultInfo, response);
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
        response.sendRedirect(request.getContextPath() + "/adminLogin.jsp");
    }

}



