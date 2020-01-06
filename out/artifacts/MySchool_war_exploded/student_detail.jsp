<%--
  Created by IntelliJ IDEA.
  User: 李旺旺
  DateTime: 2020/1/5 21:11
  Description: 
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" type="text/css" href="common/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="common/bootstrap/css/bootstrap.css" media="all">
    <link rel="stylesheet" type="text/css" href="common/global.css" media="all">
    <link rel="stylesheet" type="text/css" href="css/personal.css" media="all">
</head>
<body>
<section class="layui-larry-box">
    <div class="larry-personal">
        <header class="larry-personal-tit">
            <span>学生信息</span>
        </header><!-- /header -->
        <div class="larry-personal-body clearfix">
            <form id="student-form" class="layui-form col-lg-5" action="" method="post">
                <div class="layui-form-item">
                    <label class="layui-form-label">学生姓名</label>
                    <div class="layui-input-block">
                        <input type="text" name="name"  autocomplete="off"  class="layui-input" value="李旺旺">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">手机号</label>
                    <div class="layui-input-block">
                        <input type="text" name="tele"  autocomplete="off" class="layui-input" value="15587379525">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">年龄</label>
                    <div class="layui-input-block">
                        <input type="text" name="age"  autocomplete="off" class="layui-input" value="22">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-block">
                        <input type="radio" name="sex" value="男" title="男" checked=""><div class="layui-unselect layui-form-radio layui-form-radioed"><i class="layui-anim layui-icon"></i><span>男</span></div>
                        <input type="radio" name="sex" value="女" title="女"><div class="layui-unselect layui-form-radio"><i class="layui-anim layui-icon"></i><span>女</span></div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">地址</label>
                    <div class="layui-input-block">
                        <input type="text" name="address"  autocomplete="off" class="layui-input" value="山东省 烟台市 莱山区">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">父母姓名</label>
                    <div class="layui-input-block">
                        <input type="text" name="parentName"  autocomplete="off" class="layui-input" value="李先生">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">父母电话</label>
                    <div class="layui-input-block">
                        <input type="text" name="parentTele"  autocomplete="off" class="layui-input" value="13564677679">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">报名课程</label>
                    <div class="layui-input-block">
                        <select id="select-class" name="coursesName" lay-filter="aihao">
                            <option value="计算机网络">计算机网络</option>
                            <option value="数据结构" selected="selected">计算机基础</option>
                            <option value="软件工程">软件工程</option>
                            <option value="软件工程">数字与媒体</option>
                            <option value="软件工程">计算机与科学</option>
                            <option value="软件工程">操作系统</option>
                            <option value="软件工程">数据结构</option>
                            <option value="软件工程">人工智能</option>
                            <option value="软件工程">神经学习</option>
                        </select>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>
<script type="text/javascript" src="common/layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['form','upload'],function(){
        var form = layui.form();
        layui.upload({
            url: '' ,//上传接口
            success: function(res){
                //上传成功后的回调
                console.log(res)
            }
        });

    });
</script>
</body>
</html>


