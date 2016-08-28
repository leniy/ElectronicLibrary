<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="com.shadt.ebook.service.*"%>
<%@ page language="java" import="com.shadt.ebook.service.impl.*"%>
<%@ page language="java" import="com.shadt.ebook.model.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	String ebookuuid = request.getParameter("ebookuuid");
	EbookService es = new EbookServiceImpl(); //书
	Ebook ebook = es.getEbook(ebookuuid);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="page-view-size" content="1280*720" />
<script type="text/javascript" src="PhoneReader/qrcode/jquery.min.js"></script>
<script type="text/javascript" src="PhoneReader/qrcode/jquery.qrcode.min.js"></script>
<style type="text/css">
*{
  margin: 0;
  padding: 0;
}
body{
	background-color: #000000;
}
#viewport{
	position: absolute;
	width: 1280px;
	height: 720px;
	background-image: url(images/EbookInformationBG.png);
}
a{
	color:#000000;
	font-size: 22px;
}
</style>
<script type="text/javascript">
function grabEvent(e) {
	e = e || window.event; //取得事件对象 
	var keyCode = e.which || e.keyCode; //按键值
	switch (keyCode) {		
	case 37://left	
		break;
	case 38: //up
		break;	 
	case 39://RIGHT
		break;
	case 40://DOWN		 
		break;
	case 13: //确认
		window.location.href="Ebook_Chapter.jsp?ebookuuid=<%=ebook.getUuid()%>";
		break;
	case 8:
		return true;
		break;
	}
	//处理键盘
	try {
		e.preventDefault(); //取消默认操作
	} catch (e) {
		
	}
	return 0;
}
document.onirkeypress = grabEvent;
document.onkeydown = grabEvent;
</script>
</head>
<body>
<div id="viewport">
	<div style="text-align:center;border:0px solid red;position:absolute;height:370px;width:280px;left:80px;top:255px;">
		<img alt="" width="280" height="370" src="<%=basePath %><%=ebook.getUrl()%><%=ebook.getOpfUrl()%><%=ebook.getCoverImgUrl()%>">
	</div>
	<div style="text-align:center;border:0px solid red;position:absolute;height:50px;width:280px;left:80px;top:575px;">
		<img alt="" width="280" height="50" src="images/EbookInformationBtn.png">
	</div>
	<div style="color:#000000;text-align:left;font-size:22px;line-height:35px;border:0px solid red;position:absolute;height:35px;width:440px;left:410px;top:270px;">
		<b>书名：<%=ebook.getTitle()%></b>
	</div>
	<div style="color:#000000;text-align:left;font-size:22px;line-height:35px;border:0px solid red;position:absolute;height:35px;width:300px;left:860px;top:270px;">
		<b>作者：<%=ebook.getAuthor()%></b>
	</div>
	<div style="color:#000000;text-align:left;font-size:22px;line-height:35px;border:0px solid red;position:absolute;height:35px;width:440px;left:410px;top:310px;">
		<b>出版社：<%=ebook.getPress()%></b>
	</div>
	<div style="color:#000000;text-align:left;font-size:22px;line-height:35px;border:0px solid red;position:absolute;height:35px;width:300px;left:860px;top:310px;">
		<b>ISBN：<%=ebook.getIsbn()%></b>
	</div>
	<div style="color:#000000;text-align:left;font-size:22px;line-height:35px;border:0px solid red;position:absolute;height:35px;width:400px;left:410px;top:350px;">
		<b>简介：</b>
	</div>
	<div style="color:#000000;text-align:left;font-size:22px;line-height:35px;border:0px solid red;position:absolute;height:220px;width:510px;left:410px;top:390px;">
		<b><%String context = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+ebook.getContext().replaceAll("(\r\n|\r|\n|\n\r)", "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;").replaceAll(" ","&nbsp;"); %><%=context %></b>
	</div>
	<div style="position: absolute;left: 970px;top: 370px;color: #000000;text-align: center;font-size: 22px;line-height: 35px;background-color: rgba(210, 145, 39, 0.52);padding: 20px 5px 5px 5px;border-radius: 10px;">
		<div id="qrcodeCanvas"></div>
		<b>扫描二维码手机阅读</b>
	</div>
	<script>
	jQuery('#qrcodeCanvas').qrcode({
		width:180,
		height:180,
		text	: "http://172.29.0.108:8010/Ebook_stb_sdjn/Entrance/PhoneReader/Ebook.jsp?ebookuuid=<%=ebookuuid%>"
	});
	</script>
</div>
</body>
</html>