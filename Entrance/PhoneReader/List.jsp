<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="com.shadt.ebook.service.*"%>
<%@ page language="java" import="com.shadt.ebook.service.impl.*"%>
<%@ page language="java" import="com.shadt.ebook.model.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	String classuuid = request.getParameter("classuuid");
	EbookService es = new EbookServiceImpl();
	ClassificationService cf = new ClassificationServiceImpl();
	Classification classification = cf.getClassification(classuuid);
	List<Ebook> list = es.getAllEbook(classuuid);
%>
<!DOCTYPE html>
<html>
<head>
<title><%=classification.getClassTitle()%>-图书列表</title>
<base href="<%=basePath%>"/>
<meta name="viewport" content="width=device-width, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<div id="viewport">
	<div>
		<b><%=classification.getClassTitle()%></b>
	</div>
	<ul>
	<%for(int i=0;i<list.size();i++){%>
		<li><a href="Entrance/PhoneReader/Ebook.jsp?ebookuuid=<%=list.get(i).getUuid()%>"><b><%=(i+1)%>、<%=list.get(i).getTitle()%></b></a></li>
	<%}%>
	</ul>
</div>
</body>
</html>
