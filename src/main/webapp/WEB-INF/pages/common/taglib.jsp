<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
    int port = request.getServerPort();
    String basePath = null;
    if (port==80){
        basePath = request.getScheme()+"://"+request.getServerName()+path+"/";
    }else{
        basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    }

%>
<c:set var="ctx" value="<%=basePath%>"/>

<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="${ctx}favicon.ico">
<link type="text/css" rel="stylesheet" href="${ctx}resources/layui/css/layui.css"/>
<script type="text/javascript" src="${ctx}resources/layui/layui.js"></script>

<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="${ctx}resources/zui-1.5/css/zui.min.css">
<!-- ZUI Javascript 依赖 jQuery -->
<script src="${ctx}resources/zui-1.5/lib/jquery/jquery.js"></script>
<!-- ZUI 标准版压缩后的 JavaScript 文件 -->
<script src="${ctx}resources/zui-1.5/js/zui.min.js"></script>
<script src="${ctx}resources/js/system.js"></script>
<link rel="stylesheet" href="${ctx}resources/css/global.css">
<link rel="stylesheet" type="text/css" href="${ctx}resources/css/font/iconfont.css" media="all">
<input id="ctx" type="hidden" value="${ctx}"/>




