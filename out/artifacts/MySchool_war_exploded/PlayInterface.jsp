<%@ page import="domain.CousesVideo" %><%--
  Created by IntelliJ IDEA.
  User: 李瑞泉
  Date: 2020/1/2
  Time: 17:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>$Title$</title>
    <style>

        #play-body{
            background: #0f0f0f;
        }

    </style>
</head>
<body id="play-body">
<%--<%
    CousesVideo cousesVideo = (CousesVideo) request.getSession().getAttribute("cousesVideo");
    request.getSession().removeAttribute("cousesVideo");
    String video = cousesVideo.getVideoPath();
    String newUrl = video.replaceAll("\\\\","/");
    cousesVideo.setVideoPath(newUrl);
    System.out.println("++++++++++"+cousesVideo);
    request.getSession().setAttribute("cousesVideo",cousesVideo);

%>--%>
    <%
        request.setCharacterEncoding("utf-8");
        String currentVideoPlayPath = request.getParameter("videoPlayPath");
        System.out.println(currentVideoPlayPath);
        request.getSession().setAttribute("currentVideoPlayPath",currentVideoPlayPath);

    %>
   <%-- <p>${currentCousesVideoName}<br>${currentTeacherName}<br>${currentVideoIntroduce}</p>--%>


    <video width="100%" height="97%" controls>
        <source src="${currentVideoPlayPath}" type="video/mp4">
        您的浏览器不支持 video 标签。
    </video>

    <%
        request.getSession().removeAttribute("currentVideoPlayPath");
    %>
</body>
</html>
