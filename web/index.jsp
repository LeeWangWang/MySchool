<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/1/5
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  import="java.util.*"%>
<%@ page import="domain.School"%>
<%@ page import="dao.impl.schoolDao" %>
<%@ page import="dao.impl.coursesDao" %>
<%@ page import="domain.Courses" %>
<strong><%@ taglib prefix="c"
                   uri="http://java.sun.com/jsp/jstl/core" %>

  <html>
  <head lang="en">
    <meta charset="utf-8"/>
    <title>学习强国首页</title>
    <link rel="stylesheet" type="text/css" href="css/public.css"/>
    <link rel="stylesheet" type="text/css" href="css/index.css"/>
  </head>
  <body><!------------------------------head------------------------------>
  <div class="head">
    <div class="wrapper clearfix">
      <div class="clearfix" id="top"><h1 class="fl"><a href="index.html"><!--<img src="img/logo.png"/>--></a></h1>
        <div class="fr clearfix" id="top1"><p class="fl"><a href="${pageContext.request.contextPath}/login.jsp" id="login">登录</a><a href="#" id="reg">注册</a>
        </p>
          <form action="#" method="get" class="fl"><input type="text" placeholder="热门搜索：师资力量"/><input
                  type="button"/></form>
          <div class="btn fl clearfix"><a href="mygxin.html"><img src="img/grzx.png"/></a><a href="#" class="er1"><img
                  src="img/ewm.png"/></a><a href="cart.html"><!--<img src="img/gwc.png"/>--></a>
            <p><a href="#"><img src="img/smewm.png"/></a></p></div>
        </div>
      </div>
      <ul class="clearfix" id="bott">
        <li><a href="index.jsp">首页</a>

          <div class="sList2">
            <div class="clearfix"><a href="#school">学校简介</a></div>
          </div>
        </li>
        <li><a href="decoration.jsp">名师介绍</a>
          <div class="sList">
            <div class="wrapper  clearfix"><a href="decoration.jsp">
              <dl>
                <dt><img src="img/nav1.jpg"/></dt>
                <dd>张老师</dd>
              </dl>
            </a><a href="decoration.jsp">
              <dl>
                <dt><img src="img/nav2.jpg"/></dt>
                <dd>刘老师</dd>
              </dl>
            </a><a href="decoration.jsp">
              <dl>
                <dt><img src="img/nav3.jpg"/></dt>
                <dd>李老师</dd>
              </dl>
            </a><a href="decoration.jsp">
              <dl>
                <dt><img src="img/nav6.jpg"/></dt>
                <dd>周老师</dd>
              </dl>
            </a><a href="decoration.jsp">
              <dl>
                <dt><img src="img/nav7.jpg"/></dt>
                <dd>穆老师</dd>
              </dl>
            </a></div>
          </div>
        </li>
        <li><a href="#courses">课程体系</a>
          <!--
          <div class="sList2">
              <div class="clearfix"><a href="proList.html">干花花艺</a><a href="vase_proList.html">花瓶花器</a></div>
          </div>
          -->
          <!--
          <div class="title" id="history">History</div>

          <div class="history">
          </div>
          -->
        </li>
        <li><a href="paint.html">中高考咨询</a>
          <div class="sList2">
            <div class="clearfix"><a href="/findAllViewInfoServlet">中考</a><a href="${pageContext.request.contextPath}/collegeServlet?&funcName=findCollegeAttribute">高考</a></div>
          </div>
        </li>
        <li><a href="${pageContext.request.contextPath}/SignUpInterface.jsp">课程报名</a></li>
        <li><a href="${pageContext.request.contextPath}/findVideoByPageServlet">网上课堂</a></li>
        <li><a href="#">就业前景</a></li>
      </ul>
    </div>
  </div>
  </div><!-------------------------banner--------------------------->
  <div class="block_home_slider">
    <div id="home_slider" class="flexslider">
      <ul class="slides">
        <li>
          <div class="slide"><img src="img/banner5.jpg"/></div>
        </li>
        <li>
          <div class="slide"><img src="img/banner4.jpg"/></div>
        </li>
      </ul>
    </div>
  </div><!------------------------------thImg------------------------------>
  <div class="thImg">
    <div class="clearfix"><a href="vase_proList.html"><img src="img/i1.jpg"/></a><a href="proList.html"><img
            src="img/i2.jpg"/></a><a href="#2"><img src="img/i3.jpg" id="school"/></a></div>
  </div><!------------------------------news------------------------------>
  <div class="news">
    <div class="wrapper"><h2><img src="img/ih1.jpg"/></h2>
      <div class="top clearfix"><a href="proDetail.html"><img src="img/n1.jpg"/>
        <p></p></a><a href="proDetail.html"><img src="img/n2.jpg"/>
        <p></p></a><a href="proDetail.html"><img src="img/n3.jpg"/>
        <p></p></a></div>
      <div class="bott clearfix"><a href="proDetail.html"><img src="img/n4.jpg"/>
        <p></p></a><a href="proDetail.html"><img src="img/n5.jpg"/>
        <p></p></a><a href="proDetail.html"><img src="img/n6.jpg"/>
        <p></p></a></div>
      <!--<h2><img src="img/ih2.jpg"/></h2>-->

      <%
        schoolDao schDao = new schoolDao();
        ArrayList<School> list1 = schDao.getAllschool();
        System.out.println(list1.get(0));

      %>
      <%
        School sch =list1.get(0);
        System.out.println("---------------"+sch);
      %>

      <h2>
        <a href=""><%=sch.getName()%></a><br></h2>
      <h3>
        关于我们
      </h3>
      <p>
        <%=sch.getIntroduce()%>
        <br>
      </p>
      <h3>
        地址
      </h3>
      <p>
        <%=sch.getLocation()%>
      </p>



      <!--<div class="flower clearfix tran"><a href="proDetail.html" class="clearfix">
          <dl>
              <dt><span class="abl"></span><img src="img/flo1.jpg"/><span class="abr"></span></dt>
              <dd>【花艺】七头美丽玫瑰仿真花束</dd>
              <dd><span>¥ 79.00</span></dd>
          </dl>
      </a><a href="proDetail.html">
          <dl>
              <dt><span class="abl"></span><img src="img/flo2.jpg"/><span class="abr"></span></dt>
              <dd>【花艺】七头美丽玫瑰仿真花束</dd>
              <dd><span>¥ 79.00</span></dd>
          </dl>
      </a><a href="proDetail.html">
          <dl>
              <dt><span class="abl"></span><img src="img/flo3.jpg"/><span class="abr"></span></dt>
              <dd>【花艺】七头美丽玫瑰仿真花束</dd>
              <dd><span>¥ 79.00</span></dd>
          </dl>
      </a></div>
      <div class="flower clearfix tran"><a href="proDetail.html">
          <dl>
              <dt><span class="abl"></span><img src="img/flo4.jpg"/><span class="abr"></span></dt>
              <dd>【花艺】七头美丽玫瑰仿真花束</dd>
              <dd><span>¥ 79.00</span></dd>
          </dl>
      </a><a href="proDetail.html">
          <dl>
              <dt><span class="abl"></span><img src="img/flo5.jpg"/><span class="abr"></span></dt>
              <dd>【花艺】七头美丽玫瑰仿真花束</dd>
              <dd><span>¥ 79.00</span></dd>
          </dl>
      </a><a href="proDetail.html">
          <dl>
              <dt><span class="abl"></span><img src="img/flo6.jpg"/><span class="abr"></span></dt>
              <dd>【花艺】七头美丽玫瑰仿真花束</dd>
              <dd><span>¥ 79.00</span></dd>
          </dl>
      </a></div>
  </div>-->
    </div><!------------------------------ad------------------------------>
    <%--    <%--%>
    <%--        coursesDao couDao = new coursesDao();--%>
    <%--        ArrayList<courses> list1 = couDao.getAllcourses();--%>

    <%--    %>--%>
    <%--        <%--%>

    <%--            courses cou =list1.get(0);--%>

    <%--        %>--%>
      <%
   //循环显示数据
 //  List<courses> list=(List)request.getAttribute("list"); // 取request里面的对象队列
