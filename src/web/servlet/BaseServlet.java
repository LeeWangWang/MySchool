package web.servlet;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * @Author 24585
 * @Date: 2019/12/30 16:13
 * @Description: 父类Servlet，提供别人继承
 */
public class BaseServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //System.out.println("BaseServlet的service方法被执行了");
        //1.获取请求路径
        String requestURI = req.getRequestURI();
        //System.out.println("请求URI： " + requestURI);
        //2.获取方法名称
        String methodName = requestURI.substring(requestURI.lastIndexOf('/') + 1);
        //System.out.println("方法名称：" + methodName);
        //3.获取方法对象的method，谁调用我？我代表谁
        try {
            //4.获取执行方法
            Method method = this.getClass().getMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
            //暴力反射
            method.invoke(this, req, resp);
        }catch (NoSuchMethodException e){
            //e.printStackTrace();
        }catch (IllegalAccessException e){
            //e.printStackTrace();
        }catch (InvocationTargetException e){
            //e.printStackTrace();
        }
    }

    /**
    * @Author:  李旺旺
    * @Date:    2019/12/30 17:05
    * @param:   [object, response]
    * @Return:  void
    * @Exception:
    * @Description: 直接将传入的对象序列化为Json，并且写回客户端
    */
    public void writeValue(Object object, HttpServletResponse response) throws IOException{
        ObjectMapper mapper = new ObjectMapper();
        response.setContentType("application/json;charset=utf-8");
        mapper.writeValue(response.getOutputStream(), object);
    }

    /**
    * @Author:  李旺旺
    * @Date:    2019/12/30 17:06
    * @param:   [object]
    * @Return:  java.lang.String
    * @Exception:
    * @Description: 将传入的对象序列化为Json，并且返回给调用者
    */
    public String writeValueAsString(Object object) throws JsonProcessingException{
        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(object);
    }

    /**
    * @Author:  李旺旺
    * @Date:    2019/12/30 17:14
    * @param:   [object, response]
    * @Return:  void
    * @Exception:
    * @Description:
    */
    public void getWriterWrite(Object object, HttpServletResponse response) throws IOException {
        //将info对象序列化为json
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(object);
        response.setContentType("application/json;charset=utf-8");
        //将json数据写回客户端
        response.getWriter().write(json);
    }

}
