<%@ page import="domain.highSchool" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="domain.entranceExaminationGrade" %><%--
  Created by IntelliJ IDEA.
  User:  穆正阳
  Date: 2020/1/2
  Time: 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>学校信息展示</title>
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
            <h1>学校信息</h1>
        </div>
        <div id="neirong_2">
            <%highSchool h = new highSchool();
            h = (highSchool)session.getAttribute("schoolInformation");%>
            <%--信息获取--%>
            <%ArrayList<Float> list = new ArrayList<Float>();
                list = (ArrayList<Float>)session.getAttribute("zhuzhuangtu");%>

            <br>
            <h2><%=h.getSchoolName()%></h2><br>
            <a href="<%=h.getWebsite()%>"><%=h.getSchoolName()%>官方网站</a>
            <br>
            <hr>
            <ul id="myTab" class="nav nav-tabs">
                <li class="active">
                    <a href="#home" data-toggle="tab">学校简介</a>
                </li>
                <li><a href="#xiangqing" data-toggle="tab">学校详情</a></li>
                <li><a href="#fenshu" data-toggle="tab">近年分数线</a></li>
            </ul>
            <div id="myTabContent" class="tab-content">
                <div class="tab-pane fade in active" id="home">
                    <h3><%=h.getIntro()%></h3>
                </div>
                <div class="tab-pane fade" id="xiangqing">
                    <%--这里展示 地址 区域 手机 网站--%>
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">地址</label>
                            <div class="col-sm-10">
                                <p class="form-control-static"><%=h.getAddress()%></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">区域</label>
                            <div class="col-sm-10">
                                <p class="form-control-static"><%=h.getArea()%></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">手机</label>
                            <div class="col-sm-10">
                                <p class="form-control-static"><%=h.getPhone()%></p>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="tab-pane fade in active" id="fenshu">
                    <%ArrayList<entranceExaminationGrade> eeg = new ArrayList<entranceExaminationGrade>();
                        eeg = (ArrayList<entranceExaminationGrade>)session.getAttribute("zhuzhuangtu");%>
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <td><h3>年份</h3></td>
                            <td><h3>划线分数</h3></td>
                            <td><h3>报名地区</h3></td>
                        </tr>
                        </thead>
                        <tbody>
                        <%!int i = 0;%>
                        <%for (i = 0;i < eeg.size();i++){%>
                        <tr>
                            <td><h4><%=eeg.get(i).getYear()%></h4></td>
                            <td><h4><%=eeg.get(i).getGrade()%></h4></td>
                            <td><h4><%=eeg.get(i).getArea()%></h4></td>
                        </tr>
                        <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
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
            <div class="modal-content" >
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
