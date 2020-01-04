<%--
  Created by IntelliJ IDEA.
  User: 李旺旺
  DateTime: 2020/1/1 20:53
  Description: 
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Main-Home</title>
    <style>
        .list-student {
            text-align: center;
            color: #0c7fd1;
        }
        .list-student a {
            text-decoration: none;
        }
    </style>
</head>
<body>
    <h1 class="list-student"><a href="${pageContext.request.contextPath}/studentServlet?&funcName=findAllStudents">学生信息列表</a></h1>
</body>
</html>



