<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="com.heyi.cloudfarm.bean.Bug"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Map<String,Bug> map = (Map<String,Bug>)request.getAttribute("map");
Boolean flag = (Boolean)request.getAttribute("flag");
String modu = (String)request.getAttribute("modu");
session.getAttribute("");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-cn">
  <head>
    <base href="<%=basePath%>">
    
    <title>BUG-禾翼科技</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
		<link rel="stylesheet"  href="css/style.css">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/common.css" />
        <link rel="stylesheet" type="text/css" href="css/slide.css" />
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="css/flat-ui.min.css" />
        <link rel="stylesheet" type="text/css" href="css/jquery.nouislider.css">	
	<script src="js/jquery.min.js"></script>
	<script language="javascript" type="text/javascript">
				function start(){
					window.location="servlet/ShowServlet?action=query&modu=1";
				}
				var  map = <%=map%>
				var flag = <%=flag%>
				if(map == null){
					if(!flag){
						window.onload=start;
					}
				}
	</script>
	<script type="text/javascript">
				var w,h,className;
				function getSrceenWH(){
					w = $(window).width();
					h = $(window).height();
					$('#dialogBg').width(w).height(h);
				}
				window.onresize = function(){  
					getSrceenWH();
				};
				$(window).resize();  
				
				<%-- var modu = <%=modu%>
				if(null  !=  modu){
						menu_posi();
						alert(" ----"+modu);
				} --%>
				function menu_posi(){
					var o = document.getElementById(modu);
					if(null != o){
						$(".meun-item").removeClass("meun-item-active");
	                    $(o).addClass("meun-item-active");
					}
				}
				
				$(function(){
					getSrceenWH();
					//显示弹框
					$('.bounceIn').click(function(){
						className = $(this).attr('class');
						$('#dialogBg').fadeIn(300);
						$('#dialog').removeAttr('class').addClass('animated '+className+'').fadeIn();
					});
					
					//关闭弹窗
					$('.claseDialogBtn').click(function(){
						$('#dialogBg').fadeOut(300,function(){
							$('#dialog').addClass('bounceOutUp').fadeOut();
						});
					});
					
					//切换左侧栏目
					$(".meun-item").click(function() {
	                    $(".meun-item").removeClass("meun-item-active");
	                    $(this).addClass("meun-item-active");
	                    var id = $(this).attr("id");
	                    window.location="servlet/ShowServlet?action=query&modu="+id;
                	});	
				});

				
	</script>
  </head>
  
  <body>
  				<div id="logoDiv">
                    <p id="logoP" align="center"><img id="logo" src="images/logo.png"><span>禾翼-云耕</span></p>
                </div>
    	<div class="leftMeun" id="leftMeun">
                <div class="meun-item meun-item-active"  id="1">我的</div>
                <div class="meun-item"  id="2">消息</div>
                <div class="meun-item"  id="3">农田监测</div>
                <div class="meun-item"  id="4">田间管理 </div>
                <div class="meun-item"  id="5">工作 </div>
                <div class="meun-item"  id="6">专家圈</div>
    	</div>
    	<!--新建弹窗  -->
    	
		<div id="dialogBg"></div>
		<div id="dialog" class="animated">
			<img class="dialogIco" width="50" height="50" src="images/ico.png" alt="" />
			<div class="dialogTop">
				<a href="javascript:;" class="claseDialogBtn">关闭</a>
			</div>
			<form action="servlet/ShowServlet?action=newBug" method="post" id="editForm">
				<ul class="editInfos">
					<li><label><font color="#ff0000">* </font>操作步骤：<input type="text" name="oper" required value="" class="ipt" maxlength="100" /></label></li>
					<li><label><font color="#ff0000">* </font>问题描述：<input type="text" name="desc" required value="" class="ipt"  maxlength="100"/></label></li>
					<li style="display: inline;">
								<font color="#ff0000" style="margin-left: 100px">* </font>分类模块：
									<select name="modu" >
                                        <option value="1">我的</option>
                                        <option value="2">消息</option>
                                        <option value="3">农田监测</option>
                                        <option value="4">田间管理</option>
                                        <option value="5">工作</option>
                                        <option value="6">专家圈</option>
                                    </select>
                    </li>
                    <li style="display: inline;">
								<font color="#ff0000" style="margin-left: 60px">* </font>严重等级：
									<select name="grade" >
                                        <option value="normal">NORMAL</option>
                                        <option value="serious">SERIOUS</option>
                                    </select>  
                    </li>
					<li><input type="submit" value="确认提交" class="submitBtn" /></li>
				</ul>
			</form>
		</div>
    	    <!-- 右侧具体内容栏目 -->
        <div id="rightContent" style="background-color: #eff3f6;height: 100%">
                <div class="check-div form-inline">
                    <div class="btn">
						<button href="javascript:;" class="bounceIn" style="border: none; width: 100px; height:30px ; margin-top: 20px;background-color: #00A65A;color: #ffffff;font-size: 13px;" >新建</button>
                    </div>
                    <div class="" style="padding-right: 40px;text-align: right;float: right;">
						<input type="text" class=" form-control input-sm">
                        <button class="btn btn-white btn-xs ">查 询 </button>
                    </div>
                </div>
        	  <div class="data-div">
        	  		<div class="row tableHeader">
                        <div class="col-xs-2 " style="width: 10%">
                            	编号
                        </div>
                        <div class="col-xs-1 " style="width: 70%">
                            	问题描述
                        </div>
                        <div class="col-xs-1" style="width: 20%">
                            	是否已修改
                        </div>
                    </div>
                    
                  <div class="tablebody">
                   <%
    						if(null != map && map.size() != 0){
    							Set<Entry<String, Bug>> set = map.entrySet();
	    						for(Entry<String,Bug> kv:set){
	    								String id = kv.getKey();
	    								Bug bug = kv.getValue();
	    			%>
                        <div class="row">
                            <div  style="width: 10%;float: left;padding-left: 10px">
                                <%=id %>
                            </div>
                            <div  style="width: 70%;float: left;">
                                <p style=" overflow: hidden;vertical-align: middle;"><%=bug.getDesc()%></p>
                            </div>
                            <div  style="width: 20%; float: left;padding-top: 15px;padding-left: 30px" >
                            <%
                            	if(bug.isFixed()){
                            %>
                            	<input type="checkbox" checked="checked" />
                            <% 
                            	}
                            %>
                            	<input type="checkbox" />
                            </div>
                        </div>
					<%
	    						}
    						}
    				  %>
                    </div>
    		</div>
        </div>
  </body>
</html>
