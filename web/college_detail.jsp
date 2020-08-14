<%--
  Created by IntelliJ IDEA.
  User: 17712
  Date: 2019/12/31
  Time: 20:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/highcharts.js"></script>
    <title>学校历年录取信息</title>

    <script language="JavaScript">
        $(document).ready(function() {
            var years = document.getElementsByClassName("wen");
            var studentFraction = $("#studentFraction").val();
            var studentWenli = $("#studentWenli").val();
            var yearval = [];
            var collegeWens = [];
            var wens = [];
            var i=0;
            for(i;i<years.length;i++){
                yearval.push(years[i].getAttribute("href").split(',')[0]);
            }
            for(i=0;i<years.length;i++){
                collegeWens.push(Number(years[i].getAttribute("href").split(',')[1]));
            }
            for(i=0;i<years.length;i++){
                wens.push(Number(years[i].getAttribute("href").split(',')[2]));
            }

            var yearsLi = document.getElementsByClassName("li");
            var yearvalLi = [];
            var collegeLis = [];
            var lis = [];
            for(i;i<years.length;i++){
                yearvalLi.push(years[i].getAttribute("href").split(',')[0]);
            }
            for(i=0;i<years.length;i++){
                collegeLis.push(Number(years[i].getAttribute("href").split(',')[1]));
            }
            for(i=0;i<years.length;i++){
                lis.push(Number(years[i].getAttribute("href").split(',')[2]));
            }

            var title = {
                text: '历年高考录取情况以及今年预测'
            };
            var subtitle = {
                text: 'Source: 高考之家(由于山东的高考改革，2016年以前的录取信息不再提供参考'
            };
            var xAxis = {
                categories: yearval
            };
            var yAxis = {
                title: {
                    text: '文科预测'
                },
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            };
            var tooltip = {
                valueSuffix: '分'
            }

            var wensum = eval(wens.join("+"));
            var lisum = eval(lis.join("+"));
            var collegeWenSum = eval(collegeWens.join("+"));
            var collegeLisSum = eval(collegeLis.join("+"));
            var wenave = [];
            var liave = [];
            var collegeWenAve = [];
            var collegeLisAve = [];
            var stuFra=[];
            for(var i=0;i<wens.length;i++){
                wenave.push(Number(wensum)/wens.length)
            }
            for(var i=0;i<lis.length;i++){
                liave.push(Number(lisum)/lis.length)
            }
            for(var i=0;i<collegeWens.length;i++){
                collegeWenAve.push(Number(collegeWenSum)/collegeWens.length)
            }
            for(var i=0;i<collegeLis.length;i++){
                collegeLisAve.push(Number(collegeLisSum)/collegeLis.length)
            }
            for(var i=0;i<collegeLis.length;i++){
                stuFra.push(Number(studentFraction));
            }
            var legend = {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'middle',
                // borderWidth: 0
            };
            if(studentWenli=="文科"&&Number(studentFraction)>0){
                var series =  [
                    {
                        name: '学校录取分数线',
                        data: collegeWens
                    },
                    {
                        name: '高考批次线',
                        data: wens
                    },
                    {
                        name: '今年高考批次线预测',
                        data: wenave
                    },
                    {
                        name: '今年大学录取线预测',
                        data: collegeWenAve
                    },
                    {
                        name: '你的分数所在的状态',
                        data: stuFra
                    },
                ];
            }else{
                var series =  [
                    {
                        name: '学校录取分数线',
                        data: collegeWens
                    },
                    {
                        name: '高考批次线',
                        data: wens
                    },
                    {
                        name: '今年高考批次线预测',
                        data: wenave
                    },
                    {
                        name: '今年大学录取线预测',
                        data: collegeWenAve
                    },
                ];
            }

            var json = {};
            json.title = title;
            json.subtitle = subtitle;
            json.xAxis = xAxis;
            json.yAxis = yAxis;
            json.tooltip = tooltip;
            json.legend = legend;
            json.series = series;
            // alert(json.series[0].data);

            var titleLi = {
                text: '历年高考录取情况以及今年预测'
            };
            var subtitleLi = {
                text: 'Source: 高考之家(由于山东的高考改革，2016年以前的录取信息不再提供参考'
            };
            var xAxisLi = {
                categories: yearvalLi
            };
            var yAxisLi = {
                title: {
                    text: '理科预测'
                },
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            };

            var tooltipLi = {
                valueSuffix: '分'
            }

            var legendLi = {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'middle',
                // borderWidth: 0
            };
            if(studentWenli=="理科"&&Number(studentFraction)>0){
                var seriesLi =  [
                    {
                        name: '学校录取分数线',
                        data: collegeLis
                    },
                    {
                        name: '高考批次线',
                        data: lis
                    },
                    {
                        name: '今年高考批次线预测',
                        data: liave
                    },
                    {
                        name: '今年大学录取线预测',
                        data: collegeLisAve
                    },
                    {
                        name: '你的分数所在的状态',
                        data: stuFra
                    },
                ];
            }else{
                var seriesLi =  [
                    {
                        name: '学校录取分数线',
                        data: collegeLis
                    },
                    {
                        name: '高考批次线',
                        data: lis
                    },
                    {
                        name: '今年高考批次线预测',
                        data: liave
                    },
                    {
                        name: '今年大学录取线预测',
                        data: collegeLisAve
                    },
                ];
            }

            var jsonLi = {};
            jsonLi.title = titleLi;
            jsonLi.subtitle = subtitleLi;
            jsonLi.xAxis = xAxisLi;
            jsonLi.yAxis = yAxisLi;
            jsonLi.tooltip = tooltipLi;
            jsonLi.legend = legendLi;
            jsonLi.series = seriesLi;
            $('#wenyuce').highcharts(json);
            $('#liyuce').highcharts(jsonLi);

            function getCollegeWenAve() {
                return Number(collegeWenSum/wens.length);
            }
            function getCollegeLiAve() {
                return Number(collegeLisSum/lis.length);
            }
            function getYearWenAve() {
                return Number(wensum/wens.length);
            }
            function getYearLiAve() {
                return Number(lisum/lis.length);
            }
            if(studentWenli=='理科'){
                if(Number(studentFraction)>=Number(getCollegeLiAve())){
                    if((Number(studentFraction))-(Number(getCollegeLiAve()))>30)
                    {
                        var list = '报考建议：作为'+studentWenli+'生，你的分数为'+studentFraction+'分，系统根据${requestScope.detailCollege.collegeName}近三年的录取分数和当年的高考批次线以及您填写的分数进行对比中发现：\n' +
                            '                ${requestScope.detailCollege.collegeName}近三年来录取分数线平均为'+getCollegeLiAve()+'分，其中本科批次线平均为'+getYearLiAve()+'分，你的分数高于学校录取分，但建议冲刺更好的学校。';
                        $("#222").html(list);
                    }else{
                        var list = '报考建议：作为'+studentWenli+'生，你的分数为'+studentFraction+'分，系统根据${requestScope.detailCollege.collegeName}近三年的录取分数和当年的高考批次线以及您填写的分数进行对比中发现：\n' +
                            '                ${requestScope.detailCollege.collegeName}近三年来录取分数线平均为'+getCollegeLiAve()+'分，其中本科批次线平均为'+getYearLiAve()+'分，你的分数高于学校录取分，建议报考。';
                        $("#222").html(list);
                    }

                }else{
                    var list = '报考建议：作为'+studentWenli+'生，你的分数为'+studentFraction+'分，系统根据${requestScope.detailCollege.collegeName}近三年的录取分数和当年的高考批次线以及您填写的分数进行对比中发现：\n' +
                        '                ${requestScope.detailCollege.collegeName}近三年来录取分数线平均为'+getCollegeLiAve()+'分，其中本科批次线平均为'+getYearLiAve()+'分，你的分数低于学校录取分，清酌情选择报考。';
                    $("#222").html(list);
                }
            }else{
                if(Number(studentFraction)>=Number(getCollegeWenAve())){
                    if((Number(studentFraction))-Number(getCollegeWenAve())>30){
                        var list = '报考建议：作为'+studentWenli+'生，你的分数为'+studentFraction+'分，系统根据${requestScope.detailCollege.collegeName}近三年的录取分数和当年的高考批次线以及您填写的分数进行对比中发现：\n' +
                            '                ${requestScope.detailCollege.collegeName}近三年来录取分数线平均为'+getCollegeWenAve()+'分，其中本科批次线平均为'+getYearWenAve()+'分，你的分数高于学校录取分，但建议冲刺更好的学校。';
                        $("#222").html(list);
                    }else{
                        var list = '报考建议：作为'+studentWenli+'生，你的分数为'+studentFraction+'分，系统根据${requestScope.detailCollege.collegeName}近三年的录取分数和当年的高考批次线以及您填写的分数进行对比中发现：\n' +
                            '                ${requestScope.detailCollege.collegeName}近三年来录取分数线平均为'+getCollegeWenAve()+'分，其中本科批次线平均为'+getYearWenAve()+'分，你的分数高于学校录取分，建议报考。';
                        $("#222").html(list);
                    }
                }else{
                    var list = '报考建议：作为'+studentWenli+'生，你的分数为'+studentFraction+'分，系统根据${requestScope.detailCollege.collegeName}近三年的录取分数和当年的高考批次线以及您填写的分数进行对比中发现：\n' +
                        '                ${requestScope.detailCollege.collegeName}近三年来录取分数线平均为'+getCollegeWenAve()+'分，其中本科批次线平均为'+getYearWenAve()+'分，你的分数远于学校录取分，请酌情报考。';
                    $("#222").html(list);
                }
            }

        });



    </script>

