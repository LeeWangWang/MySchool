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
    <title>学生信息</title>
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
                <span>学生信息</span>
            </header>
            <div class="larry-personal-body clearfix">
                <form id="student-form" class="layui-form col-lg-5" action="" method="post">
                    <input id="userTele" type="hidden" name="userTele">
                    <input id="className" type="hidden" name="className">
                    <div class="layui-form-item">
                        <label class="layui-form-label">学生姓名</label>
                        <div class="layui-input-block">
                            <input id="input-name" type="text" name="name"  autocomplete="off"  class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">手机号</label>
                        <div class="layui-input-block">
                            <input id="input-tele" lay-verify="phone" type="text" name="tele"  autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">年龄</label>
                        <div class="layui-input-block">
                            <input id="input-age" lay-verify="number" type="text" name="age"  autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div id="input-sex" class="layui-form-item">
                        <label class="layui-form-label">性别</label>
                        <div class="layui-input-block">
                            <input type="radio" name="sex" value="男" title="男">
                            <div id="input-sex0" class="layui-unselect layui-form-radio">
                                <i class="layui-anim layui-icon"> </i>
                                <span>男</span>
                            </div>
                            <input type="radio" name="sex" value="女" title="女">
                            <div id="input-sex1" class="layui-unselect layui-form-radio">
                                <i class="layui-anim layui-icon"></i>
                                <span>女</span>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">地址</label>
                        <div class="layui-input-block">
                            <input id="input-address" type="text" name="address"  autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">父母姓名</label>
                        <div class="layui-input-block">
                            <input id="input-parentName" type="text" name="parentName"  autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">父母电话</label>
                        <div class="layui-input-block">
                            <input id="input-parentTele" lay-verify="phone" type="text" name="parentTele"  autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">报名课程</label>
                        <div class="layui-input-block">
                            <select id="select-class" name="coursesName" lay-filter="aihao">
                                <option id="class1" value="2020全新ES6精讲">2020全新ES6精讲</option>
                                <option id="class2" value="GO Web开发">GO Web开发</option>
                                <option id="class3" value="javaScript基础">javaScript基础</option>
                                <option id="class4" value="JavaWeb项目实战全程实录">JavaWeb项目实战全程实录</option>
                                <option id="class5" value="Java面向对象编程">Java面向对象编程</option>
                                <option id="class6" value="PHP面向对象编程">PHP面向对象编程</option>
                                <option id="class7" value="PS、AI、AE三剑客">PS、AI、AE三剑客</option>
                                <option id="class8" value="Python高级特性">Python高级特性</option>
                                <option id="class9" value="大数据：离线计算">大数据：离线计算</option>
                                <option id="class10" value="学习Scala进击大数据Spark生态圈">学习Scala进击大数据Spark生态圈</option>
                                <option id="class11" value="生产环境下的LAMP环境搭建">生产环境下的LAMP环境搭建</option>
                                <option id="class12" value="页面各种布局方式攻略实战全程实录">页面各种布局方式攻略实战全程实录</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <input type="submit" class="layui-btn" lay-filter="demo1" value="立即提交">
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
            layui.use(['form'],function(){
                var form = layui.form();
            });
            var tele = getParameter("tele");
            var className = getParameter("className");
            if (tele){
                tele = window.decodeURIComponent(tele);
            }
            if (className){
                className = window.decodeURIComponent(className);
            }
            $("#userTele").val(tele);
            $("#className").val(className);
            //显示学生报名信息
            $.get("student/findOneStudent", {tele:tele, className:className}, function (student) {
                $("#input-name").val(student.name);
                $("#input-tele").val(student.tele);
                $("#input-age").val(student.age);
                if (student.sex == "男"){
                    $("#input-sex0").click();
                }
                else{
                    $("#input-sex1").click();
                }
                $("#input-address").val(student.address);
                $("#input-parentName").val(student.parentName);
                //var className = student.coursesName.replace(/[]/g,"");
                $("#input-parentTele").val(student.parentTele);
                if (className == "2020全新ES6精讲"){$("#class1").attr("selected", "selected")}
                else if (className == "GO Web开发"){$("#class2").attr("selected", "selected")}
                else if (className == "javaScript基础"){$("#class3").attr("selected", "selected")}
                else if (className == "JavaWeb项目实战全程实录"){$("#class4").attr("selected", "selected")}
                else if (className == "Java面向对象编程"){$("#class5").attr("selected", "selected")}
                else if (className == "PHP面向对象编程"){$("#class6").attr("selected", "selected")}
                else if (className == "PSAIAE三剑客"){$("#class7").attr("selected", "selected")}
                else if (className == "Python高级特性"){$("#class8").attr("selected", "selected")}
                else if (className == "大数据：离线计算"){$("#class9").attr("selected", "selected")}
                else if (className == "学习Scala进击大数据Spark生态圈"){$("#class10").attr("selected", "selected")}
                else if (className == "生产环境下的LAMP环境搭建"){$("#class11").attr("selected", "selected")}
                else if (className == "页面各种布局方式攻略实战全程实录"){$("#class12").attr("selected", "selected")}
            });
            //保存学生报名信息
            $("#student-form").submit(function () {
                $.post("student/updateStudent", $(this).serialize(), function (student) {
                    if (student != null){
                        //保存成功
                        alert("修改成功，即将返回上一页面");
                        location.href="tab_students.jsp?&className="+student.coursesName;
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
