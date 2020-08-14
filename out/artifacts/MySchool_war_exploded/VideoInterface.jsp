<!DOCTYPE html>
<html class="no-js" lang="en">
<head>

  <!--- basic page needs
  ================================================== -->
  <meta charset="utf-8">
  <title>Sublime</title>
  <meta name="description" content="">
  <meta name="author" content="">

  <!-- mobile specific metas
  ================================================== -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Java Script
  ================================================== -->
  <script src="js/jquery-3.2.1.min.js"></script>
  <script src="js/plugins.js"></script>
  <script src="js/main.js"></script>
  <script src="js/modernizr.js"></script>
  <!-- CSS
  ================================================== -->
  <link rel="stylesheet" href="css/vendor.css">
  <link rel="stylesheet" href="css/main.css">
  <!-- script
  ================================================== -->




</head>


<body id="top">

<div class="s-header">

  <div class="header-logo">
    <a class="site-logo" href="index.html">
      <img src="images/logo.svg" alt="Homepage">
    </a>
  </div>
</div>
<!-- home
================================================== -->
<%
  response.setContentType("text/html;charset=utf-8");
%>
<section id="home" class="s-home page-hero target-section" data-parallax="scroll" data-image-src="images/hero-bg.jpg" data-natural-width=3000 data-natural-height=2000 data-position-y=center>
  <div class="home-content">

    <div class="row home-content__main">

      <h1>
        ${currentCousesVideoName}
      </h1>

      <h3>
        ${currentVideoIntroduce}
      </h3>

      <div class="home-content__video">
        <a class="video-link" href="${pageContext.request.contextPath}/PlayInterface.jsp?videoPlayPath=${currentVideoPath}" data-lity>
          <span class="video-icon"></span>
          <span class="video-text">Watch Video</span>
        </a>
      </div>
    </div> <!-- end home-content__main -->
    <%
      request.getSession().removeAttribute("currentCousesVideoName");
      request.getSession().removeAttribute("currentVideoPath");
      request.getSession().removeAttribute("currentTeacherName");
      request.getSession().removeAttribute("currentVideoIntroduce");
    %>
  </div> <!-- end home-content -->
</section> <!-- end s-home -->

</body>