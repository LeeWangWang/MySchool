<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2020/1/5
  Time: 10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>信息展示</title>
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
            width: 1150px;
            min-height: 800px;
        }
        #touming {
            min-height: 1000px;
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
<body id="body">
<div id="touming">
    <div style="padding-top: 10px">
        <h1>查看详情</h1>
    </div>
    <div id="neirong_2">
        <%String title = (String)session.getAttribute("title");
            String content = (String)session.getAttribute("content");
            String time = (String) session.getAttribute("time");%>
        <%--信息获取--%>

        <form action="/changePolicyServlet" method="post">
            <div class="tab-pane fade in active" id="home">
                <div class="input-group">
                    <br>
                    <span style="float: left; height: 34px; width: 50px; line-height: 34px;margin-left: 320px">
                            标题
                        </span>
                    <input type="text" class="form-control" name="title_change" placeholder="<%=title%>" value="<%=title%>" aria-describedby="basic-addon1"
                           style="width:400px;resize:none; height: 34px; float: left;" readonly >
                    <hr>
                    <span style="float: left; height: 34px; width: 50px; line-height: 34px;margin-left: 50px">
                            内容
                        </span>
                    <textarea type="text" class="form-control" name="content_change" value="<%=content%>" aria-describedby="basic-addon1"
                              readonly="readonly" style="width:900px;resize:none; height: 650px; float: left;"><%=content%></textarea>
                    <br>
                    <div style="margin-left: 820px">
                        <a href="/highSchoolView.jsp"><input type="button" value="关闭"></a>
                    </div>
                </div>
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
</html>
