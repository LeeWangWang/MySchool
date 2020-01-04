<%--
  Created by IntelliJ IDEA.
  User: 李旺旺
  DateTime: 2020/1/4 21:52
  Description: 
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>管理员登录</title>
    <link type="text/css" href="css/bootstrap.min.css">
    <script type="text/javascript" src="js/jquery-2.1.0.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <style>
        body {
            background-color: #ebe9ee;
        }
        #login {
            width: 600px;
            margin-left: 450px;
            margin-top: 100px;
            padding: 35px;
            background-color: #dcdadf;
            border-radius: 10px;
            text-align: center;
        }
        /*管理员登录*/
        .admin-login {
            user-select: none;
            margin-bottom: 10px;
            font-size: 30px;
        }
        input{
            border: 1px solid #ccc;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
            -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s
        }
        input:focus{
            border-color: #66afe9;
            outline: 0;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);
            box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6)
        }
        /*输入框*/
        .admin-input {
            font-size: 20px;
            font-family: SimSun;
            border-radius: 10px;
            margin-top: 50px;
        }
        /*账号密码*/
        .admin-text {
            user-select: none;
            font-size: 25px;
            font-family: SimSun;
            margin-top: 40px;
        }
        /*按钮*/
        .admin-button {
            font-size: 25px;
            font-family: "Microsoft YaHei";
            border-radius: 10px;
            margin-top: 40px;
        }
        #errorMsg {
            margin-top: 10px;
            color: #ff0000;
        }
    </style>
    <script>
        /*var form = document.forms[0];
        var submit = document.querySelector("admin-button");
        var input = document.getElementsByTagName("input");
        form.onsubmit = function () {
            if (input[0].value == ''){
                $("#errorMsg").html("账号不能为空");
                return false;
            }else if (input[1].value == ''){
                $("#errorMsg").html("密码不能为空");
                return false;
            }else if (input[0].value == '' && input[1].value == ''){
                submit.onsubmit();
            }
        }*/
    </script>
</head>
<body>

    <div id="login" class="container">
        <div class="admin-login">管理员登录</div>
        <form action="${pageContext.request.contextPath}/adminServlet?&funcName=login" method="post">

            <div class="form-group">
                <label class="admin-text" for="account">账号：</label>
                <input type="text" name="account" required="required" class="admin-input form-control" id="account" placeholder="请输入账号"/>
            </div>

            <div class="form-group">
                <label class="admin-text"for="password">密码：</label>
                <input type="password" name="password" required="required" class="admin-input form-control" id="password" placeholder="请输入密码"/>
            </div>

            <div id="errorMsg">${login_msg}</div>
            <div class="form-group">
                <input class="admin-button btn btn-primary" type="submit" value="登录"/>
            </div>
        </form>
    </div>

</body>
</html>
