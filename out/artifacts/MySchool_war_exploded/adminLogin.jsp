<%--
  Created by IntelliJ IDEA.
  User: 李旺旺
  DateTime: 2020/1/5 10:03
  Description: 
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员登录</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <%--  加载css样式  --%>
    <link rel="stylesheet" type="text/css" href="common/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="css/adminLogin.css" media="all">
</head>
<body>

    <div class="layui-canvs"></div>
    <form id="input-form" action="" method="post">
        <div class="layui-layout layui-layout-login">
            <h1>
                <strong>培训机构系统后台</strong>
                <em>Management System</em>
            </h1>
            <div class="layui-user-icon larry-login">
                <input type="text" name="account" placeholder="请输入账号" id="input-account" class="login_txtbx form-control"/>
            </div>
            <div class="layui-pwd-icon larry-login">
                <input type="password" name="password" placeholder="请输入密码" id="input-password" class="login_txtbx form-control"/>
            </div>
            <div class="errorMsg"></div>
            <div class="layui-submit larry-login">
                <input type="button" value="立即登陆" class="submit_btn"/>
            </div>
        </div>
    </form>

    <%--  加载js文件  --%>
    <script type="text/javascript" src="common/layui/lay/dest/layui.all.js"></script>
    <script type="text/javascript" src="js/adminLogin.js"></script>
    <script type="text/javascript" src="jsplug/jparticle.jquery.js"></script>
    <script type="text/javascript">
        $(function(){
            $(".layui-canvs").jParticle({
                background: "#141414",
                color: "#E6E6E6"
            });
            $("#input-account").focus();
            //登录链接测试，使用时可删除
            $(".submit_btn").click(function(){
                if ($("#input-account").val() == ''){
                    $(".errorMsg").html("账号不能为空")
                }else if ($("#input-password").val() == ''){
                    $(".errorMsg").html("密码不能为空")
                }else {
                    $.post("admin/login", $("#input-form").serialize(), function (data) {
                        if (data.flag){
                            location.href="adminIndex.jsp";
                        }else {
                            $(".errorMsg").html(data.errorMsg);
                        }
                    });
                }
            });
        });
    </script>
</body>
</html>
