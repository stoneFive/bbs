<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/WEB-INF/pages/common/taglib.jsp" %>
    <title>公共设施预约</title>

<style type="text/css">


</style>
</head>
<body style="">

<div class="container" style="margin-bottom: 10px">

    <div class="row" style="margin-top: 20px;">
        <h4>设施预约审批</h4>
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
                    <td><fmt:formatDate value="${entity.returnTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
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

<c:if test="${sessionScope.user_name eq 'admin'}">

    <div class="container" style="margin-bottom: 10px">

        <div class="row" style="margin-top: 20px;">
            <h3>设施预约审批确认</h3>
            <form  id="" class="layui-form" action="${ctx}device/shenpi.html" method="post">
                <input name="id" value="${entity.id}" type="hidden" />
                <div class="layui-form-item">
                    <label class="layui-form-label">审批人:</label>
                    <div class="layui-input-block">
                        <input type="text" id="replayNam" name="replayNam" lay-verify="required" placeholder="标题" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">电话:</label>
                    <div class="layui-input-block">
                        <input type="text" id="rephone" name="rephone" lay-verify="required|phone" placeholder="标题" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">
                        审批</label>
                    <div class="layui-input-inline">
                        <select id="status" name="status" lay-verify="required">
                            <option value="1" selected>通过</option>
                            <option value="2">不通过</option>

                        </select>
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">审批原因:</label>
                    <div class="layui-input-block">
                        <textarea id="replay" name="replay" placeholder="审批原因" lay-verify="required"  class="layui-textarea"></textarea>
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
</c:if>


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
