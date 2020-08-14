<%--
  Created by IntelliJ IDEA.
  User: 17712
  Date: 2019/12/31
  Time: 20:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/highcharts.js"></script>
        <title>学校信息</title>

    </head>
    <body>
        <div class="larry-personal">
            <header class="larry-personal-tit">
                <span>大学信息</span>
            </header><!-- /header -->
            <div class="row">
                <form role="form" action="${pageContext.request.contextPath}/collegeDealServlet?funcName=changeCollege"  method="post">
                    <div class="col-md-12">
                        <h3 >大学编号</h3>
                        <input type="text" name="collegeId" class="form-control" placeholder="${requestScope.detailCollege.collegeId}" value="${requestScope.detailCollege.collegeId}" style="width: 600px">
                    </div>
                    <div  class="col-md-12">
                        <h3>大学名称</h3>
                        <input type="text" name="collegeName" class="form-control" placeholder="${requestScope.detailCollege.collegeName}" value="${requestScope.detailCollege.collegeName}" style="width: 600px">
                    </div>
                    <div  class="col-md-12">
                        <h3>大学所在地</h3>
                        <input type="text" name="collegeLocation" class="form-control" placeholder="${requestScope.detailCollege.collegeLocation}" value="${requestScope.detailCollege.collegeLocation}" style="width: 600px">
                    </div>
                    <div  class="col-md-12">
                        <h3>大学官网</h3>
                        <input type="text" name="collegeWebsite" class="form-control" placeholder="${requestScope.detailCollege.collegeWebsite}" value="${requestScope.detailCollege.collegeWebsite}" style="width: 600px">
                    </div>
                    <div  class="col-md-12">
                        <h3>是否双一流</h3>
                        <input type="text" name="collegeIsDoubleTop" class="form-control" placeholder="${requestScope.detailCollege.collegeIsDoubleTop}" value="${requestScope.detailCollege.collegeIsDoubleTop}" style="width: 600px">
                        <h3>是否985</h3>
                        <input type="text" name="collegeIs985" class="form-control" placeholder="${requestScope.detailCollege.collegeIs985}" value="${requestScope.detailCollege.collegeIs985}" style="width: 600px">
                        <h3>是否211</h3>
                        <input type="text" name="collegeIs211" class="form-control" placeholder="${requestScope.detailCollege.collegeIs211}" value="${requestScope.detailCollege.collegeIs211}" style="width: 600px">
                    </div>

                    <div class="form-group col-md-3" style="float: left">
                        <h3>普通本科/高职专科</h3>
                        <select id="collegeMainType" class="form-control" name="collegeMainType" style="width: 150px">
                            <option>普通本科</option>
                            <option>高职专科</option>
                        </select>
                    </div>
                    <div class="form-group col-md-3" style="float: left">
                        <h3>学校类型</h3>
                            <select id="collegeStudyType" class="form-control" name="collegeStudyType" style="width: 150px">
                                <option value="综合类">综合类</option>
                                <option value="理工类">理工类</option>
                                <option value="财经类">财经类</option>
                                <option value="师范类">师范类</option>
                                <option value="军事类">军事类</option>
                                <option value="艺术类">艺术类</option>
                                <option value="医药类">医药类</option>
                                <option value="语言类">语言类</option>
                                <option value="艺术类">艺术类</option>
                                <option value="医药类">医药类</option>
                                <option value="语言类">语言类</option>
                            </select>
                    </div>
                    <div class="col-md-12">
                        <h3>大学介绍</h3>
                        <div>
                            <textarea placeholder="${requestScope.detailCollege.collegeIntroduction}" name="collegeIntroduction" value="${requestScope.detailCollege.collegeIntroduction}" class="form-control"  style="width: 600px;height: 300px"></textarea>
                        </div>
                        <br>
                        <button type="submit" class="btn btn-primary btn-lg active">确定</button>
                    </div>

                </form>
            </div>
        </div>
    </body>
</html>
