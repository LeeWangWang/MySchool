package web.servlet;

import service.CategoryService;
import service.impl.CategoryServiceImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.rmi.server.ServerCloneException;
import java.util.List;

/**
 * @Author: 李旺旺
 * @Date: 2020/1/3 19:48
 * @Description:
 */
@WebServlet("/category/*")
public class CategoryServlet extends HttpServlet {

    private CategoryService categoryService = new CategoryServiceImpl();

    /**
    * @Author:  李旺旺
    * @Date:    2020/1/3 19:49
    * @param:   [request, response]
    * @Return:  void
    * @Exception:
    * @Description: 查询所有班级
    */
    public void findAll(HttpServletRequest request, HttpServletResponse response) throws ServerCloneException , IOException {
        //1.调用service获取所有分类
        List<String> list = categoryService.findAll();
        System.out.println("CategoryServlet的findAll方法结果："+list);
        //2.直接将传入的对象序列化为Json，并且写回客户端
    }

}
