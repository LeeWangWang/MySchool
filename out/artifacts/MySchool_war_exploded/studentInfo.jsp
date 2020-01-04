<%--
  Created by IntelliJ IDEA.
  User: 李旺旺
  DateTime: 2020/1/4 20:17
  Description: 
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>学生信息</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery-2.1.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>

    <div class="container" style="width: 400px"></div>
    <h3 style="text-align: center">学生信息</h3>
    <form action="${pageContext.request.contextPath}/studentServlet?&funcName=updateStudent" method="post">

        <div class="form-group">
            <label for="name">姓名：</label>
            <input type="text" class="form-control" id="name" value="${student.name}"/>
        </div>

        <div class="form-group">
            <label for="tele">电话：</label>
            <input type="text" class="form-control" id="tele" value="${student.tele}"/>
        </div>

        <div class="form-group">
            <label for="age">年龄：</label>
            <input type="text" class="form-control" id="age" value="${student.age}"/>
        </div>

        <div>
            <label>性别</label>
            <c:if test="${student.sex == '男'}">
                <input type="radio" name="gender" value="男" checked/>男
                <input type="radio" name="gender" value="女"/>女
            </c:if>
            <c:if test="${student.sex == '女'}">
                <input type="radio" name="gender" value="男"/>男
                <input type="radio" name="gender" value="女" checked/>女
            </c:if>
        </div>

        <div class="form-group">
            <label for="address">年龄：</label>
            <input type="text" class="form-control" id="address" value="${student.address}"/>
        </div>

        <div class="form-group">
            <label for="parentName">家长姓名：</label>
            <input type="text" class="form-control" id="parentName" value="${student.parentName}"/>
        </div>

        <div class="form-group">
            <label for="parentTele">家长电话：</label>
            <input type="text" class="form-control" id="parentTele" value="${student.parentTele}"/>
        </div>

        <div class="form-group">
            <label for="coursesName">报名课程：</label>
            <input type="text" class="form-control" id="coursesName" value="${student.coursesName}"/>
        </div>

        <div class="form-group" style="text-align: center">
            <input class="btn btn-primary" type="submit" value="提交" />
            <input class="btn btn-default" type="button" value="返回"/>
        </div>

    </form>

</body>
</html>
