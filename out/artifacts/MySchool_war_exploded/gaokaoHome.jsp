<%--
  Created by IntelliJ IDEA.
  User: 17712
  Date: 2019/12/30
  Time: 14:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>高考之家</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <!-- load css -->
    <link rel="stylesheet" type="text/css" href="common/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="common/global.css" media="all">
    <link rel="stylesheet" type="text/css" href="css/adminstyle.css" media="all">


</head>
<body>
<div class="layui-layout layui-layout-admin" id="layui_layout">
    <!-- 顶部区域 -->
    <div class="layui-header header header-demo">
        <div class="layui-main">
            <!-- logo区域 -->
            <div class="admin-logo-box">
                <a class="logo" href="${pageContext.request.contextPath}/collegeServlet?&funcName=findAllCollegePage" title="logo">高考之家</a>
                <div class="larry-side-menu">
                    <i class="fa fa-bars" aria-hidden="true"></i>
                </div>
            </div>
            <!-- 顶级菜单区域 -->
            <div class="layui-larry-menu">
                <ul class="layui-nav clearfix">
                    <li class="layui-nav-item layui-this">
                        <a href="javascirpt:;">学校信息</a>
                    </li>
                    <li class="layui-nav-item">
                        <a href="javascirpt:;">报考指导</a>
                    </li>
                </ul>
            </div>
            <!-- 右侧导航 -->
            <ul class="layui-nav larry-header-item">
                <li class="layui-nav-item">
                    <%--${requestScope.user.name}--%>
                    用户名
                </li>
            </ul>
        </div>
    </div>
    <!-- 左侧侧边导航开始 -->
    <div class="layui-side layui-side-bg layui-larry-side" id="larry-side">
        <div class="layui-side-scroll" id="larry-nav-side" lay-filter="side">

            <!-- 分类 -->
            <ul class="layui-nav layui-nav-tree">
                <li class="layui-nav-item layui-this">
                    <a href="javascript:;" data-url="${pageContext.request.contextPath}/collegeServlet?&funcName=findAllCollegePage">
                        <i class="iconfont icon-home1" data-icon='icon-home1'></i>
                        <span>所有大学</span>
                    </a>
                </li>
                <!-- 地区 -->
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <i class="iconfont icon-jiaoseguanli" ></i>
                        <span>地区</span>
                        <em class="layui-nav-more"></em>
                    </a>
                    <dl class="layui-nav-child">
                        <c:forEach items="${requestScope.locations}" var="location" varStatus="s">
                            <dd>
                                <a href="javascript:;" data-url="${pageContext.request.contextPath}/collegeServlet?keys=collegeLocation&valuess=${location}&funcName=findAllCollegePage&collegeLocation=${location}">
                                    <i class="iconfont icon-geren1" data-icon='icon-geren1'></i>
                                    <span>${location}</span>
                                </a>
                            </dd>
                        </c:forEach>
                    </dl>
                </li>
                <!-- 普通本科/高职专科 -->
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <i class="iconfont icon-jiaoseguanli2" ></i>
                        <span>普通本科/高职专科</span>
                        <em class="layui-nav-more"></em>
                    </a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;" data-url="${pageContext.request.contextPath}/collegeServlet?keys=collegeMainType&valuess=普通本科&funcName=findAllCollegePage&collegeMainType=普通本科">
                                <i class="iconfont icon-yonghu1" data-icon='icon-yonghu1'></i>
                                <span>普通本科</span>
                            </a>
                        </dd>
                        <dd>
                            <a href="javascript:;"  data-url="${pageContext.request.contextPath}/collegeServlet?keys=collegeMainType&valuess=高职专科&funcName=findAllCollegePage&collegeMainType=高职专科">
                                <i class="iconfont icon-jiaoseguanli4" data-icon='icon-jiaoseguanli4'></i>
                                <span>高职专科</span>
                            </a>
                        </dd>
                    </dl>
                </li>
                <!-- 大学头衔 -->
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <i class="iconfont icon-wenzhang1" ></i>
                        <span>学校头衔</span>
                        <em class="layui-nav-more"></em>
                    </a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;" data-url="${pageContext.request.contextPath}/collegeServlet?keys=collegeIsDoubleTop&valuess=Y&funcName=findAllCollegePage&collegeIsDoubleTop=Y">
                                <i class="iconfont icon-lanmuguanli" data-icon='icon-lanmuguanli'></i>
                                <span>双一流</span>
                            </a>
                        </dd>
                        <dd>
                            <a href="javascript:;" data-url="${pageContext.request.contextPath}/collegeServlet?keys=collegeIs985&valuess=Y&funcName=findAllCollegePage&collegeIs985=Y">
                                <i class="iconfont icon-wenzhang2" data-icon='icon-wenzhang2'></i>
                                <span>985</span>
                            </a>
                        </dd>
                        <dd>
                            <a href="javascript:;" data-url="${pageContext.request.contextPath}/collegeServlet?keys=collegeIs211&valuess=Y&funcName=findAllCollegePage&collegeIs211=Y">
                                <i class="iconfont icon-wenzhang2" data-icon='icon-wenzhang2'></i>
                                <span>211</span>
                            </a>
                        </dd>
                        <dd>
                            <a href="javascript:;" data-url="${pageContext.request.contextPath}/collegeServlet?keys=collegeIsNormal&valuess=Y&funcName=findAllCollegePage&collegeIs211=N&collegeIs985=N&collegeIsDoubleTop=N">
                                <i class="iconfont icon-wenzhang2" data-icon='icon-wenzhang2'></i>
                                <span>普通双非</span>
                            </a>
                        </dd>
                    </dl>
                </li>

                <!-- 地区 -->
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <i class="iconfont icon-jiaoseguanli" ></i>
                        <span>学校类型</span>
                        <em class="layui-nav-more"></em>
                    </a>
                    <dl class="layui-nav-child">
                        <c:forEach items="${requestScope.mainTypes}" var="mainType" varStatus="s">
                            <dd>
                                <a href="javascript:;" data-url="${pageContext.request.contextPath}/collegeServlet?keys=collegeStudyType&valuess=${mainType}&funcName=findAllCollegePage&collegeStudyType=${mainType}">
                                    <i class="iconfont icon-geren1" data-icon='icon-geren1'></i>
                                    <span>${mainType}</span>
                                </a>
                            </dd>
                        </c:forEach>
                    </dl>
                </li>
                <!-- 管理员 -->
                <%--<li class="layui-nav-item">--%>
                    <%--<a href="javascript:;">--%>
                        <%--<i class="iconfont icon-jiaoseguanli" ></i>--%>
                        <%--<span>管理员</span>--%>
                        <%--<em class="layui-nav-more"></em>--%>
                    <%--</a>--%>
                    <%--<dl class="layui-nav-child">--%>
                        <%--<dd>--%>
                            <%--<a href="javascript:;" data-url="${pageContext.request.contextPath}/collegeServlet?funcName=dealCollege">--%>
                                <%--<i class="iconfont icon-geren1" data-icon='icon-geren1'></i>--%>
                                <%--<span>大学列表</span>--%>
                            <%--</a>--%>
                        <%--</dd>--%>
                    <%--</dl>--%>
                <%--</li>--%>
            </ul>
        </div>
    </div>

    <!-- 左侧侧边导航结束 -->
    <!-- 右侧主体内容 -->
    <div class="layui-body" id="larry-body" style="bottom: 0;border-left: solid 2px #2299ee;">
        <div class="layui-tab layui-tab-card larry-tab-box" id="larry-tab" lay-filter="demo" lay-allowclose="true">
            <div class="go-left key-press pressKey" id="titleLeft" title="滚动至最右侧"><i class="larry-icon larry-weibiaoti6-copy"></i> </div>
            <ul class="layui-tab-title">
                <li class="layui-this" id="gaokao-home"><i class="iconfont icon-diannao1"></i><em>高考指导首页</em></li>
            </ul>
            <div class="go-right key-press pressKey" id="titleRight" title="滚动至最左侧"><i class="larry-icon larry-right"></i></div>

            <div class="layui-tab-content" style="min-height: 1000px; margin: 20px">
                <div class="layui-tab-item layui-show">
                    <iframe class="larry-iframe" data-id='0' src="${pageContext.request.contextPath}/collegeServlet?funcName=findAllCollegePage"></iframe>
                </div>
            </div>
        </div>
    </div>
    <!-- 底部区域 -->
    <div class="layui-footer layui-larry-foot" id="larry-footer">
        <div class="layui-mian">
            <p class="p-admin">
                <span>2020 &copy;</span>
                软件工程2017211842周天乐
            </p>
        </div>
    </div>
</div>
<!-- 加载js文件-->
<script type="text/javascript" src="common/layui/layui.js"></script>
<script type="text/javascript" src="js/larry.js"></script>
<script type="text/javascript" src="js/index.js"></script>


</body>