//    if(list.size()!=0){
//      for(int i=0;i<list.size();i++){
//         pageContext.setAttribute("cou",list.get(i));
           //保存到页面pageContext里面方便下面进行EL表达式调用
     %>
    <a href="#" class="ad"><img
            src="img/ib1.jpg" id="courses"/></a><!------------------------------people------------------------------>
    <div class="people" >
      <div class="wrapper"><h2><img src="img/ih3.jpg"/></h2>
        <div class="pList clearfix tran">
          <%
            coursesDao couDao = new coursesDao();
            ArrayList<Courses> list2 = couDao.getAllcourses();
          %>
          <%
            Courses cou =list2.get(0);

          %>


          <a href="proDetail.html">
            <dl>
              <dt><span class="abl"></span><img src="img/s2.jpg"/><span class="abr"></span></dt>
              <dd><%=cou.getCoursesName()%></dd>
              <dd><span><%=cou.getCoursesStage()%></span></dd>
            </dl>
          </a>
          <%
            Courses cou1 =list2.get(1);
          %>
          <a href="proDetail.html">
            <dl>
              <dt><span class="abl"></span><img src="img/s9.jpg"/><span class="abr"></span></dt>
              <dd><%=cou1.getCoursesName()%></dd>
              <dd><span><%=cou1.getCoursesStage()%></span></dd>
            </dl>
          </a>
          <%
            Courses cou2 =list2.get(2);
          %>
          <a href="proDetail.html">
            <dl>
              <dt><span class="abl"></span><img src="img/s4.jpg"/><span class="abr"></span></dt>
              <dd><%=cou2.getCoursesName()%></dd>
              <dd><span><%=cou2.getCoursesStage()%></span></dd>
            </dl>
          </a>
          <%
            Courses cou3 =list2.get(3);
          %>

          <a href="proDetail.html">
            <dl>
              <dt><span class="abl"></span><img src="img/s5.jpg"/><span class="abr"></span></dt>
              <dd><%=cou3.getCoursesName()%></dd>
              <dd><span><%=cou3.getCoursesStage()%></span></dd>
            </dl>
          </a></div>


        <div class="pList clearfix tran">
          <%
            Courses cou4 =list2.get(4);
          %>

          <a href="proDetail.html">
            <dl>
              <dt><span class="abl"></span><img src="img/s7.jpg"/><span class="abr"></span></dt>
              <dd><%=cou4.getCoursesName()%></dd>
              <dd><span><%=cou4.getCoursesStage()%></span></dd>
            </dl>
          </a>
          <%
            Courses cou5 =list2.get(5);
          %>

          <a href="proDetail.html">
            <dl>
              <dt><span class="abl"></span><img src="img/s4.jpg"/><span class="abr"></span></dt>
              <dd><%=cou5.getCoursesName()%></dd>
              <dd><span><%=cou5.getCoursesStage()%></span></dd>
            </dl>
          </a>
          <%
            Courses cou6 =list2.get(6);
          %>

          <a href="proDetail.html">
            <dl>
              <dt><span class="abl"></span><img src="img/s1.jpg"/><span class="abr"></span></dt>
              <dd><%=cou6.getCoursesName()%></dd>
              <dd><span><%=cou6.getCoursesStage()%></span></dd>
            </dl>
          </a>

          <%
            Courses cou7 =list2.get(7);
          %>
          <a href="proDetail.html">
            <dl>
              <dt><span class="abl"></span><img src="img/s12.jpg"/><span class="abr"></span></dt>
              <dd><%=cou7.getCoursesName()%></dd>
              <dd><span><%=cou7.getCoursesStage()%></span></dd>
            </dl>
          </a></div>
        <div class="pList clearfix tran">


          <%
            Courses cou8 =list2.get(8);
          %>
          <a href="proDetail.html">
            <dl>
              <dt><span class="abl"></span><img src="img/s3.jpg"/><span class="abr"></span></dt>
              <dd><%=cou8.getCoursesName()%></dd>
              <dd><span><%=cou8.getCoursesStage()%></span></dd>
            </dl>
          </a>


          <%
            Courses cou9 =list2.get(9);
          %>
          <a href="proDetail.html">
            <dl>
              <dt><span class="abl"></span><img src="img/s8.jpg"/><span class="abr"></span></dt>
              <dd><%=cou9.getCoursesName()%></dd>
              <dd><span><%=cou9.getCoursesStage()%></span></dd>
            </dl>
          </a>

          <%
            Courses cou10 =list2.get(10);
          %>

          <a href="proDetail.html">
            <dl>
              <dt><span class="abl"></span><img src="img/s10.jpg"/><span class="abr"></span></dt>
              <dd><%=cou10.getCoursesName()%></dd>
              <dd><span><%=cou10.getCoursesStage()%></span></dd>
            </dl>
          </a>
          <%
            Courses cou11 =list2.get(11);
          %>

          <a href="proDetail.html">
            <dl>
              <dt><span class="abl"></span><img src="img/s11.jpg"/><span class="abr"></span></dt>
              <dd><%=cou11.getCoursesName()%></dd>
              <dd><span><%=cou11.getCoursesStage()%></span></dd>
            </dl>
          </a></div>

        <%--                </c:forEach>--%>


        <%--            <%--%>
        <%--                }--%>
        <%--            }else{--%>
        <%--            %>--%>
        <%--            <tr><td colspan="6">数据库中没有数据！</td></tr>--%>
        <%--            <%--%>
        <%--                }--%>
        <%--            %>--%>
      </div>


    </div><!--返回顶部-->

    <!--
    <div class="gotop"><a href="cart.html">
        <dl>
            <dt><img src="img/gt1.png"/></dt>
            <dd>去购<br/>物车</dd>
        </dl>
    </a><a href="#" class="dh">
        <dl>
            <dt><img src="img/gt2.png"/></dt>
            <dd>联系<br/>客服</dd>
        </dl>
    </a><a href="mygxin.html">
        <dl>
            <dt><img src="img/gt3.png"/></dt>
            <dd>个人<br/>中心</dd>
        </dl>
    </a><a href="#" class="toptop" style="display: none">
        <dl>
            <dt><img src="img/gt4.png"/></dt>
            <dd>返回<br/>顶部</dd>
        </dl>
    </a>
        <p>400-800-8200</p></div>-------------------login--------------------------><!--footer-->
    <div class="footer">
      <div class="top">
        <div class="wrapper">
          <div class="clearfix"><a href="#2" class="fl"><img src="img/foot1.png"/></a><span class="fl">VIP</span>
          </div>
          <div class="clearfix"><a href="#2" class="fl"><img src="img/foot2.png"/></a><span class="fl">在线咨询</span>
          </div>
          <div class="clearfix"><a href="#2" class="fl"><img src="img/foot3.png"/></a><span class="fl">边学边赚</span>
          </div>
          <div class="clearfix"><a href="#2" class="fl"><img src="img/foot4.png"/></a><span class="fl">意见反馈</span>
          </div>
        </div>
      </div>

      <p class="dibu">学习强国根据IT方向的线上学习特点，研发人机互动教学系统， 打造领先的学习模式。平台签约了十名大牛联合创办， 每个合伙人再召集几名身边的技术大咖，根据程序员的岗位需求研发精品课程，并将一门学科中所需要的全部学习资料汇总在一起， 且实时更新。选中一门课程即拥有全部的精品学习资源，不需要再找其它资源补充， 按计划学习结束后即可直接从事对应的开发工作。 <br/>
        友情链接： 知识社区 学Java Python开发 三皇垚画室 光伏文库 广东教师资格证报名 澳洲留学 PHP培训 java培训 企业培训 作文培训加盟 少儿英语加盟 合川招聘网 智校云 GO语言培训</p></div>
    <script src="js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/public.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/nav.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/jquery.flexslider-min.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="/jquery/jquery.js"></script>
    <script type="text/javascript" src="js/scrollTop.js">
      /*   $(document).ready(function(){
             $(".title").click(function(){
                 $("div").scrollTop(100);
             });
         });*/
    </script>
    <script type="text/javascript">$(function () {
      $('#home_slider').flexslider({
        animation: 'slide',
        controlNav: true,
        directionNav: true,
        animationLoop: true,
        slideshow: true,
        slideshowSpeed: 2000,
        useCSS: false
      });
    });</script>
  </body>
  </html>