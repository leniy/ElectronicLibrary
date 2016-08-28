<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="com.shadt.ebook.service.*"%>
<%@ page language="java" import="com.shadt.ebook.service.impl.*"%>
<%@ page language="java" import="com.shadt.ebook.model.*"%>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
	ClassificationService cf = new ClassificationServiceImpl();
	List<Classification> list = cf.getAllClassification();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0,  user-scalable=no" />
<link href="css/bootstrap.min.css" rel="stylesheet" />
<title>济宁广电智慧图书馆-图书分类</title>
<base href="<%=basePath%>"/>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
</head>
<body>
<ul class="list-unstyled" style="
    font-size: 2em;
    margin-left: 3em;
    margin-top: 2em;
">	<%for(int i=0;i<list.size();i++){%>
		<li><a href="Entrance/PhoneReader/List.jsp?classuuid=<%=list.get(i).getUuid()%>"><%=list.get(i).getClassTitle() %></a></li>
	<%}%>
</ul>
</body>
</html>
