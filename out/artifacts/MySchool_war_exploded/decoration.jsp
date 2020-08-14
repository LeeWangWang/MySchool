<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/1/5
  Time: 14:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  import="java.util.*"%>
<%@ page import="dao.impl.teacherDao" %>
<%@ page import="domain.Teacher" %>
<html>
<head lang="en">
    <meta charset="utf-8"/>
    <title>学习强国</title>
    <link rel="stylesheet" type="text/css" href="css/public.css"/>
    <link rel="stylesheet" type="text/css" href="css/proList.css"/>
</head>
<body><!------------------------------head------------------------------>
<div class="head">
    <div class="wrapper clearfix">
        <div class="clearfix" id="top"><h1 class="fl"><a href="index.html"><!--<img src="img/logo.png"/>--></a></h1>
            <div class="fr clearfix" id="top1"><p class="fl"><a href="login.html" id="login">登录</a><a href="reg.html"
                                                                                                      id="reg">注册</a>
            </p>
                <form action="#" method="get" class="fl"><input type="text" placeholder="搜索"/><input type="button"/>
                </form>
                <div class="btn fl clearfix"><a href="mygxin.html"><img src="img/grzx.png"/></a><a href="#" class="er1"><img
                        src="img/ewm.png"/></a><a href="cart.html"><!--<img src="img/gwc.png"/>--></a>
                    <p><a href="#"><img src="img/smewm.png"/></a></p></div>
            </div>
        </div>
        <ul class="clearfix" id="bott">
            <li><a href="index.jsp">首页</a>


            </li>
            <li><a href="decoration.jsp">名师介绍</a>
                <div class="sList">
                    <div class="wrapper  clearfix"><a href="decoration.html">
                        <dl>
                            <dt><img src="img/nav1.jpg"/></dt>
                            <dd>张老师</dd>
                        </dl>
                    </a><a href="decoration.html">
                        <dl>
                            <dt><img src="img/nav2.jpg"/></dt>
                            <dd>刘老师</dd>
                        </dl>
                    </a><a href="decoration.html">
                        <dl>
                            <dt><img src="img/nav3.jpg"/></dt>
                            <dd>李老师</dd>
                        </dl>
                    </a><a href="decoration.html">
                        <dl>
                            <dt><img src="img/nav6.jpg"/></dt>
                            <dd>周老师</dd>
                        </dl>
                    </a><a href="decoration.html">
                        <dl>
                            <dt><img src="img/nav7.jpg"/></dt>
                            <dd>穆老师</dd>
                        </dl>
                    </a></div>
                </div>
            </li>
            <li><a href="#courses">课程体系</a>
                <!--
                <div class="sList2">
                    <div class="clearfix"><a href="proList.html">干花花艺</a><a href="vase_proList.html">花瓶花器</a></div>
                </div>
                -->
                <!--
                <div class="title" id="history">History</div>

                <div class="history">
                </div>
                -->
            </li>
            <li><a href="paint.html">中高考咨询</a>
                <div class="sList2">
                    <div class="clearfix"><a href="zbproList.html">中考</a><a href="bzproList.html">高考</a></div>
                </div>
            </li>
            <li><a href="paint.html">课程报名</a></li>
            <li><a href="perfume.html">网上课堂</a></li>
            <li><a href="#">就业前景</a></li>
        </ul>
    </div>
</div><!------------------------------banner------------------------------>
<div class="banner"><a href="#"><img src="img/temp/bzbig.jpg"/></a></div>
<!-----------------address------------------------------->
<div class="address">
    <div class="wrapper clearfix"><a href="index.html">首页</a><span>/</span><a href="decoration.html" class="on">名师介绍</a>
    </div>
</div><!-------------------current---------------------->
<div class="current">
    <div class="wrapper clearfix"><h3 class="fl">名师介绍</h3>
        <div class="fr choice"><p class="default">师资库</p>
            <ul class="select">
                <li>软件测试</li>
                <li>Linux云计算+运维开发</li>
                <li>智能机器人软件开发</li>
                <li>新媒体+短视频运营</li>
                <li>前端与移动开发</li>
            </ul>
        </div>
    </div>
</div><!----------------proList------------------------->
<ul class="proList wrapper clearfix">
    <%
        teacherDao teaDao = new teacherDao();
        ArrayList<Teacher> list = teaDao.getAllteacher();
        for(int i=0; i<list.size();i++)
        {
    %>

    <!--名师循环开始-->
        <%
            Teacher tea =list.get(i);
        %>
    <li><a href="#">
        <dl>
            <dt><img src="<%=tea.getPhoto()%>"></dt>
            <dd><%=tea.getName()%></dd>
            <dd><%=tea.getIntroduce()%></dd>
        </dl>
    </a></li>

    <!--名师循环结束-->
    <%
        }
    %>


<script src="js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/public.js" type="text/javascript" charset="utf-8"></script>
<script src="js/nav.js" type="text/javascript" charset="utf-8"></script>
<script src="js/pro.js" type="text/javascript" charset="utf-8"></script>
<script src="js/cart.js" type="text/javascript" charset="utf-8"></script>
</body>
</html>