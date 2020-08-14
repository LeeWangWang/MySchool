<%--
  Created by IntelliJ IDEA.
  User: 17712
  Date: 2019/12/31
  Time: 18:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>高考</title>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="js/bootstrap.min.js"></script>

    <script>

        function changeUrl(urls) {
            var alertTh = $("#chooseWenLi option:selected");
            var wenlichoose = alertTh.val();
            var fraction = $("#fraction").val();
            urls = urls+"&studentWenli="+wenlichoose+"&studentFraction="+fraction;
            document.getElementById("schoolDetail").setAttribute("href",urls);

        }
        function getWenli() {
            var alertTh = $("#chooseWenLi option:selected");
            var wenlichoose = alertTh.val();
            return wenlichoose;
        }
        function getFraction() {
            var fraction = $("#fraction").val();
            return fraction;
        }

        function show() {
            var chk_val=[];
            $('input[name = "local"]:checked').each(function () {
                chk_val.push($(this).val());
            });
            for(item in chk_val){
                alert(chk_val[item]);
            }
        }
    </script>

</head>

<body>

<h4>查找大学</h4>
<%--<h4>${requestScope.funJudge}</h4>--%>
<form role="form" action="${pageContext.request.contextPath}/collegeServlet?funcName=dealCollege&keys=selectByCriteria" method="post">
    <div class="form-group">
        <input type="text" name="valuess" class="form-control" style="width: 300px;float: left" id="search" placeholder="请输入想查找的大学">
        <button class="btn btn-default" type="submit">搜索</button>
        <a class="btn btn-success btn-sm" href="${pageContext.request.contextPath}/collegeDealServlet?&funcName=viewCollegeByCollegeId&collegeId=xxx">添加</a>
    </div>
</form>
<%--<button class="btn btn-default" type="button" id="show" onclick="show()">展示</button>--%>

<table border="1" class="table table-bordered table-hover">
    <tr class="info">
        <%--<th><input type="checkbox" id="firId"></th>--%>
        <th>大学名称</th>
        <th>大学地点</th>
        <th>学校头衔</th>
        <th>本科/专科</th>
        <th>学校类别</th>
        <th>操作</th>
    </tr>

    <c:forEach items="${requestScope.pageColleges.list}" var="college" varStatus="s">
        <tr>
            <td> ${college.collegeName}</td>
            <td> <a href="${pageContext.request.contextPath}/collegeServlet?funcName=dealCollege&keys=collegeLocation&valuess=${college.collegeLocation}&collegeLocation=${college.collegeLocation}">${college.collegeLocation}</a></td>
            <td> <a href="${pageContext.request.contextPath}/collegeServlet?funcName=dealCollege&keys=collegeisDoubleTop&valuess=Y&collegeIsDoubleTop=Y">${college.collegeIsDoubleTop=="Y"?'双一流 ':" "}</a>
                <a href="${pageContext.request.contextPath}/collegeServlet?funcName=dealCollege&keys=collegeIs985&valuess=Y&collegeIs985=Y">${college.collegeIs985=="Y"?'985 ':' '}</a>
                <a href="${pageContext.request.contextPath}/collegeServlet?funcName=dealCollege&keys=collegeIs211&valuess=Y&collegeIs211=Y">${college.collegeIs211=="Y"?'211':' '}</a>
                <a href="${pageContext.request.contextPath}/collegeServlet?funcName=dealCollege&keys=collegeIsNormal&valuess=Y&collegeIs211=N&collegeIs985=N&collegeIsDoubleTop=N">${college.collegeIsDoubleTop=="N"&&college.collegeIs985=="N"&&college.collegeIs211=="N"?'普通双非(非985，非211)':' '}</a>
            </td>
            <td> <a href="${pageContext.request.contextPath}/collegeServlet?funcName=dealCollege&keys=collegeMainType&valuess=${college.collegeMainType}&collegeMainType=${college.collegeMainType}">${college.collegeMainType}</a></td>
            <td> <a href="${pageContext.request.contextPath}/collegeServlet?funcName=dealCollege&keys=collegeStudyType&valuess=${college.collegeStudyType}&collegeStudyType=${college.collegeStudyType}">${college.collegeStudyType}</a></td>
            <td><a class="btn btn-success btn-sm" href="${pageContext.request.contextPath}/collegeDealServlet?&funcName=viewCollegeByCollegeId&collegeId=${college.collegeId}">修改</a>&nbsp;
                <a class="btn btn-danger btn-sm" href="${pageContext.request.contextPath}/collegeDealServlet?funcName=deleteCollege&collegeId=${college.collegeId}">删除</a></td>
        </tr>
    </c:forEach>
</table>
<div>
    <nav aria-label="Page navigation">
        <ul class="pagination">
            <c:if test="${pb.currentPage == 1}">
            <li class="disabled">
                </c:if>

                <c:if test="${pb.currentPage != 1}">
            <li>
                </c:if>
                <a href="${pageContext.request.contextPath}/collegeServlet?${requestScope.keys}=${requestScope.valuess}&keys=${requestScope.keys}&valuess=${requestScope.valuess}&funcName=dealCollege&currentPage=${pb.currentPage - 1}&pageSize=10" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>

            <c:forEach begin="1" end="${pb.totalPage}" var="i" >
                <c:if test="${pb.currentPage == i}">
                    <li class="active"><a href="${pageContext.request.contextPath}/collegeServlet?${requestScope.keys}=${requestScope.valuess}&keys=${requestScope.keys}&valuess=${requestScope.valuess}&funcName=dealCollege&currentPage=${i}&pageSize=10">${i}</a></li>
                </c:if>
                <c:if test="${pb.currentPage != i}">
                    <li><a href="${pageContext.request.contextPath}/collegeServlet?${requestScope.keys}=${requestScope.valuess}&keys=${requestScope.keys}&valuess=${requestScope.valuess}&funcName=dealCollege&currentPage=${i}&pageSize=10">${i}</a></li>
                </c:if>
            </c:forEach>
            <li>
                <a href="${pageContext.request.contextPath}/collegeServlet?${requestScope.keys}=${requestScope.valuess}&keys=${requestScope.keys}&valuess=${requestScope.valuess}&funcName=dealCollege&currentPage=${pb.currentPage + 1}&pageSize=10" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
            <span style="font-size: 25px;margin-left: 5px;">
                    共${pb.totalCount}条记录，共${pb.totalPage}页
            </span>

        </ul>
    </nav>
</div>

</body>
</html>
