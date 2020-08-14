<%--
  Created by IntelliJ IDEA.
  User: 李旺旺
  DateTime: 2020/1/5 21:11
  Description:
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>学校信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <%--  加载css样式  --%>
    <link rel="stylesheet" type="text/css" href="common/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="common/bootstrap/css/bootstrap.css" media="all">
    <link rel="stylesheet" type="text/css" href="common/global.css" media="all">
    <link rel="stylesheet" type="text/css" href="css/personal.css" media="all">
    <%
        if (null == session.getAttribute("admin")){
            response.sendRedirect(request.getContextPath() + "/adminLogin.jsp");
        }
    %>
</head>
<body>
<section class="layui-larry-box">
    <div class="larry-personal">
        <header class="larry-personal-tit">
            <span>学校信息</span>
        </header>
        <div class="larry-personal-body clearfix">
            <form id="student-form" class="layui-form col-lg-5" action="" method="post">
                <input id="userTele" type="hidden" name="userTele">
                <input id="className" type="hidden" name="className">
                <div class="layui-form-item">
                    <label class="layui-form-label">学校名称</label>
                    <div class="layui-input-block">
                        <input id="schoolName" type="text" name="name"  autocomplete="off"  class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">学校地址</label>
                    <div class="layui-input-block">
                        <input id="schoolAddress" type="text" name="location"  autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">学校简介</label>
                    <div class="layui-input-block">
                        <input id="schoolIntroduce" style="width: 800px" type="text" name="introduce"  autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <input type="submit" class="layui-btn" lay-filter="demo1" value="保存">
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>

<%--  加载js文件  --%>
<script type="text/javascript" src="common/layui/layui.js"></script>
<script type="text/javascript" src="common/layui/lay/modules/form.js"></script>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="js/getParameter.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script>
    $(function () {
        //显示学校信息
        $.get("school/findSchool", {}, function (school) {
            $("#schoolName").val(school.name);
            $("#schoolAddress").val(school.location);
            $("#schoolIntroduce").val(school.introduce);
        });
        //保存学校信息
        $("#student-form").submit(function () {
            $.post("student/updateStudent", $(this).serialize(), function (result) {
                if (student == true){
                    //保存成功
                    alert("修改成功");
                    location.reload();
                }else {
                    alert("修改失败,请确认信息是否正确");
                    //保存失败
                }
            });
        });
    });
</script>
</body>
</html>
