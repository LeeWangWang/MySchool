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
    <link rel="stylesheet" type="text/css" href="css/tab_student.css" media="all">
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
            var className = getParameter("class");
            var search = getParameter("search");
            if (className){
                className = window.decodeURIComponent(className);
            }
            if (search){
                search = window.decodeURIComponent(search);
            }else {
                search = "";
            }
            //查询每个班级的学生
            /*$.get("student/findStudentByClassAndSearch", {className:className, search:search}, function (data) {
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
            });*/
            //当页码加载完成后，调用load方法，发送ajax请求加载数据
            load(className, null, search);
        });
        function load(className, currentPage, search) {
            $.get("student/findStudentPage",{className:className, currentPage:currentPage, search:search}, function (pageDate) {
                //解析数据，展示到界面上
                //1.1 展示总页码和总记录数
                $("#totalPage").html(pageDate.totalPage);
                $("#totalCount").html(pageDate.totalCount);
                var list = "";
                var first = '<li onclick="load(\''+className+'\',1,\''+search+'\')"><a href="javascript:void(0)">首页</a></li>';
                //计算上一页面
                var beforeNum = pageDate.currentPage - 1;
                if (beforeNum <= 0){
                    beforeNum = 1;
                }
                var before = '<li onclick="load(\''+className+'\','+beforeNum+',\''+search+'\')" class="threeword"><a href="javascript:void(0)">上一页</a></li>';
                list += first;
                list += before;
                var begin;
                var end = pageDate.totalPage;
                //1.要显示10个页码
                if(pageDate.totalPage < 10){
                    //总页码不够10页
                    begin = 1;
                    end = pageDate.totalPage;
                }else{
                    //总页码超过10页

                    begin = pageDate.currentPage - 5 ;
                    end = pageDate.currentPage + 4 ;

                    //2.如果前边不够5个，后边补齐10个
                    if(begin < 1){
                        begin = 1;
                        end = begin + 9;
                    }

                    //3.如果后边不足4个，前边补齐10个
                    if(end > pageDate.totalPage){
                        end = pageDate.totalPage;
                        begin = end - 9 ;
                    }
                }
                for (var i = begin; i <= end; i++) {
                    var li;
                    if (pageDate.currentPage == i){
                        li = '<li class="curPage" onclick="javascipt:load(\''+className+'\','+i+',\''+search+'\')"><a href="javascript:void(0)">'+i+'</a></li>';
                    }else {
                        li = '<li onclick="load(\''+className+'\','+i+',\''+search+'\')"><a href="javascript:void(0)">'+i+'</a></li>';
                    }
                    list += li;
                }
                //计算下一页的页码
                var nextNum =  pageDate.currentPage + 1;
                if(nextNum >= pageDate.totalPage){
                    nextNum = pageDate.totalPage;
                }
                var next = '<li onclick="load(\''+className+'\','+nextNum+',\''+search+'\')" class="threeword"><a href="javascript:void(0)">下一页</a></li>';
                var last = '<li onclick="load(\''+className+'\','+pageDate.totalPage+',\''+search+'\')"><a href="javascript:void(0)">尾页</a></li>';
                list += next;
                list += last;
                $("#pageNum").html(list);
                /*
                        <li><a href="">首页</a></li>
                        <li class="threeword"><a href="#">上一页</a></li>
                        <li class="curPage"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#">6</a></li>
                        <li><a href="#">7</a></li>
                        <li><a href="#">8</a></li>
                        <li><a href="#">9</a></li>
                        <li><a href="#">10</a></li>
                        <li class="threeword"><a href="javascript:;">下一页</a></li>
                        <li class="threeword"><a href="javascript:;">末页</a></li>
                */
                //列表数据展示
                var students_list = '';
                for (var i = 0; i < pageDate.list.length; i++) {
                    var student = pageDate.list[i];
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
                        '    <a onclick="deleteStudent('+student.tele+','+student.coursesName+','+className+','+currentPage+','+search+')" ' +
                        '           class="layui-btn layui-btn-danger layui-btn-mini news_del" data-id="1"><i class="layui-icon"></i> 删除</a>\n' +
                        '</td>' +
                        '</tr>';
                    students_list += li;
                }
                $("#class-list").html(students_list);
            });
        }

        function deleteStudent(tele, coursesName, className, currentPage, search) {
            if (confirm("您确定要删除吗？")){
                $.get("student/deleteStudent", {tele:tele, coursesName:coursesName},function () {
                    load(className, currentPage, search);
                });
            }
        }

        //点击查询按钮，查询学生信息
        function searchStudent() {
            var className = getParameter("class");
            if (className){
                className = decodeURIComponent(className);
            }
            var search = $(".search_input").val();
            if (search == null){
                search = "";
            }
            location.href = "http://localhost:8080/MySchool/tab_students.jsp?class="+className+"&search="+search;
        }

    </script>
</head>
<body>

    <section class="layui-larry-box">
        <div class="larry-personal">
            <div class="layui-tab">
                <blockquote class="layui-elem-quote news_search">
                    <div class="layui-inline">
                        <div class="layui-input-inline">
                            <input id="search-input" value="" placeholder="请输入关键字" class="layui-input search_input" type="text">
                        </div>
                        <a class="layui-btn search_btn" onclick="searchStudent()">查询</a>
                    </div>
                    <div class="layui-inline">
                        <div class="layui-form-mid layui-word-aux">本页面刷新后除新添加的文章外所有操作无效，关闭页面所有数据重置</div>
                    </div>
                </blockquote>
                <!-- 学生列表 -->
                <div class="layui-form news_list">
                    <table class="layui-table">
                        <colgroup>
                            <col width="8%">
                            <col width="10%">
                            <col width="5%">
                            <col width="5%">
                            <col width="20%">
                            <col width="8%">
                            <col width="10%">
                            <col width="10%">
                            <col width="14%">
                        </colgroup>
                        <thead>
                            <tr>
                                <th>学生姓名</th>
                                <th>手机号</th>
                                <th>年龄</th>
                                <th>性别</th>
                                <th>地址</th>
                                <th>父母姓名</th>
                                <th>父母电话</th>
                                <th>报名课程</th>
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
                                    <a href="student_detail.jsp?stele=15587379525&sclass=ji算计网络" class="layui-btn layui-btn-mini news_edit"><i class="iconfont icon-edit"></i> 编辑</a>
                                    <a class="layui-btn layui-btn-danger layui-btn-mini news_del" data-id="1"><i class="layui-icon"></i> 删除</a>
                                </td>
                            </tr>--%>
                        </tbody>
                    </table>
                    <div class="page_num_inf">
                        <i></i> 共
                        <span id="totalPage">12</span>页<span id="totalCount">132</span>条
                    </div>
                    <div class="pageNum">
                        <ul id="pageNum">
                            <%--<li><a href="">首页</a></li>
                            <li class="threeword"><a href="#">上一页</a></li>
                            <li class="curPage"><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#">6</a></li>
                            <li><a href="#">7</a></li>
                            <li><a href="#">8</a></li>
                            <li><a href="#">9</a></li>
                            <li><a href="#">10</a></li>
                            <li class="threeword"><a href="javascript:;">下一页</a></li>
                            <li class="threeword"><a href="javascript:;">末页</a></li>--%>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

    </section>

</body>
</html>
