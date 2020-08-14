<%--
  Created by IntelliJ IDEA.
  User: 李瑞泉
  Date: 2019/11/9
  Time: 19:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>用户首页</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script>
        function signUp(a,b) {
           window.location.href="${pageContext.request.contextPath}/SignUpInterface.jsp";
        };
    </script>
    <style type="text/css">
        p {
            text-align: center;
        }
        span{
            color: red;
        }
        #uploading_success{
            background: grey;
            margin-top: 80px;
        }
    </style>
</head>
<body id="uploading_success">
<div class="container" style="width: 400px;">

   <h3> 恭喜您，上传成功</h3>
    <p>
        <span id="time">
				8
        </span>
        秒之后跳转到首页...
        <br>
        <a href="${pageContext.request.contextPath}/VideoUploadingInterface.jsp">点击继续上传</a>
    </p>
    <script type="text/javascript">
        var time = document.getElementById("time");
        var num = 8;
        function fun(){
            num--;
            time.innerHTML = num;

            if(num==0){
                clearInterval(id);
                location.href = "${pageContext.request.contextPath}/adminIndex.jsp";
            }
        }
        var id = setInterval(fun,1000);



    </script>
</div>
</body>
</html>
