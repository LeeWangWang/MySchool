<%@ page import="domain.examPolicy" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2020/1/4
  Time: 18:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>管理员管理政策信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" media="all">
    <link rel="stylesheet" type="text/css" href="css/global.css" media="all">
    <link rel="stylesheet" type="text/css" href="css/personal.css" media="all">
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="common/layui/lay/modules/layer.js">
    <%
        if (null == session.getAttribute("admin")){
            response.sendRedirect(request.getContextPath() + "/adminLogin.jsp");
        }
    %>

</head>
<body>
<%ArrayList<examPolicy> eeg = new ArrayList<examPolicy>();
    eeg = (ArrayList<examPolicy>)session.getAttribute("allPolicy");%>
<section class="layui-larry-box">
    <div class="larry-personal">
        <div class="layui-tab" >
            <blockquote class="layui-elem-quote news_search">
                <!-- 模态框（Modal） -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                     style="z-index: 11111" aria-hidden="true">
                    <div class="modal-dialog" style="width:1100px">
                        <div class="modal-content">
                            <form action="/addNewPolicyServlet" method="post">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title" id="myModalLabel">添加中考资讯</h4>&nbsp;
                                </div>
                                <div class="modal-body">
                                    <%--内容--%>
                                    <div class="input-group">
                                        <br>
                                        <span style="float: left; height: 34px; width: 50px; line-height: 34px;margin-left: 320px">
                                            标题
                                        </span>
                                        <input type="text" class="form-control" name="biaoti" placeholder="长度不小于0，不大于30" aria-describedby="basic-addon1"
                                            style="width:400px;resize:none; height: 34px; float: left;">
                                        <hr>
                                        <span style="float: left; height: 34px; width: 50px; line-height: 34px;margin-left: 50px">
                                            内容
                                        </span>
                                        <textarea type="text" class="form-control" name="neirong" placeholder="文章内容" aria-describedby="basic-addon1"
                                                  style="width:900px;resize:none; height: 650px; float: left;"></textarea>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                    <input type="submit" value="提交" style="width: 54px;height: 34px">
                                </div>
                            </form>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>
                <%--上面是模态框--%>


                <div class="layui-inline">
                    <div class="layui-input-inline">
                        <input value="" placeholder="请输入关键字" class="layui-input search_input" type="text">
                    </div>
                    <a class="layui-btn search_btn">查询</a>
                </div>
                <div class="layui-inline">
                    <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">添加中考资讯</button>
                </div>
                <div class="layui-inline">
                    <div class="layui-form-mid layui-word-aux">您可在该界面对对政策资讯栏进行编辑</div>
                </div>
            </blockquote>

            <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
                <!-- 操作日志 -->
                <div class="layui-tab-item layui-field-box layui-show">
                    <table class="layui-table" lay-even="" lay-skin="nob" id="policy_View">
                        <thead>
                        <tr>
                            <th></th>
                            <th>ID</th>
                            <th>时间</th>
                            <th>日期</th>
                            <th>内容</th>
                            <th>状态</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%if(eeg != null){
                            for (int i = 0;i < eeg.size();i++){%>
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td><%=eeg.get(i).getId()%></td>
                                    <td><%=eeg.get(i).getTime()%></td>
                                    <td><%=eeg.get(i).getTitle()%></td>
                                    <%if (eeg.get(i).getContent().length() < 40){%>
                                        <td><%=eeg.get(i).getContent()%></td>
                                    <%}else{%>
                                    <td><%=eeg.get(i).getContent().substring(0,39)+"..."%></td>
                                    <%}%>
                                    <td>

                                    <a href="/skipRowServlet?id=<%=eeg.get(i).getId()%>&title=<%=eeg.get(i).getTitle()%>&content=<%=eeg.get(i).getContent()%>">
                                    修改
                                    </a>
                                    <a href="/>"
                                       οnclick="if(confirm('是否要删除？')==false)return false;">
                                        删除
                                    </a>
                                    </td>
                                </tr>
                            <%}}else{%>
                            <h1>没值</h1>
                            <%}%>
                        </tbody>
                    </table>

                    <script type="text/javascript">
                        function changeDate(obj) {
                            /*sessionStorage.setItem('row', obj);*/
                            <%--<%int row1 = (int)session.getAttribute("row");%>
                            alert("<%=row1%>")--%>
                            
                        }
                    </script>

                    <div class="larry-table-page clearfix">
                    </div>
                </div>
                <a class="layui-btn search_btn">删除</a>&nbsp;&nbsp;
                <a class="layui-btn search_btn" href="/adminAllFindPolicyServlet">刷新</a>
            </div>
            <!-- 模态框（Modal） 修改信息的-->
            <%--<script>var row = 0;</script>
            <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                 style="z-index: 11111" aria-hidden="true">
                <div class="modal-dialog" style="width:1100px">
                    <div class="modal-content">
                        <form action="/changePolicyServlet" method="post">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="myModalLabe2">修改中考资讯</h4>&nbsp;
                            </div>
                            <div class="modal-body">
                                &lt;%&ndash;内容&ndash;%&gt;
                                <div class="input-group">
                                    <br>
                                    <span style="float: left; height: 34px; width: 50px; line-height: 34px;margin-left: 320px">
                                            标题
                                        </span>
                                    &lt;%&ndash;<%int row = 0;
                                        row = (int)session.getAttribute("row");%>&ndash;%&gt;
                                    <input type="text" class="form-control" name="biaoti" placeholder="<%eeg.get(i).getTitle()%>" aria-describedby="basic-addon1"
                                           style="width:400px;resize:none; height: 34px; float: left;">
                                    <hr>
                                    <span style="float: left; height: 34px; width: 50px; line-height: 34px;margin-left: 50px">
                                            内容
                                        </span>
                                    <textarea type="text" class="form-control" name="neirong" placeholder="" aria-describedby="basic-addon1"
                                              style="width:900px;resize:none; height: 650px; float: left;"></textarea>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <input type="submit" value="提交" style="width: 54px;height: 34px">
                            </div>
                        </form>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>--%>
            <%--上面是模态框--%>
        </div>
    </div>

</section>
<%--添加中考资讯的模态框--%>

<script type="text/javascript" src="js/layui.js"></script>
<script type="text/javascript">
    layui.use(['jquery','layer','element','laypage'],function(){
        window.jQuery = window.$ = layui.jquery;
        window.layer = layui.layer;
        var element = layui.element(),
            laypage = layui.laypage;


        laypage({
            cont: 'page',
            pages: 10 //总页数
            ,
            groups: 5 //连续显示分页数
            ,
            jump: function(obj, first) {
                //得到了当前页，用于向服务端请求对应数据
                var curr = obj.curr;
                if(!first) {
                    //layer.msg('第 '+ obj.curr +' 页');
                }
            }
        });

        laypage({
            cont: 'page2',
            pages: 10 //总页数
            ,
            groups: 5 //连续显示分页数
            ,
            jump: function(obj, first) {
                //得到了当前页，用于向服务端请求对应数据
                var curr = obj.curr;
                if(!first) {
                    //layer.msg('第 '+ obj.curr +' 页');
                }
            }
        });
    });
</script>
</body>
</html>
