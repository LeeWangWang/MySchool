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
        $.get("course/findAllClass", {} ,function (data) {
            var list = '<option value="所有课程">所有课程</option>';
            for (var i = 0; i < data.length; i++) {
                var li = '<option value="'+data[i]+'">'+data[i]+'</option>';
                list += li;
            }
            $("#select-category").html(list);
        });
        $.get("student/findAllStudents", {}, function (data) {
            var list = '';
            for (var i = 0; i < data.length; i++) {
                var student = data[i];
                var li ='<tr>' +
                            '<td>'+student.name+'</td>\n' +
                            '<td>'+student.tele+'</td>\n' +
                            '<td>'+student.age+'</td>\n' +
                            '<td>'+student.sex+'</td>\n' +
                            '<td>'+student.address+'</td>\n' +
                            '<td>'+student.parentName+'</td>\n' +
                            '<td>'+student.parentTele+'</td>\n' +
                            '<td>'+student.coursesName+'</td>\n' +
                            '<td>\n' +
                            '    <a class="layui-btn layui-btn-mini news_edit"><i class="iconfont icon-edit"></i> 编辑</a>\n' +
                            '    <a class="layui-btn layui-btn-danger layui-btn-mini news_del" data-id="1"><i class="layui-icon"></i> 删除</a>\n' +
                            '</td>' +
                        '</tr>';
                list += li;
            }
            $("#class-list").html(list);
        });

    </script>
</head>
<body>

    <section class="layui-larry-box">
        <div class="larry-personal">
            <div class="layui-tab">
                <blockquote class="layui-elem-quote news_search">
                    <div class="layui-inline">
                        <select id="select-category" class="form-control" onchange="selectOnchange()">
                            <%--<option value="所有课程">所有课程</option>
                            <option value="计算机网络">计算机网络</option>
                            <option value="数据结构">数据结构</option>
                            <option value="人工智能">人工智能</option>
                            <option value="图像处理">图像处理</option>
                            <option value="操作系统">操作系统</option>--%>
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
                <div class="layui-form news_list">
                    <table class="layui-table">
                        <colgroup>
                            <col width="10%">
                            <col width="10%">
                            <col width="5%">
                            <col width="5%">
                            <col width="20%">
                            <col width="10%">
                            <col width="10%">
                            <col width="10%">
                            <col width="10%">
                        </colgroup>
                        <thead>
                            <tr>
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
                        </thead>
                        <tbody id="class-list" class="news_content">
                            <%--<tr>
                                <td>李先生</td>
                                <td>155687379525</td>
                                <td>22</td>
                                <td>男</td>
                                <td>山东省 烟台市 莱山区</td>
                                <td>李先生</td>
                                <td>155687379525</td>
                                <td>计算机网络</td>
                                <td>
                                    <a class="layui-btn layui-btn-mini news_edit"><i class="iconfont icon-edit"></i> 编辑</a>
                                    <a class="layui-btn layui-btn-danger layui-btn-mini news_del" data-id="1"><i class="layui-icon"></i> 删除</a>
                                </td>
                            </tr>--%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </section>

</body>
</html>
