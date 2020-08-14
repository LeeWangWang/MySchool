package web.servlet;

import domain.CousesVideo;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import service.CousesVideoService;
import service.impl.CousesVideoServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.ArrayList;
import java.util.List;


@WebServlet("/videoServlet")
public class VideoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(!ServletFileUpload.isMultipartContent(request)){
            throw new RuntimeException("当前文件请求不支持上传");
        }
        try {
            //创建一个FileItem工厂
            DiskFileItemFactory factory = new DiskFileItemFactory();

            //设置使用临时文件的边界值
            factory.setSizeThreshold(1024*1024*50);
           /* //设置临时文件
            String tempPath = this.getServletContext().getRealPath("/temp");
            File temp = new File(tempPath);
            factory.setRepository(temp);*/
            //创建文件长传核心组件
            ServletFileUpload upload = new ServletFileUpload(factory);
             //防止文件中文名乱码
            upload.setHeaderEncoding("utf-8");
            //解析请求
            List<FileItem> items = upload.parseRequest(request);
            List<String> msg = new ArrayList<>();
            for (FileItem item : items) {
                if (item.isFormField()){//判断item为普通表单项
                    String fieldName = item.getFieldName();//获取表单项名称
                    String fieldValue = item.getString("utf-8");//获取表单项值
                    msg.add(fieldValue);
                    System.out.println(fieldName+"="+fieldValue);
                }else{//若item为文件表单项
                    String fileName = item.getName();//获取上传文件原始名称
                    fileName = System.currentTimeMillis()+fileName;//加时间戳，防止文件同名被覆盖。
                    //获取输入流，其中有上传文件的内容
                    InputStream is = item.getInputStream();
                    //获取文件保存在服务器的路径
                    String path = this.getServletContext().getRealPath("/vedio");
                    //创建目标文件，将来用于保存上传文件
                    File descFile = new File(path,fileName);
                    //创建文件输出流
                    OutputStream os = new FileOutputStream(descFile);
                    int len = -1;
                    byte[] buf = new byte[1024];
                    while((len = is.read(buf)) != -1 ){
                        os.write(buf,0,len);
                    }
                    String fullPath = "http://localhost:8080/vedio/"+fileName;
                    msg.add(fullPath);
                    os.close();
                    is.close();
                    item.delete();
                }
            }
            System.out.println(msg.get(0));
            System.out.println(msg.get(1));
            System.out.println(msg.get(2));
            System.out.println(msg.get(3));
            System.out.println(msg.get(4));
            System.out.println("-------------------------------");
            CousesVideo cousesVideo = new CousesVideo(msg.get(0),msg.get(4),msg.get(3),msg.get(1),msg.get(2));
            CousesVideoService service = new CousesVideoServiceImpl();
            Boolean addResult = service.addVideo(cousesVideo);
            System.out.println(cousesVideo);
            if (addResult == true){
                request.getSession().setAttribute("cousesVideo",cousesVideo);
                response.sendRedirect(request.getContextPath()+"/findVideoByPageServlet");

            }else {
                request.getSession().setAttribute("signUp_msg","报名失败");
                request.getRequestDispatcher("/index.jsp").forward(request,response);
            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);

    }
}