</head>
<body>

    <div class="row">
        <div class="col-md-6" style="float: left">
            <h2>${requestScope.detailCollege.collegeName}
            </h2>
            <h4>
            <span class="label label-danger">${requestScope.detailCollege.collegeLocation}
            </span>
            </h4>
            <h4>
            <span class="label label-primary">${requestScope.detailCollege.collegeIsDoubleTop=="Y"?'双一流 ':" "}${requestScope.detailCollege.collegeIs985=="Y"?'985 ':' '}${requestScope.detailCollege.collegeIs211=="Y"?'211':' '}${requestScope.detailCollege.collegeIsDoubleTop=="N"&&requestScope.detailCollege.collegeIs985=="N"&&requestScope.detailCollege.collegeIs211=="N"?'普通双非(非985，非211)':' '}
            </span>
            </h4>
            <h4>
            <span class="label label-success">${requestScope.detailCollege.collegeMainType}
            </span>
            </h4>
            <h4>
            <span class="label label-info">${requestScope.detailCollege.collegeStudyType}
            </span>
            </h4>

            <h3>官方网站：<a href="${requestScope.detailCollege.collegeWebsite}">${requestScope.detailCollege.collegeWebsite}</a>
            </h3>
            <h3>更多资料：<a href="https://baike.baidu.com/item/${requestScope.detailCollege.collegeName}">https://baike.baidu.com/item/${requestScope.detailCollege.collegeName}</a>
            </h3>
            <h4>
                <span>${requestScope.detailCollege.collegeIntroduction}
                </span>
            </h4>


        </div>
        <div class="col-md-6">
            <input type="hidden" value="${requestScope.studentWenli}" id="studentWenli">
            <input type="hidden" value="${requestScope.studentFraction}" id="studentFraction">
            <h5 >
                作为${requestScope.studentWenli}生，你的分数为${requestScope.studentFraction}分，在${requestScope.detailCollege.collegeName}的报考中，我们给出以下建议：
            </h5>
            <h4 id="222" href="" style="">
                报考建议：作为${requestScope.studentWenli}生，你的分数为${requestScope.studentFraction}分，系统根据${requestScope.detailCollege.collegeName}近三年的录取分数和当年的高考批次线以及您填写的分数进行对比中发现：
                ${requestScope.detailCollege.collegeName}近三年来录取分数线平均为

            </h4>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6"  style="text-align: center">
            <table style="width: 45%;" border="1" class="table table-bordered table-hover">
                <tr class="info">
                    <th>年份</th>
                    <th>文科学校分数线</th>
                    <th>文科本科线</th>
                </tr>
                <c:forEach items="${requestScope.collegeFractions}" var="collegeFraction" varStatus="s">
                    <tr class="wen" href="${collegeFraction.year.toString()},${collegeFraction.collegeWen.toString()},${collegeFraction.wen.toString()}">
                        <td class="wenYear">${collegeFraction.year.toString()}</td>
                        <td class="wencollege">${collegeFraction.collegeWen.toString()}</td>
                        <td class="wenAll">${collegeFraction.wen.toString()}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div class="col-md-6" style="text-align: center">
            <table style="width: 45%;" border="1" class="table table-bordered table-hover">
                <tr class="info">
                        <%--<th><input type="checkbox" id="firId"></th>--%>
                    <th>年份</th>
                    <th>理科学校分数线</th>
                    <th>理科本科线</th>
                </tr>
                <c:forEach items="${requestScope.collegeFractions}" var="collegeFraction" varStatus="s">
                    <tr class="li" href="${collegeFraction.year.toString()},${collegeFraction.collegeLi.toString()},${collegeFraction.li.toString()}">
                        <td class="liYear">${collegeFraction.year.toString()}</td>
                        <td class="liCollege">${collegeFraction.collegeLi.toString()}</td>
                        <td class="liAll">${collegeFraction.li.toString()}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div class="col-md-6" id="wenyuce" >
        </div>
        <div class="col-md-6" id="liyuce">
        </div>
    </div>



</body>
</html>
