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

            <div class="row" style="margin-top: 20px;">

                <div class="col-md-8  col-sm-offset-2">
                    <table class="layui-table" >
                        <colgroup>
                            <col width="20%">
                            <col width="15%">

                        </colgroup>
                        <thead>
                        <th colspan="2">预约详情</th>

                        </thead>
                        <tbody>
                        <tr>
                            <td>标题:</td>
                            <td>${entity.title}</td>
                        </tr>
                        <tr>
                            <td>预约人:</td>
                            <td>${entity.borrowName}</td>
                        </tr>
                        <tr>
                            <td>审批结果:</td>
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
                            </td>
                        </tr>
                        <tr>
                            <td>联系方式:</td>
                            <td>${entity.phone}</td>
                        </tr>
                        <tr>
                            <td> 地址:</td>
                            <td>${entity.address}</td>
                        </tr>
                        <tr>
                            <td> 开始时间:</td>
                            <td><fmt:formatDate value="${entity.borrowTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                        </tr>
                        <tr>
                            <td> 结束时间:</td>
                            <td><fmt:formatDate value="${entity.returnTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                        </tr>
                        <tr>
                            <td> 审批时间:</td>
                            <td><fmt:formatDate value="${entity.updateTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                        </tr>
                        <tr>
                            <td> 预约详情:</td>
                            <td>${entity.comments}</td>
                        </tr>
                        </tbody>
                    </table>
                </div>

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
