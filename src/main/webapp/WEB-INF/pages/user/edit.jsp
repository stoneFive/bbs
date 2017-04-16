<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/WEB-INF/pages/common/taglib.jsp" %>
    <title>新闻</title>

    <style type="text/css">


    </style>
</head>
<body style="">

<div class="container" style="margin-bottom: 10px">

    <div class="row" style="margin-top: 20px;">
        <h3>账户添加</h3>
        <div class="col-md-12 ">
            <form  id="" class="layui-form" action="${ctx}user/save.html" method="post">
                <input type="hidden" id="id" name="id" value="${entity.id}" />
                <div class="layui-form-item">
                    <label class="layui-form-label">账户</label>
                    <div class="layui-input-block">
                        <input type="text" id="userName" name="userName" value="${entity.userName}" lay-verify="required"  placeholder="账户" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">昵称</label>
                    <div class="layui-input-block">
                        <input type="text" id="nickName" name="nickName" value="${entity.nickName}" lay-verify="required" placeholder="昵称" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">邮箱</label>
                    <div class="layui-input-block">
                        <input type="text" id="email" name="email" value="${entity.email}" lay-verify="required" placeholder="邮箱" autocomplete="off" class="layui-input">
                    </div>
                </div>


                <div class="layui-form-item">
                    <div class="layui-input-block" style="float: right;padding-right: 45px;">
                        <button class="layui-btn"  lay-submit lay-filter="myform">确认</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>

    </div>

</div>

<script type="text/javascript">
    var layer;
    var form
    layui.use(['layer', 'form','laydate','layedit'], function(){
        form = layui.form();
        layer = layui.layer;

        form.on('submit(myform)', function(data){

            return true;
        });

    });

</script>
</body>
</html>
