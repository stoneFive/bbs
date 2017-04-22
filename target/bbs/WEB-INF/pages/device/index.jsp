<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/WEB-INF/pages/common/taglib.jsp" %>
    <title>公共设施预约</title>

<style type="text/css">


</style>
</head>
<body style="">

    <div class="row" style="margin-top: 10px;">
        <h4 style="margin-left: 30px;margin-top: 0px;">公共设施预约</h4>

        <div class="row">
            <form  id="searchFrom" class="layui-form" action="${ctx}device/index.html" method="post">
                <input type="hidden" name="page" id="page" value="${param['page']}">
                <input type="hidden" name="pageSize" id="pageSize" value="${param['pageSize']}">
               <div class="row">
                   <label class="layui-form-label">
                       预约人:</label>
                   <input  name="search_LIKES_borrowName" id="title" value="${param['search_LIKES_borrowName']}" style="width: 200px;">
               </div>

                <div class="layui-form-item">
                    <div class="layui-input-block" style="float: right;padding-right: 45px;">
                        <button id="search" class="layui-btn" type="submit">搜索</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>

        <table class="layui-table" lay-skin="line">
            <colgroup>
                <col width="20%">
                <col width="8%">
                <col width="8%">
                <col width="12%">
                <col width="12%">
                <col width="8%">
                <col width="15%">

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

            <c:forEach items="${page.content}" var="entity">
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

                    <td><button class="layui-btn layui-btn-small" onclick="del(${entity.id})" value="" >删除 </button> &nbsp;
                        <a class="layui-btn layui-btn-small" href="${ctx}device/view/${entity.id}.html"  >详情 </a> &nbsp;
                   </td>

                </tr>
            </c:forEach>


            </tbody>
        </table>

    </div>
    <div id="pages" style="padding-left: 20px;" ></div>



<script type="text/javascript">
    var layer;
    var form
    layui.use(['layer', 'form','laydate','laypage'], function(){
        form = layui.form();
        layer = layui.layer;
        laypage = layui.laypage;

        laypage({
            cont: 'pages',
            pages: '${page.totalPages}',
            skip: true,
            curr:'${page.number+1}',

            jump: function(obj,first){
                if(!first){
                   console.info('第'+ obj.curr +'页'+"  " + obj.pages);
                    $("#page").val(obj.curr);
                    $("#pageSize").val(10);
                    $('#searchFrom').submit();
                }
            }
        });


    });

    function  del(id){
    var path = '${ctx}device/del.html';
        layer.confirm('确认操作？', function(index){
            $.ajax({
                type: "POST",
                url: path,
                data: "id="+id,
                success: function(msg){
                   var d =  $.parseJSON(msg);
                    if(d){
                        window.location.reload()
                    }else{
                        layer.alert("删除失败!", {icon: 2},function(index){
                            layer.close(index);
                        });
                    }
                }
            });
        });

    }
</script>
</body>
</html>
