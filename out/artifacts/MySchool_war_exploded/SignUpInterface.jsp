<%--
  Created by IntelliJ IDEA.
  User: 李瑞泉
  Date: 2019/11/9
  Time: 19:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>报名</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-3.3.1.min.js"></script>
    <style>
        .bg-img {
            position: absolute;
            left: 0;
            top: 0;
            right: 0;
            bottom: 0;
            z-index: -1;
            background: url("img/background1.jpg");
            background-position: center;
            background-size: cover;
            background-attachment: fixed;
        }

        .bg-img .overlay {
            position: absolute;
            left: 0;
            top: 0;
            right: 0;
            bottom: 0;
            opacity: .8;
            background: #1C1D21;
        }
        #homepage{
            color: darkgoldenrod;
            font-size: large;
            margin-left: 15px;
            text-decoration:none;

        }
        #home .home-wrapper {
            position: absolute;
            left: 0px;
            right: 0px;
            top: 50%;
            -webkit-transform: translateY(-50%);
            -ms-transform: translateY(-50%);
            transform: translateY(-50%);
            text-align: center;
        }
        .home-content h1 {
            text-transform: uppercase;
            font-size:50px;

        }
        .home-content button {
            margin-top: 20px;
        }
        .white-text {
            color: #FFF;
            font-weight:600 ;
            font-size: 20px;
        }
        .main-btn{
            display: inline-block;
            padding: 10px 35px;
            margin: 3px;
            border: 2px solid transparent;
            border-radius: 3px;
            -webkit-transition: 0.2s opacity;
            transition: 0.2s opacity;
        }
        .main-btn {
            background: #6195FF;
            color: #FFF;
        }
        .main-btn {
            padding: 8px 22px;
            font-size:14px;
        }
        .main-btn:hover{
            color: #fff;
            background: #0a90f5;
        }
        .main-btn:focus{
            color: #fff;
            background: #0a90f5;
            outline: none;
        }
        #body{
            margin-top: 50px;
            margin-bottom: 50px;
            padding-top: 50px;
            padding-left: 250px;
            padding-right: 300px;
            width: 1000px;
            height: 850px;
            border: 8px solid #BBBBBB;
            background-color: #999999;

        }
        #body>form{
            margin-top: 75px;
        }
        #secondTitle{
            margin-top: 600px;
            font-weight:500;
            font-size:35px;
        }

        #div1{
            border: #999999 solid;
        }
        #footer {
            position: relative;
        }
        .footer-copyright p {
            text-align: center;
            font-size: 14px;
            text-transform: uppercase;
            margin: 0;
        }
        .footer-logo {
            text-align: center;
            margin-bottom: 40px;
        }

        .footer-logo>a>img {
            max-height: 80px;
        }
        .sm-padding {
            padding-top: 60px;
            padding-bottom: 60px;
        }
        .bg-dark {
            background-color: #1C1D21;
        }
        #submitDiv{
            margin-top: 100px;
        }


    </style>
    <script>
        $(function () {
            $(".main-btn").click(function () {
                location.href="#body";
            })
        })
        function init() {
            if (${coursesName == null})
            location.href="${pageContext.request.contextPath}/findCoursesTypeServlet";
            if(${signUp_msg != null}){
                alert("亲爱的，报名出现小意外(请细心检查所填写的信息，感谢理解)，请重新报名。");
                <% request.getSession().removeAttribute("signUp_msg"); %>
            }
        }
    </script>

