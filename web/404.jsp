<%--
  Created by IntelliJ IDEA.
  User: 李旺旺
  DateTime: 2020/1/2 10:59
  Description: 
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>个人信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" type="text/css" href="common/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="common/bootstrap/css/bootstrap.css" media="all">
    <link rel="stylesheet" type="text/css" href="common/global.css" media="all">
    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <script>
        function selectOnchange2() {
            var selectText = $("#class-category").find("option:selected").text();
            alert(window.location);
        }
        function selectOnchange3() {
            var selectText = $("#select-category").find("option:selected").text();
            alert(window.location+this.value);
        }
    </script>
</head>
<body class="childrenBody">
    <div>
        <select id="class-category" class="form-control" onchange="selectOnchange2()">
            <option value="404.jsp">所有课程</option>
            <option value="404.jsp">计算机网络</option>
            <option value="404.jsp">数据结构</option>
            <option value="404.jsp">人工智能</option>
            <option value="404.jsp">图像处理</option>
            <option value="404.jsp">操作系统</option>
        </select>
        <select id="select-category" class="form-control" onchange="selectOnchange3()">
            <option value="404.jsp?cname=所有课程">所有课程</option>
            <option value="404.jsp?cname=计算机网络">计算机网络</option>
            <option value="404.jsp?cname=数据结构">数据结构</option>
            <option value="404.jsp?cname=人工智能">人工智能</option>
            <option value="404.jsp?cname=图像处理">图像处理</option>
            <option value="404.jsp?cname=操作系统">操作系统</option>
        </select>
    </div>
</body>
</html>
