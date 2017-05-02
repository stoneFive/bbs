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
        <div class="col-md-8" >

            <div class="layui-tab layui-tab-brief">
                <ul class="layui-tab-title ">
                    <li class="layui-this"><h3>最新公告</h3></li>
                    <li><h3>最新新闻</h3></li>

                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <ul class="fly-list">
                            <c:forEach var="note" items="${notes}">
                                <li class="fly-list-li" style="padding-left: 15px">

                                    <p>
                                        <span><a href="${ctx}notes/front/notes.html?id=${note.id}">${note.title}</a></span>
                                        <span></span>
                                        <span class="fly-list-hint">
                                            <i class="iconfont"><fmt:formatDate value="${note.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></i>&nbsp;&nbsp;
                                            <i class="iconfont" title="人气">&#xe60c;</i>   ${note.viewCount}
                                        </span>
                                    </p>
                                </li>
                            </c:forEach>

                           <li> <span class="more"><a href="${ctx}notes/front/more.html">更多...</a></span></li>
                        </ul>

                    </div>
                    <div class="layui-tab-item">

                        <ul class="fly-list">
                            <c:forEach var="news" items="${newses}">
                                <li class="fly-list-li" style="padding-left: 15px">

                                    <p>
                                        <span><a href="${ctx}news/front/news.html?id=${news.id}">${news.title}</a></span>
                                        <span></span>
                                        <span class="fly-list-hint">
                                            <i class="iconfont"><fmt:formatDate value="${news.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></i>&nbsp;&nbsp;
                                            <i class="iconfont" title="人气">&#xe60c;</i>  ${news.viewCount}
                                        </span>
                                    </p>
                                </li>
                            </c:forEach>
                        </ul>
                        <li> <span class="more"><a href="${ctx}news/front/more.html">更多...</a></span></li>
                    </div>

                </div>
            </div>
        </div>

        <div class="col-md-4 " >
            <div class="layui-tab layui-tab-brief ">
                <ul class="layui-tab-title">
                    <li class="layui-this"><h3 style="color: #0C0C0C">最新留言</h3></li>

                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">

                        <ul class="fly-list">
                            <c:forEach var="topic" items="${topicList}">
                                <li class="fly-list-li" style="padding-left: 15px">

                                    <p>
                                        <span><a href="#">${fn:substring(topic.commentText, 0, 10)}...</a></span>
                                        <span></span>
                                        <span class="fly-list-hint">
                                            <i class="iconfont"><fmt:formatDate value="${topic.createTime}" pattern="yyyy-MM-dd " /></i>&nbsp;&nbsp;

                                        </span>
                                    </p>
                                </li>
                            </c:forEach>

                            <li> <span class="more"><a href="">更多...</a></span></li>
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