</head>
<body onload="init()">
    <div id="home">
        <!-- Background Image -->
        <div class="bg-img" style="background-image: url('./img/background1.jpg');">
            <div class="overlay"></div>
        </div>
        <!-- /Background Image -->

        <img  src="img/logo.png" alt="logo">
        <a href="pageContext.request.contextPath}/index.jsp" id="homepage">
            <br>
            <span><b>School's HomePage</b></span>
        </a>
        <!-- home wrapper -->
        <div class="home-wrapper">
            <div class="container">
                <div class="row">

                    <!-- home content -->
                    <div class="col-md-10 col-md-offset-1">
                        <div class="home-content">
                            <h1 class="white-text">Welcome to our Training School</h1>
                            <p class="white-text">有一群优秀的教师，为你的孩子提供最好的学习环境，让你的孩子踩在精英的背上攀登。我们把每一个孩子，当做艺术家来对待，我们的使命是让孩子赢在现在。
                            </p>
                            <button class="main-btn">报名</button>
                        </div>
                    </div>
                    <!-- /home content -->

                </div>
            </div>
        </div>
        <!-- /home wrapper -->
    </div>
    <h2 id="secondTitle" align="center">在这里，我们将为您提供最优质的服务</h2>
    <div id="body" class="container-fluid">
        <h3 align="center" id="thirdtitle"><b>报名表</b></h3>
        <form class="form-horizontal" action="${pageContext.request.contextPath}/signUpServlet" method="post">
            <div class="form-group">
                <label for="inputName3" class="col-sm-2 control-label">姓名</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="inputName3" name="name" readonly="true" value="${user.name}">
                </div>
            </div>
            <div class="form-group">
                <label for="inputTel3" class="col-sm-2 control-label">电话</label>
                <div class="col-sm-10">
                    <input type="tel" class="form-control" id="inputTel3" name="tele" value="${user.account}">
                </div>
            </div>
            <div class="form-group">
                <label for="inputAge3" class="col-sm-2 control-label">年龄</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="inputAge3" name="age" placeholder="age">
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label">性别</label>
                <div class="col-sm-10" id="div1">
                    <input type="radio" name="sex" class="sex" value="男">  男
                    <input type="radio" name="sex" class="sex" value="女">  女
                </div>
            </div>
            <div class="form-group">
                <label for="inputAddress3" class="col-sm-2 control-label">地址</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="inputAddress3" name="address" placeholder="address">
                </div>
            </div>
            <div class="form-group">
                <label for="inputParentName3" class="col-sm-2 control-label">家长姓名</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="inputParentName3" name="parentName" placeholder="parentName">
                </div>
            </div>
            <div class="form-group">
                <label for="inputParentTel3" class="col-sm-2 control-label">家长电话</label>
                <div class="col-sm-10">
                    <input type="tel" class="form-control" id="inputParentTel3" name="parentTele" placeholder="parentTele">
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label">报选科目</label>
                <div class="col-sm-10">
                    <select class="form-control" name="coursesName" >
                        <option><--选择课程--></option>
                        <c:forEach items="${coursesName}" var="coursesType" varStatus="s">
                            <option value="${coursesType}">${coursesType}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <% request.getSession().removeAttribute("coursesName"); %>
            <div id="submitDiv">
                <div align="center">
                    <button type="submit" class="btn btn-default">确认报名</button>
                </div>
            </div>

        </form>
    </div>

    <div id="imgs" align="center" class="container-fluid form-group">
        <div class="col-sm-4">
            <img src="img/about1.jpg" alt="..." height="200px" width=350px" class="img-thumbnail img-study ">
        </div>
        <div class="col-sm-4">
            <img src="img/work1.jpg" alt="..." width="300px" class="img-circle img-study ">
        </div>
        <div class="col-sm-4">
            <img src="img/about2.jpg" alt="..." height="200px" width="350px" class="img-thumbnail img-study ">
        </div>



    </div>

    <div id="footer" class="container-fluid sm-padding bg-dark">
            <!-- Row -->
            <div class="row">

                <div class="col-md-12">

                    <!-- footer logo -->
                    <div class="footer-logo">
                        <img src="img/logo-alt.png" alt="logo">
                    </div>
                    <!-- /footer logo -->
                </div>
                <!-- footer copyright -->
                <div class="footer-copyright">
                    <p>Copyright &copy; 2019.Company name All rights reserved.</p>
                </div>
                <!-- /footer copyright -->

            </div>
            <!-- /Row -->
    </div>

</body>
</html>
