<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/WEB-INF/pages/common/taglib.jsp" %>
    <title>公告详情</title>

<style type="text/css">

    .content p{
        margin-top: 10px;
        text-indent: 2em;
        text-align: left;
        line-height: 30px;
        font-size: 14px;;
    }
</style>
</head>
<body style="margin-top: 80px;">
<%@include file="/WEB-INF/pages/common/header.jsp" %>
<div class="container" style="margin-bottom: 10px;height:auto!important; min-height:450px;  ">

    <div class="row" style="margin-top: 20px;">


            <article class="article">
                <!-- 文章头部 -->
                <header>

                    <h1 class="text-left">&nbsp;&nbsp;&nbsp;${entity.title}</h1>
                    <dl class="dl-inline ">
                        <dt>发表时间 :</dt>
                        <dd>  <fmt:formatDate value="${entity.createTime}" pattern="yyyy-MM-dd HH:mm:ss" />

                        </dd>
                    </dl>
                    <section class="abstract">
                        <p><strong>摘要：</strong>${entity.subTitle}
                            <span style="float:  right;padding-right: 30px;">
                                <c:if test="${not empty entity.fileUrl}">
                                    <a href="${ctx}${entity.fileUrl}">附件下载</a>

                                </c:if>

                            </span>
                        </p>

                    </section>

                </header>
                <!-- 文章正文部分 -->
                <section class="content">
                    <p> ${entity.contents}</p>
                </section>

            </article>


    </div>
</div>


<%@include file="/WEB-INF/pages/common/footer.jsp" %>


</body>
</html>
