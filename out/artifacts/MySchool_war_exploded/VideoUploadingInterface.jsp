<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>上传页面</title>
	<style>
	    *{
	        margin: 0px;
	        padding: 0px;
	        box-sizing: border-box;
	    }
	    body{
	        background: url("./img/beijing.jpg") ;
	        
	    }
		/* 整体 */
	    .rg_layout{
	        width: 900px;
	        height: 500px;
	        border: 8px solid #473e5b;
	        background-color: #3a334c;
	        margin: auto;
			margin-top: 100px;
			padding-top: 20px;
	    }
	    /* 左 */
	    .rg_left{
	        float: left;
	        margin: 15px;
	    }
	    .rg_left > p:first-child{
	        color:#FFD026;
	        font-size: 20px;
	    }
	
	    .rg_left > p:last-child{
	        color:#A6A6A6;
	        font-size: 20px;
	
	    }
	
	    /* 中 */
	    .rg_center{
	        float: left;
			margin-top: 40px;
	
	    }
	    /* 右 */
	    .rg_right{
	        float: right;
	        margin: 15px;
	    }
	
	    .rg_right > p:first-child{
	        font-size: 15px;
	
	    }
	    .rg_right p a {
	        color:pink;
	    }
	    /* 表单头 */
	    .td_left{
	        width: 100px;
	        text-align: right;
	        height: 45px;
	    }
		/* 表单尾 */
	    .td_right{
	        padding-left: 50px ;
	    }
	    /* 表单尾细节 */
	    #cousesVideoName,#teacherName,#videoIntroduce{
	        width: 251px;
	        height: 32px;
	        border: 1px solid #A6A6A6 ;
	        /*设置边框圆角*/
	        border-radius: 5px;
	        padding-left: 10px;
	    }
	    /* 提交按钮 */
	    #btn_sub{
			margin-top: 50px;
	        width: 100px;
	        height: 40px;
	        background-color: #FFD026;
	        border: 1px solid #FFD026 ;
			border-radius: 5px;
		}
		#td_sub{
			padding-left: 180px;
		}
	</style>
	</head>
	<body>
	<div class="rg_layout">
	    <div class="rg_left">
	        <p>课程视频上传</p>
	        <p>VIDEO UPLOADING</p>
	
	    </div>
	
	    <div class="rg_center">
	        <div class="rg_form">
	            <!--定义表单 form-->
	            <form action="${pageContext.request.contextPath}/videoServlet" method="post" enctype="multipart/form-data" id="from">
	                <table>
	                    <tr>
	                        <td class="td_left"><label for="cousesVideoName">课程名</label></td>
	                        <td class="td_right"><input type="text" name="cousesVideoName" id="cousesVideoName" placeholder="请输入视频名称"></td>
	                    </tr>
	
	                    <tr>
	                        <td class="td_left"><label for="teacherName">讲师</label></td>
	                        <td class="td_right"><input type="text" name="teacherName" id="teacherName" placeholder="请输入讲师姓名"></td>
	                    </tr>
	
	                    <tr>
	                        <td class="td_left"><label for="videoIntroduce">课程介绍</label></td>
	                        <td class="td_right"><input type="text" name="videoIntroduce" id="videoIntroduce" placeholder="请输入课程介绍"></td>
	                    </tr>
	
	                    <tr>
	                        <td class="td_left"><label for="img">视频封面</label></td>
	                        <td class="td_right"><input type="file" name="img" id="img" placeholder="请选择视频封面"></td>
	                    </tr>
	
	                    <tr>
	                        <td class="td_left"><label for="video">上传视频</label></td>
	                        <td class="td_right"><input type="file" name="video" id="video" placeholder="请选择上传视频"></td>
	                    </tr>

	                    <tr>
	                        <td colspan="2" id="td_sub"><input type="submit" id="btn_sub" value="上传"></td>
	                    </tr>

	                </table>
	
	            </form>
	
	
	        </div>
	
	    </div>
	
	    <div class="rg_right">
	        <p><a href="#">返回主页</a></p>
	    </div>
	
	
	</div>
	
	
	</body>
</html>
