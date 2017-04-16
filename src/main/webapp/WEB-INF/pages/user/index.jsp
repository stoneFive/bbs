<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/WEB-INF/pages/common/taglib.jsp" %>
    <title>系统账户</title>

<style type="text/css">


</style>
</head>
<body style="">

    <div class="row" style="margin-top: 10px;">
        <h4 style="margin-left: 30px;margin-top: 0px;">系统用户查询</h4>

        <div class="row">
            <form  id="searchFrom" class="layui-form" action="${ctx}user/index.html" method="post">
                <input type="hidden" name="page" id="page" value="${param['page']}">
                <input type="hidden" name="pageSize" id="pageSize" value="${param['pageSize']}">
               <div class="row">
                   <label class="layui-form-label">
                       帐号:</label>
                   <input  name="search_LIKES_userName" id="title" value="${param['search_LIKES_userName']}" style="width: 200px;">
               </div>

                <div class="layui-form-item">
                    <div class="layui-input-block" style="float: right;padding-right: 45px;">
                        <button id="search" class="layui-btn" type="submit">搜索</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>

        <div class="row">
            <div class="col-md-8 col-sm-offset-1">
                <a id="" class="layui-btn"  href="${ctx}user/edit.html">添加</a>
            </div>
        </div>
        <table class="layui-table" lay-skin="line">
            <colgroup>
                <col width="8%">
                <col width="12%">
                <col width="12%">
                <col width="12%">
                <col width="12%">
                <col width="12%">
                <col width="20%">
            </colgroup>
            <thead>
            <tr>
                <th>ID</th>
                <th>账户</th>
                <th>昵称</th>
                <th>密码</th>
                <th>邮箱</th>
                <th>注册时间</th>
                <th>&nbsp;</th>
            </tr>
            </thead>
                <tbody>
                    <c:forEach items="${page.content}" var="entity">
                        <tr>
                            <td>${entity.id}</td>
                            <td>${entity.userName}</td>
                            <td>${entity.nickName}</td>
                            <td>${entity.password}</td>
                            <td>${entity.email}</td>
                            <td><fmt:formatDate value="${entity.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                            <td>
                                <c:if test="${entity.userName != 'admin'}">
                                    <button class="layui-btn layui-btn-small" onclick="del(${entity.id})" value="" >删除 </button>
                                </c:if>
                                <a class="layui-btn layui-btn-small" href="${ctx}user/topwd.html" >修改密码 </a>
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
    var path = '${ctx}user/del.html';
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
