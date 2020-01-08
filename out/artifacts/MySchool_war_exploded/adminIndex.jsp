<%--
  Created by IntelliJ IDEA.
  User: 李旺旺
  DateTime: 2020/1/1 19:46
  Description: 
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>后台管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <!-- 加载 css样式 -->
    <link rel="stylesheet" type="text/css" href="common/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="common/global.css" media="all">
    <link rel="stylesheet" type="text/css" href="css/adminstyle.css" media="all">
    <%
        if (null == session.getAttribute("admin")){
            response.sendRedirect(request.getContextPath() + "/adminLogin.jsp");
        }
    %>
</head>
<body>
    <div class="layui-layout layui-layout-admin" id="layui_layout">
        <!-- 顶部区域 -->
        <div class="layui-header header header-demo">
            <div class="layui-main">
                <!-- logo区域 -->
                <div class="admin-logo-box">
                    <p id="index-logo" class="logo" title="logo">后台管理系统</p>
                    <div class="larry-side-menu">
                        <i class="fa fa-bars" aria-hidden="true"></i>
                    </div>
                </div>
                <!-- 右侧导航 -->
                <ul class="layui-nav larry-header-item">
                    <li class="layui-nav-item" id="admin-account">
                        管理员： ${admin.account}
                    </li>
                    <li class="layui-nav-item">
                        <a href="javascript:location.href='admin/exit';"><i class="iconfont icon-exit"></i>退出</a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 左侧侧边导航开始 -->
        <div class="layui-side layui-side-bg layui-larry-side" id="larry-side">
            <div class="layui-side-scroll" id="larry-nav-side" lay-filter="side">

                <!-- 左侧菜单 -->
                <ul class="layui-nav layui-nav-tree">
                    <li class="layui-nav-item layui-this">
                        <a href="javascript:;" data-url="adminMain.jsp">
                            <i class="iconfont icon-home1" data-icon='icon-home1'></i>
                            <span>后台首页</span>
                        </a>
                    </li>
                    <!-- 学校信息 -->
                    <li class="layui-nav-item">
                        <a href="javascript:;" data-url="tab_college.jsp">
                            <i class="iconfont icon-home"  data-icon='icon-xuexiaoxinxi'></i>
                            <span>学校信息</span>
                        </a>
                    </li>
                    <!-- 教师信息 -->
                    <li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="iconfont icon-jiaoseguanli"  data-icon='icon-jiaoseguanli'></i>
                            <span>教师信息</span>
                        </a>
                    </li>
                    <!-- 学生信息 -->
                    <li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="iconfont icon-jiaoseguanli" ></i>
                            <span>学生信息</span>
                            <em class="layui-nav-more"></em>
                        </a>
                        <dl class="layui-nav-child">
                            <div id="class-item">
                                <%--<dd>
                                    <a href="javascript:;" data-url="tab_students.jsp?class=计算机网络">
                                        <i class="iconfont icon-geren1" data-icon='icon-geren1'></i>
                                        <span>计算机网络</span>
                                    </a>
                                </dd>--%>
                            </div>
                        </dl>
                    </li>

                    <!-- 个人信息 -->
                    <li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="iconfont icon-jiaoseguanli" ></i>
                            <span>我的面板</span>
                            <em class="layui-nav-more"></em>
                        </a>
                        <dl class="layui-nav-child">
                            <dd>
                                <a href="javascript:;" data-url="personInfo.jsp">
                                    <i class="iconfont icon-geren1" data-icon='icon-geren1'></i>
                                    <span>个人信息</span>
                                </a>
                            </dd>
                            <dd>
                                <a href="javascript:;" data-url="personInfo.jsp">
                                    <i class="iconfont icon-sql" data-icon='icon-sql'></i>
                                    <span>个人</span>
                                </a>
                            </dd>
                            <dd>
                                <a href="javascript:;" data-url="changepwd.jsp">
                                    <i class="iconfont icon-iconfuzhi01" data-icon='icon-iconfuzhi01'></i>
                                    <span>修改密码</span>
                                </a>
                            </dd>
                            <dd>
                                <a href="javascript:;" data-url="myloginfo.jsp">
                                    <i class="iconfont icon-piliangicon" data-icon='icon-piliangicon'></i>
                                    <span>日志信息</span>
                                </a>
                            </dd>
                        </dl>
                    </li>
                    <!-- 用户管理 -->
                    <li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="iconfont icon-jiaoseguanli2" ></i>
                            <span>表格表单</span>
                            <em class="layui-nav-more"></em>
                        </a>
                        <dl class="layui-nav-child">
                            <dd>
                                <a href="javascript:;" data-url="table.jsp">
                                    <i class="iconfont icon-yonghu1" data-icon='icon-yonghu1'></i>
                                    <span>有线条表格</span>
                                </a>
                            </dd>
                            <dd>
                                <a href="javascript:;"  data-url="table_1.jsp">
                                    <i class="iconfont icon-jiaoseguanli4" data-icon='icon-jiaoseguanli4'></i>
                                    <span>无线条输入增加内容框</span>
                                </a>
                            </dd>
                            <dd>
                                <a href="javascript:;" data-url="myloginfo.jsp">
                                    <i class="iconfont icon-quanxian2" data-icon='icon-quanxian2'></i>
                                    <span>无线条表格</span>
                                </a>
                            </dd>
                        </dl>
                    </li>
                    <!-- 内容管理 -->
                    <li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="iconfont icon-wenzhang1" ></i>
                            <span>内容管理</span>
                            <em class="layui-nav-more"></em>
                        </a>
                        <dl class="layui-nav-child">
                            <dd>
                                <a href="javascript:;" data-url="404.jsp">
                                    <i class="iconfont icon-lanmuguanli" data-icon='icon-lanmuguanli'></i>
                                    <span>404页面</span>
                                </a>
                            </dd>
                            <dd>
                                <a href="javascript:;">
                                    <i class="iconfont icon-wenzhang2" data-icon='icon-wenzhang2'></i>
                                    <span>所有档案列表</span>
                                </a>
                            </dd>
                            <dd>
                                <a href="javascript:;">
                                    <i class="iconfont icon-icon1" data-icon='icon-icon1'></i>
                                    <span>待审核的档案</span>
                                </a>
                            </dd>
                            <dd>
                                <a href="javascript:;">
                                    <i class="iconfont icon-word" data-icon='icon-word'></i>
                                    <span>我发布的文档</span>
                                </a>
                            </dd>
                            <dd>
                                <a href="javascript:;">
                                    <i class="iconfont icon-pinglun1" data-icon='icon-pinglun1'></i>
                                    <span>评论管理</span>
                                </a>
                            </dd>

                            <dd>
                                <a href="javascript:;">
                                    <i class="iconfont icon-tags1" data-icon='icon-tags1'></i>
                                    <span>TAGS管理</span>
                                </a>
                            </dd>
                            <dd>
                                <a href="javascript:;">
                                    <i class="iconfont icon-huishouzhan1" data-icon='icon-huishouzhan1'></i>
                                    <span>内容回收站</span>
                                </a>
                            </dd>
                        </dl>
                    </li>
                </ul>
            </div>
        </div>

        <!-- 左侧侧边导航结束 -->
        <!-- 右侧主体内容 -->
        <div class="layui-body" id="larry-body" style="bottom: 0;border-left: solid 2px #2299ee;">
            <div class="layui-tab layui-tab-card larry-tab-box" id="larry-tab" lay-filter="demo" lay-allowclose="true">
                <div class="go-left key-press pressKey" id="titleLeft" title="滚动至最右侧"><i class="larry-icon larry-weibiaoti6-copy"></i> </div>
                <ul class="layui-tab-title">
                    <li class="layui-this" id="admin-home"><i class="iconfont icon-diannao1"></i><em>后台首页</em></li>
                </ul>
                <div class="go-right key-press pressKey" id="titleRight" title="滚动至最左侧"><i class="larry-icon larry-right"></i></div>
                <ul class="layui-nav closeBox">
                    <li class="layui-nav-item">
                        <a href="javascript:;"><i class="iconfont icon-caozuo"></i> 页面操作</a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:;" class="refresh refreshThis"><i class="layui-icon">&#x1002;</i> 刷新当前</a></dd>
                            <dd><a href="javascript:;" class="closePageOther"><i class="iconfont icon-prohibit"></i> 关闭其他</a></dd>
                            <dd><a href="javascript:;" class="closePageAll"><i class="iconfont icon-guanbi"></i> 关闭全部</a></dd>
                        </dl>
                    </li>
                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <iframe class="larry-iframe" data-id='0' src="tab_students.jsp"></iframe>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 加载js文件-->
    <script type="text/javascript" src="common/layui/layui.js"></script>
    <script type="text/javascript" src="js/larry.js"></script>
    <script type="text/javascript" src="js/jquery-2.1.0.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script>
        //查询所有的班级
        $(function () {
            $.get("course/findAllClass", {} ,function (data) {
                var list= '<dd>\n' +
                    '    <a href="javascript:;" data-url="tab_students.jsp?className=所有课程">\n' +
                    '        <i class="iconfont icon-geren1" data-icon=\'icon-geren1\'></i>\n' +
                    '        <span>所有课程</span>\n' +
                    '    </a>\n' +
                    '</dd>';
                for (var i = 0; i < data.length; i++) {
                    var li = '<dd>\n' +
                        '    <a href="javascript:;" data-url="tab_students.jsp?className='+data[i]+'">\n' +
                        '        <i class="iconfont icon-geren1" data-icon=\'icon-geren1\'></i>\n' +
                        '        <span>'+data[i]+'</span>\n' +
                        '    </a>\n' +
                        '</dd>';
                    list += li;
                }
                $("#class-item").html(list);
            });
        });
    </script>

</body>
</html>
