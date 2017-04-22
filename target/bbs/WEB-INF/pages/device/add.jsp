<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/WEB-INF/pages/common/taglib.jsp" %>
    <title>公共设施预约</title>

<style type="text/css">


</style>
</head>
<body style="margin-top: 80px;">
<%@include file="/WEB-INF/pages/common/header.jsp" %>
<div class="container" style="margin-bottom: 10px">

    <div class="row" style="margin-top: 20px;">
        <h1>设施预约</h1>
        <div class="col-md-12 ">
            <form  id="" class="layui-form" action="${ctx}device/add.html" method="post">
                <div class="layui-form-item">
                    <label class="layui-form-label">标题</label>
                    <div class="layui-input-block">
                        <input type="text" id="title" name="title" lay-verify="required" placeholder="标题" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">预约人:</label>
                    <div class="layui-input-block">
                        <input type="text" id="borrowName" name="borrowName" lay-verify="required" placeholder="预约人" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">联系方式:</label>
                    <div class="layui-input-block">
                        <input type="text" name="phone"  id= "phone" lay-verify="required|phone" placeholder="联系方式" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">地址:</label>
                    <div class="layui-input-block">
                        <input type="text" name="address"  id="address" lay-verify="required" placeholder="地址" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">

                        <label class="layui-form-label">开始时间:</label>
                        <div class="layui-input-inline" style="margin-left: 10px;">
                            <input type="text" name="borrowTime" id="start" lay-verify="required" placeholder="" autocomplete="off" class="layui-input" onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
                        </div>


                        <label class="layui-form-label">结束时间:</label>
                        <div class="layui-input-inline" style="margin-left: 10px;">
                            <input type="text" name="returnTime" id="end" lay-verify="required" placeholder="" autocomplete="off" class="layui-input" onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
                        </div>

                </div>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">预约详情:</label>
                    <div class="layui-input-block">
                        <textarea id="comments" name="comments" placeholder="预约内容" lay-verify="required"  class="layui-textarea"></textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block" style="float: right;padding-right: 45px;">
                        <button class="layui-btn"  lay-submit lay-filter="myform">申请确认</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
                </form>
        </div>

    </div>
    <div class="row" style="margin-top: 20px;">
        <h1 >设施预约结果</h1>
        <div class="col-md-12 ">
            <table class="layui-table" lay-skin="line">
                <colgroup>
                    <col width="20%">
                    <col width="8%">
                    <col width="8%">
                    <col width="12%">
                    <col width="12%">
                    <col width="8%">
                    <col width="8%">

                </colgroup>
                <thead>
                <tr>
                    <th>标题</th>
                    <th>审批人</th>
                    <th>联系方式</th>
                    <th>预约时间</th>
                    <th>开始时间</th>
                    <th>预约结果</th>
                    <th>&nbsp;</th>

                </tr>
                </thead>
                <tbody>

                <c:forEach items="${device}" var="entity">
                    <tr>
                        <td>${entity.title}</td>
                        <td>${entity.replayNam}</td>
                        <td>${entity.rephone}</td>
                        <td><fmt:formatDate value="${entity.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                        <td><fmt:formatDate value="${entity.borrowTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>

                        <td>
                            <c:choose>
                                <c:when test="${entity.status == 0}">
                                    待审批
                                </c:when>
                                <c:when test="${entity.status == 1}">
                                    成功
                                </c:when>
                                <c:when test="${entity.status == 2}">
                                    失败
                                </c:when>
                            </c:choose>

                        <td><a href="${ctx}device/${entity.id}.html">详情</a></td>

                    </tr>
                </c:forEach>


                </tbody>
            </table>
        </div>

    </div>
</div>


<%@include file="/WEB-INF/pages/common/footer.jsp" %>

<script type="text/javascript">
    var layer;
    var form
    layui.use(['layer', 'form','laydate'], function(){
        form = layui.form();
        layer = layui.layer;

        form.on('submit(myform)', function(data){

            return true;
        });

    });

</script>
</body>
</html>
