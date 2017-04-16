<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/WEB-INF/pages/common/taglib.jsp" %>
    <title>修改密码</title>

    <style type="text/css">


    </style>
</head>
<body style="">

<div class="container" style="margin-bottom: 10px">

    <div class="row" style="margin-top: 20px;">
        <h3>密码修改</h3>
        <div class="col-md-12 ">
            <form  id="" class="layui-form" action="${ctx}user/resetpwd.html" method="post">

                <div class="layui-form-item">
                    <label class="layui-form-label">旧密码:</label>
                    <div class="layui-input-block">
                        <input type="password" id="pwd" name="pwd" value="${entity.userName}" lay-verify="required"  placeholder="旧密码" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">新密码:</label>
                    <div class="layui-input-block">
                        <input type="password" id="pwd1" name="newpwd" value="${entity.nickName}" lay-verify="required" placeholder="新密码" autocomplete="off" class="layui-input">
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
