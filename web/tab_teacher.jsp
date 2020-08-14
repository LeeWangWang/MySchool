<%--
  Created by IntelliJ IDEA.
  User: 李旺旺
  DateTime: 2020/1/2 19:56
  Description: 
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>教师信息</title>
    <!-- 加载 css样式 -->
    <link rel="stylesheet" type="text/css" href="common/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="common/bootstrap/css/bootstrap.css" media="all">
    <link rel="stylesheet" type="text/css" href="common/global.css" media="all">
    <link rel="stylesheet" type="text/css" href="css/tab_student.css" media="all">
    <%
        if (null == session.getAttribute("admin")){
            response.sendRedirect(request.getContextPath() + "/adminLogin.jsp");
        }
    %>
</head>
<body>

    <section class="layui-larry-box">
        <div class="larry-personal">
            <div class="layui-tab">
                <!-- 教师列表 -->
                <div class="layui-form news_list">
                    <table class="layui-table">
                        <colgroup>
                            <col width="5%">
                            <col width="50%">
                            <col width="5%">
                        </colgroup>
                        <thead>
                            <tr>
                                <th>教师姓名</th>
                                <th>教师简介</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody id="teacher-list" class="news_content">
                            <%--<tr>
                                <td>李先生</td>
                                <td>这是一个好老师</td>
                                <td>
                                    <a href="student_detail.jsp?stele=15587379525&sclass=ji算计网络" class="layui-btn layui-btn-mini news_edit"><i class="iconfont icon-edit"></i> 编辑</a>
                                </td>
                            </tr>--%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>

    <!-- 加载js文件-->
    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="js/getParameter.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <style>
        .search_input {
            width: 300px;
        }
    </style>
    <script>
        $(function () {
            //显示学校信息
            $.get("teacher/findTeacher", {}, function (data) {
                //列表数据展示
                var teacher_list = '';
                for (var i = 0; i < data.length; i++) {
                    var teacher = data[i];
                    var li = '<tr>\n' +
                        '         <td>'+teacher.name+'</td>\n' +
                        '         <td>'+teacher.introduce+'</td>\n' +
                        '         <td>\n' +
                        '           <a href="teacher_detail.jsp?id='+teacher.id+'" class="layui-btn layui-btn-mini news_edit"><i class="iconfont icon-edit"></i> 编辑</a>\n' +
                        '         </td>\n' +
                        '      </tr>';
                    teacher_list += li;
                }
                $("#teacher-list").html(teacher_list);
            });
        });
    </script>
</body>
</html>
