<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2020/1/6
  Time: 16:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>修改学校信息</title>
    <%
        if (null == session.getAttribute("admin")){
            response.sendRedirect(request.getContextPath() + "/adminLogin.jsp");
        }
    %>
    <style>
        @import url(css/highSchoolInfo.css);  <!--该界面的div的布局-->
        #body{
            /*加载背景图*/
            background-image: url(image/img5.jpg);
            /* 背景图垂直、水平均居中 */
            background-position: center center;
            /* 背景图不平铺 */
            background-repeat: no-repeat;
            /* 当内容高度大于图片高度时，背景图像的位置相对于viewport固定 */
            background-attachment: fixed;
            /* 让背景图基于容器大小伸缩 */
            background-size: cover;
            /* 设置背景颜色，背景图加载过程中会显示背景色 */
            background-color: #CCCCCC;
        }
        #body{
            /*加载背景图*/
            background-image: url(image/img5.jpg);
            /* 背景图垂直、水平均居中 */
            background-position: center center;
            /* 背景图不平铺 */
            background-repeat: no-repeat;
            /* 当内容高度大于图片高度时，背景图像的位置相对于viewport固定 */
            background-attachment: fixed;
            /* 让背景图基于容器大小伸缩 */
            background-size: cover;
            /* 设置背景颜色，背景图加载过程中会显示背景色 */
            background-color: #CCCCCC;
        }
        #neirong_2{
            width: 600px;
            min-height: 800px;
        }
        #touming {
            margin-top: 30px;
            height: 900px;
            padding-top: 0px;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <!--下面是框架的导入 选取的开发版-->
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/echarts/4.2.1-rc1/echarts.min.js"></script>

</head>
<body>
<body id="body">
<div id="touming">
    <div style="padding-top: 10px">
        <h1>修改学校信息</h1>
    </div>
    <div id="neirong_2">
        <%String name = (String)session.getAttribute("name_2");
            String website = (String)session.getAttribute("website_2");
            String intro = (String) session.getAttribute("intro_2");
            String address = (String) session.getAttribute("address_2");
            String area = (String) session.getAttribute("area_2");
            String phone = (String) session.getAttribute("phone_2");%>
        <%--信息获取--%>

        <form action="/changeSchoolServlet" method="post">
            <div class="form-group">
                <label for="mingzi">学校名字</label>
                <input type="text" name="mingzi" class="form-control" id="mingzi" value="<%if (name==null){%>null<%}else{%><%=name%><%}%>" placeholder="Email">
            </div>
            <div class="form-group">
                <label for="wangzhan">学校网站</label>
                <input type="text" value="<%if (website==null){%>null<%}else{%><%=website%><%}%>" name="wangzhan" class="form-control" id="wangzhan" value="<%=website%>" placeholder="Email">
            </div>
            <div class="form-group">
                <label for="lianxi">联系方式</label>
                <input type="text" value="<%if (address==null){%>null<%}else{%><%=address%><%}%>"
                 class="form-control" name="lianxi" id="lianxi" placeholder="Email">
            </div>
            <div class="form-group">
                <label for="lianxi">地区</label>
                <input type="text" value="<%if (area==null){%>null<%}else{%><%=area%><%}%>" class="form-control" name="diqu" id="diqu"  placeholder="Email">
            </div>
            <div class="form-group">
                <label for="lianxi">手机</label>
                <input type="text" value="<%if (phone==null){%>null<%}else{%><%=phone%><%}%>" class="form-control" name="shouji" id="shouji"  placeholder="Email">
            </div>
            <label for="lianxi">简介</label>
            <textarea type="text" class="form-control" name="jianjie" aria-describedby="basic-addon1"
                      style="width:600px;resize:none; height: 300px; float: left;" value="<%if (intro==null){%>null<%}else{%><%=intro%><%}%>"><%if (intro==null){%>null<%}else{%><%=intro%><%}%></textarea>
            <br>
            <div class="form-group">
                <input type="submit" value="修改">
            </div>
            <a href="/adminAllFindSchoolServlet"><input type="button" value="关闭"></a>
            <div style="margin-left: 820px">

            </div>

        </form>
        <script>
            $(function () {
                $('#myTab li:eq(1) a').tab('show');
            });
        </script>
    </div>
</div>

<%--芝罘区--%>
<div class="modal fade" id="zhifu_Tan" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
    <div class="modal-dialog" role="document" style="z-index: 111111">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Modal title</h4>
            </div>
            <div class="modal-body">
                <div id="zhifuqu" style="width: 600px;height:400px;"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>
</body>
</body>
</html>
