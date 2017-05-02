<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>天津城建</title>
    <%@include file="/WEB-INF/pages/common/taglib.jsp" %>
    <link rel="stylesheet" href="${ctx}resources/css/global.css">

<style type="text/css">

    .more{
        float: right;
        padding:10px 20px;
        margin-right: 20px;
        font-size: 12px;

    }
</style>
</head>
<body style="background-color: #f8f8f8" >

<%@include file="/WEB-INF/pages/common/header.jsp" %>

<div class="container" >

    <%@include file="/WEB-INF/pages/common/sider.jsp" %>
</div>

<div class="container" style="margin-top: 30px;margin-bottom: 5px;height: 350px">
    <div class="row" style="background-color: #ffffff">
        <div class="col-md-12" >

            <div class="layui-tab layui-tab-brief">
                <ul class="layui-tab-title ">
                    <li class="layui-this"><h3>社团新闻</h3></li>
                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">

                        <ul class="fly-list">
                            <c:forEach var="news" items="${entitys}">
                                <li class="fly-list-li" style="padding-left: 15px">

                                    <p>
                                        <span><a href="${ctx}news/front/news.html?id=${news.id}">${news.title}</a></span>
                                        <span></span>
                                        <span class="fly-list-hint">
                                            <i class="iconfont"><fmt:formatDate value="${news.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></i>&nbsp;&nbsp;
                                            <i class="iconfont" title="人气">&#xe60c;</i> 16
                                        </span>
                                    </p>
                                </li>
                            </c:forEach>
                        </ul>

                    </div>


                </div>
            </div>
        </div>


    </div>
</div>
<!-- 底部 -->


    <%@include file="/WEB-INF/pages/common/footer.jsp" %>
    <script>

    layui.use('element', function(){
        var element = layui.element();


    });

</script>
</body>
</html>
