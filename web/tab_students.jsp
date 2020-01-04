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
    <title>学生信息</title>
    <link rel="stylesheet" type="text/css" href="common/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="common/bootstrap/css/bootstrap.css" media="all">
    <link rel="stylesheet" type="text/css" href="common/global.css" media="all">
    <script type="text/javascript" src="js/jquery-2.1.0.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <style>
    </style>
    <script>
        function deleteStudent(tele) {
            if (confirm("您确定要删除吗？")){
                location.href="${pageContext.request.contextPath}/studentServlet?&funcName=deleteStudent&tele=${student.tele}";
            }
        }
        //下拉菜单添加改变事件
        function selectOnchange() {
            var selectText = $("#select-category").find("option:selected").text();
            alert(this.value());
            window.location=this.value;
        }
    </script>
</head>
<body>

    <section class="layui-larry-box">
        <div class="larry-personal">
            <div class="layui-tab">
                <blockquote class="layui-elem-quote news_search">
                    <div class="layui-inline">
                        <select id="select-category" class="form-control" onchange="selectOnchange()">
                            <option value="tab_students.jsp?cname=所有课程">所有课程</option>
                            <option value="tab_students.jsp?cname=计算机网络">计算机网络</option>
                            <option value="tab_students.jsp?cname=数据结构">数据结构</option>
                            <option value="tab_students.jsp?cname=人工智能">人工智能</option>
                            <option value="tab_students.jsp?cname=图像处理">图像处理</option>
                            <option value="tab_students.jsp?cname=操作系统">操作系统</option>
                        </select>
                    </div>

                    <div class="layui-inline">
                        <div class="layui-input-inline">
                            <input value="" placeholder="请输入关键字" class="layui-input search_input" type="text">
                        </div>
                        <a class="layui-btn search_btn">查询</a>
                    </div>
                    <div class="layui-inline">
                        <div class="layui-form-mid layui-word-aux">本页面刷新后除新添加的文章外所有操作无效，关闭页面所有数据重置</div>
                    </div>
                </blockquote>

                <!-- 学生列表 -->
                <form id="form" action="${pageContext.request.contextPath}/studentServlet?&funcName=findAllStudents" method="post">
                    <table border="1" class="table table-bordered table-hover">
                        <tr class="success">
                            <th>学生姓名</th>
                            <th>电话</th>
                            <th>年龄</th>
                            <th>性别</th>
                            <th>地址</th>
                            <th>父母姓名</th>
                            <th>父母电话</th>
                            <th>课程名</th>
                            <th>操作</th>
                        </tr>
                        <c:forEach items="${students}" var="student">
                            <td>${student.name}</td>
                            <td>${student.tele}</td>
                            <td>${student.age}</td>
                            <td>${student.sex}</td>
                            <td>${student.address}</td>
                            <td>${student.parentName}</td>
                            <td>${student.parentTele}</td>
                            <td>${student.coursesName}</td>
                            <td>
                                <a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/studentServlet?&funcName=findStudentByTele&tele=${student.tele}">修改</a>
                                <a class="btn btn-default btn-sm" href="javascript:deleteStudent(${student.tele})">删除</a>
                            </td>
                        </c:forEach>
                    </table>
                </form>
            </div>
        </div>

    </section>

</body>
</html>
