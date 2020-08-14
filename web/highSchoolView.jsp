<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="domain.highSchool" %>
<%@ page import="domain.examPolicy" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User:  穆正阳
  Date: 2019/12/30
  Time: 12:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<%--    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->--%>
    <title>中考</title>
    <style>
        @import url(css/leftMenu.css);     <!--左侧悬浮框-->
    </style>
<%--    <!-- Bootstrap -->--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

<%--    <! -- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->--%>
<%--    <! -- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->--%>
<%--    <! --[if lt IE 9]>--%>
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
<%--    <! --下面是框架的导入 选取的开发版-->--%>
<%--    <! -- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->--%>
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<%--    <! -- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->--%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>

    <script type="text/javascript">

    </script>
</head>
<body data-spy="scroll" data-target="#myScrollspy" style="background-repeat:no-repeat;
      background-size:cover;background-color: #F8F8FF;" id="body">
<!--对于框架的搭建-->
<!--1.这里是上面的导航栏-->
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="#">学习强国</a>    <!--这里合并的时候和首页绑定-->
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="#section-2">地区</a></li>
                <li><a href="#section-3">中考资讯</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="container">
    <div class="jumbotron" id="top_div">
        <h2>学习强国中考资源站</h2>
    </div>
    <div class="row">
        <div class="col-xs-3" id="myScrollspy">
            <ul class="nav nav-tabs nav-stacked" data-spy="affix" data-offset-top="125">
                <li class="active"><a href="#section-1">让孩子赢在起跑线上！</a></li>
                <li class="active"><a href="#section-2">地区</a></li>
                <li class="active"><a href="#section-3">中考资讯</a></li>
                <%--<li class="active"><a href="#section-4">政策</a></li>--%>
            </ul>
        </div>
        <div class="col-xs-9">
            <div id="section-1">
                <p><img src="image/img4.png">
                    <div style="text-align:center">
                        <h3 style="text-align:center">不怕同学是学霸，就怕同学过暑假。</h3><br>
                        <h3 style="text-align:center">强国辅导开课了！用两个月让孩子赢在高中的起跑线上！</h3><br>
                        <div style="text-align:center">
                            <h2><del style="text-align:center">2999</del>?只要</h2>
                            <h1 style="color:red">1909!</h1>
                        </div>
                    </div>
                </p>
            </div>
            <!--下面是对地区高中的展示-->
            <form action="/highSchoolServlet">
                <div id="section-2">
                    <h1>地区</h1>
                        <ul class="nav nav-pills" role="tablist">
                        <li role="presentation" class="active"><a href="#zhifu" role="tab" data-toggle="tab">芝罘区</a></li>
                        <li role="presentation"><a href="#gaoxin" role="tab" data-toggle="tab">高新区</a></li>
                        <li role="presentation"><a href="#laishan" role="tab" data-toggle="tab">莱山区</a></li>
                        <li role="presentation"><a href="#mouping" role="tab" data-toggle="tab">牟平区</a></li>
                        <li role="presentation"><a href="#longkou" role="tab" data-toggle="tab">龙口市</a></li>
                        <li role="presentation"><a href="#changdao" role="tab" data-toggle="tab">长岛县</a></li>
                        <li role="presentation"><a href="#haiyang" role="tab" data-toggle="tab">海阳市</a></li>
                        <li role="presentation"><a href="#laiyang" role="tab" data-toggle="tab">莱阳市</a></li>
                        <li role="presentation"><a href="#zhaoyuan" role="tab" data-toggle="tab">招远市</a></li>
                        <li role="presentation"><a href="#fushan" role="tab" data-toggle="tab">福山区</a></li>
                        <li role="presentation"><a href="#penglai" role="tab" data-toggle="tab">蓬莱区</a></li>
                        <li role="presentation"><a href="#kaifa" role="tab" data-toggle="tab">开发区</a></li>
                        <li role="presentation"><a href="#laizhou" role="tab" data-toggle="tab">莱州市</a></li>
                    </ul>

                    <!-- 面板区  这里对数据进行展示并跳转   -->
                    <div class="tab-content">
                        <%!int i = 0;%>
                        <%ArrayList<highSchool> list_School = new ArrayList<highSchool>();
                            list_School = (ArrayList<highSchool>)session.getAttribute("schoolName_area");%>
                        <div role="tabpanel" class="tab-pane active" id="zhifu">
                            <%if (list_School == null || list_School.isEmpty()){%>

                            <%}else{
                            for (i = 0;i < list_School.size();i++){
                            if(list_School.get(i).getArea().equals("芝罘区")){%>
                            <a href="/skipSchoolInfoServlet?msg=<%=list_School.get(i).getSchoolName()%>" class="btn btn-default btn-lg active" role="button">
                                <%=list_School.get(i).getSchoolName()%>
                            </a>&nbsp&nbsp&nbsp
                            <%}}}%>
                        </div>
                        <div role="tabpane1" class="tab-pane" id="gaoxin">
                            <%if (list_School == null || list_School.isEmpty()){%>

                            <%}else{
                                for (i = 0;i < list_School.size();i++){
                                    if(list_School.get(i).getArea().equals("高新区")){%>
                            <a href="/skipSchoolInfoServlet?msg=<%=list_School.get(i).getSchoolName()%>" class="btn btn-default btn-lg active" role="button">
                                <%=list_School.get(i).getSchoolName()%>
                            </a>&nbsp&nbsp&nbsp
                            <%}}}%>
                        </div>
                            <div role="tabpane1" class="tab-pane" id="laishan">
                                <%if (list_School == null || list_School.isEmpty()){%>

                                <%}else{
                                    for (i = 0;i < list_School.size();i++){
                                        if(list_School.get(i).getArea().equals("莱山区")){%>
                                <a href="/skipSchoolInfoServlet?msg=<%=list_School.get(i).getSchoolName()%>" class="btn btn-default btn-lg active" role="button">
                                    <%=list_School.get(i).getSchoolName()%>
                                </a>&nbsp&nbsp&nbsp
                                <%}}}%>
                            </div>
                            <div role="tabpanel" class="tab-pane" id="mouping">
                                <%if (list_School == null || list_School.isEmpty()){%>

                                <%}else{
                                    for (i = 0;i < list_School.size();i++){
                                        if(list_School.get(i).getArea().equals("牟平区")){%>
                                <a href="/skipSchoolInfoServlet?msg=<%=list_School.get(i).getSchoolName()%>" class="btn btn-default btn-lg active" role="button">
                                    <%=list_School.get(i).getSchoolName()%>
                                </a>&nbsp&nbsp&nbsp
                                <%}}}%>
                            </div>
                            <div role="tabpanel" class="tab-pane" id="longkou">
                                <%if (list_School == null || list_School.isEmpty()){%>

                                <%}else{
                                    for (i = 0;i < list_School.size();i++){
                                        if(list_School.get(i).getArea().equals("龙口市")){%>
                                <a href="/skipSchoolInfoServlet?msg=<%=list_School.get(i).getSchoolName()%>" class="btn btn-default btn-lg active" role="button">
                                    <%=list_School.get(i).getSchoolName()%>
                                </a>&nbsp&nbsp&nbsp
                                <%}}}%>
                            </div>
                            <div role="tabpanel" class="tab-pane" id="changdao">
                                <%if (list_School == null || list_School.isEmpty()){%>

                                <%}else{
                                    for (i = 0;i < list_School.size();i++){
                                        if(list_School.get(i).getArea().equals("长岛县")){%>
                                <a href="/skipSchoolInfoServlet?msg=<%=list_School.get(i).getSchoolName()%>" class="btn btn-default btn-lg active" role="button">
                                    <%=list_School.get(i).getSchoolName()%>
                                </a>&nbsp&nbsp&nbsp
                                <%}}}%>
                            </div>
                            <div role="tabpanel" class="tab-pane" id="haiyang">
                                <%if (list_School == null || list_School.isEmpty()){%>

                                <%}else{
                                    for (i = 0;i < list_School.size();i++){
                                        if(list_School.get(i).getArea().equals("海阳市")){%>
                                <a href="/skipSchoolInfoServlet?msg=<%=list_School.get(i).getSchoolName()%>" class="btn btn-default btn-lg active" role="button">
                                    <%=list_School.get(i).getSchoolName()%>
                                </a>&nbsp&nbsp&nbsp
                                <%}}}%>
                            </div>
                            <div role="tabpanel" class="tab-pane" id="laiyang">
                                <%if (list_School == null || list_School.isEmpty()){%>

                                <%}else{
                                    for (i = 0;i < list_School.size();i++){
                                        if(list_School.get(i).getArea().equals("莱阳市")){%>
                                <a href="/skipSchoolInfoServlet?msg=<%=list_School.get(i).getSchoolName()%>" class="btn btn-default btn-lg active" role="button">
                                    <%=list_School.get(i).getSchoolName()%>
                                </a>&nbsp&nbsp&nbsp
                                <%}}}%>
                            </div>
                            <div role="tabpanel" class="tab-pane" id="zhaoyuan">
                                <%if (list_School == null || list_School.isEmpty()){%>

                                <%}else{
                                    for (i = 0;i < list_School.size();i++){
                                        if(list_School.get(i).getArea().equals("招远市")){%>
                                <a href="/skipSchoolInfoServlet?msg=<%=list_School.get(i).getSchoolName()%>" class="btn btn-default btn-lg active" role="button">
                                    <%=list_School.get(i).getSchoolName()%>
                                </a>&nbsp&nbsp&nbsp
                                <%}}}%>
                            </div>
                            <div role="tabpanel" class="tab-pane" id="fushan">
                                <%if (list_School == null || list_School.isEmpty()){%>

                                <%}else{
                                    for (i = 0;i < list_School.size();i++){
                                        if(list_School.get(i).getArea().equals("福山区")){%>
                                <a href="/skipSchoolInfoServlet?msg=<%=list_School.get(i).getSchoolName()%>" class="btn btn-default btn-lg active" role="button">
                                    <%=list_School.get(i).getSchoolName()%>
                                </a>&nbsp&nbsp&nbsp
                                <%}}}%>
                            </div>
                            <div role="tabpanel" class="tab-pane" id="penglai">
                                <%if (list_School == null || list_School.isEmpty()){%>

                                <%}else{
                                    for (i = 0;i < list_School.size();i++){
                                        if(list_School.get(i).getArea().equals("蓬莱区")){%>
                                <a href="/skipSchoolInfoServlet?msg=<%=list_School.get(i).getSchoolName()%>" class="btn btn-default btn-lg active" role="button">
                                    <%=list_School.get(i).getSchoolName()%>
                                </a>&nbsp&nbsp&nbsp
                                <%}}}%>
                            </div>
                            <div role="tabpanel" class="tab-pane" id="kaifa">
                                <%if (list_School == null || list_School.isEmpty()){%>

                                <%}else{
                                    for (i = 0;i < list_School.size();i++){
                                        if(list_School.get(i).getArea().equals("开发区")){%>
                                <a href="/skipSchoolInfoServlet?msg=<%=list_School.get(i).getSchoolName()%>" class="btn btn-default btn-lg active" role="button">
                                    <%=list_School.get(i).getSchoolName()%>
                                </a>&nbsp&nbsp&nbsp
                                <%}}}%>
                            </div>
                            <div role="tabpanel" class="tab-pane" id="laizhou">
                                <%if (list_School == null || list_School.isEmpty()){%>

                                <%}else{
                                    for (i = 0;i < list_School.size();i++){
                                        if(list_School.get(i).getArea().equals("莱州市")){%>
                                <a href="/skipSchoolInfoServlet?msg=<%=list_School.get(i).getSchoolName()%>" class="btn btn-default btn-lg active" role="button">
                                    <%=list_School.get(i).getSchoolName()%>
                                </a>&nbsp&nbsp&nbsp
                                <%}}}%>
                            </div>
                        <br><br><br>
                    </div>
                    <hr style="height: 2px;">
                    <div id="section-3">
                        <h1>中考资讯</h1>
                        <%!int ye = 0;%>
                        <%ArrayList<examPolicy> eaList = new ArrayList<examPolicy>();
                            eaList = (ArrayList<examPolicy>)session.getAttribute("AllpolicyInfo");%>
                        <%SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");%>
                        <%for(i = ye*3;i < eaList.size();i++){%>
                            <div>
                                <h3><a href="/skipPolicyInfoServlet?title=<%=eaList.get(i).getTitle()%>&time=<%=sdf.format(eaList.get(i).getTime())%>&content=<%=eaList.get(i).getContent()%>">
                                        <%=eaList.get(i).getTitle()%>
                                    </a>
                                </h3>
                                <h4>
                                    <%=eaList.get(i).getContent().substring(0,100)%>
                                </h4>
                                <h5>
                                    发布日期:<%=eaList.get(i).getTime()%>
                                </h5>
                                <hr style="width:85%;">
                            </div>
                        <%}%>
                    </div>
                    <div id="section-4">
                        <h1>政策</h1>
                        <p>Suspendisse a orci facilisis, dignissim tortor vitae, ultrices mi. Vestibulum <br><br><br><br>
                            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br></p>
                    </div>
            </div>
        </form>
        </div>
    </div>
</div>

</body>
</html>
