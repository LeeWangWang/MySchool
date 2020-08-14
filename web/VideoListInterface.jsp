<%@ page import="domain.VideoPageBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap HelloWorld</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">


    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="js/bootstrap.min.js"></script>
    <style>
        .paddtop{
            padding-top: 10px;
        }

        .jx{
            border-bottom: 2px solid #ffc900;
            padding: 5px;
        }
        .company{
            height: 40px;
            background-color: #ffc900;
            text-align: center;
            line-height:40px ;
            font-size: 8px;
        }
        #l-video{
            width: 280px;
        }
        #pageCode{
            font-size: 10px;
            margin-left: 10px;
        }
        #img-run{
            margin-top: 50px;
            margin-bottom: 100px;
        }
        #hr-couse{
            margin-bottom: 50px;
        }
        #foot-page{
            margin-bottom: 100px;
            margin-top: 30px;
        }
        #list_daohang{
            background: #5bc0de;
        }
    </style>
    <script>
        function init() {
            if(${video_msg != null}){
                alert("亲爱的，请报名后再进行观看哦");
                <% request.getSession().removeAttribute("video_msg"); %>
            }
        }
        window.onload = init();
    </script>
</head>
<body>

<!-- 1.页眉部分-->
<header class="container-fluid" >

    <!--导航栏-->
    <div class="row">
        <nav class="navbar navbar-default">
            <div class="container-fluid" id="list_daohang">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header" >
                    <!-- 定义汉堡按钮 -->
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">首页</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>

    </div>

    <!--轮播图-->
    <div class="row">
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="img/banner1.jpg" alt="...">
                </div>
                <div class="item">
                    <img src="img/banner2.jpg" alt="...">
                </div>
                <div class="item">
                    <img src="img/banner3.jpg" alt="...">
                </div>

            </div>

            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>



    </div>

</header>
<!-- 2.主体部分-->
<div class="container">
    <div class="row" id="img-run">
        <img class="col-md-12" src="img/ib1.jpg" >
    </div>
    <div class="row jx" id="hr-couse">
        <img src="img/icon_5.jpg">
        <span>精选课程</span>
    </div>


        <div class="row paddtop">
            <c:forEach items="${pageBean.list}" var="video" varStatus="s">
                <div class="col-md-4" id="l-video">
                    <div class="thumbnail">
<%--                        <a href="${pageContext.request.contextPath}/VideoInterface.jsp?cousesVideoName=${video.cousesVideoName}&videoPath=${video.videoPath}&teacherName=${video.teacherName}&videoIntroduce=${video.videoIntroduce}">
                            <img width="100%" src="${video.imgPath}">
                        </a>--%>
    <a href="${pageContext.request.contextPath}/isSignUpServlet?cousesVideoName=${video.cousesVideoName}&videoPath=${video.videoPath}&teacherName=${video.teacherName}&videoIntroduce=${video.videoIntroduce}">
        <img width="100%" src="${video.imgPath}">
    </a>
                        <p>${video.cousesVideoName}<br>${video.teacherName}</p>
                    </div>
                </div>
            </c:forEach>
        </div>


    <div align="center" id="foot-page">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <c:if test="${pageBean.currentPage == 1}">
                <li class="disabled">
                    </c:if>
                    <c:if test="${pageBean.currentPage != 1}">
                <li>
                    </c:if>
                    <a href="${pageContext.request.contextPath}/findVideoByPageServlet?currentPage=${pageBean.currentPage - 1}&rows=8" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <c:forEach begin="1" end="${pageBean.tatalPage}" var="i" >
                    <c:if test="${pageBean.currentPage==i}">
                        <li class="active"><a href="${pageContext.request.contextPath}/findVideoByPageServlet?currentPage=${i}&rows=8">${i}</a></li>
                    </c:if>
                    <c:if test="${pageBean.currentPage!=i}">
                        <li><a href="${pageContext.request.contextPath}/findVideoByPageServlet?currentPage=${i}&rows=8">${i}</a></li>
                    </c:if>
                </c:forEach>

                <c:if test="${pageBean.currentPage == pageBean.tatalPage}">
                <li class="disabled">
                    </c:if>
                    <c:if test="${pageBean.currentPage != pageBean.tatalPage}">
                <li>
                    </c:if>
                    <a href="${pageContext.request.contextPath}/findVideoByPageServlet?currentPage=${pageBean.currentPage + 1}&rows=8">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>

                <span id="pageCode">
                    共${pageBean.totalCount}条记录，共${pageBean.tatalPage}页
                </span>

            </ul>
        </nav>
    </div>
</div>
<!-- 3.页脚部分-->
<footer class="container-fluid">
    <div class="row">
        <img src="img/footer_service.png" class="img-responsive">
    </div>
    <div class="row company">
        中国学习强国教育科技股份有限公司 版权所有Copyright 2006-2018, All Rights Reserved 苏ICP备16007882
    </div>

</footer>


</body>
</html>