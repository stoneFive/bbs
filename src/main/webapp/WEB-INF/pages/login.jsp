<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/WEB-INF/pages/common/taglib.jsp" %>

    <title>天津城建</title>

    <link rel="stylesheet" type="text/css" href="${ctx}resources/css/main.css" media="all">

</head>

<body class="bg-color">
<%@include file="/WEB-INF/pages/common/header.jsp" %>
<div class="container-fluid larry-wrapper">

    <div class="row">
        <div class="col-xs-12 col-sm-8 col-md-4 col-md-offset-4 col-sm-offset-2 ">
            <section class="panel panel-padding login-pane">
                <h1 class="head-title">天津城建大学生社团</h1>
                <form  id="myform" class="layui-form" action="">
                    <div class="layui-form-item">
                        <label class="layui-form-label"><i class="iconfont">&#xe672;</i> 帐号</label>
                        <div class="layui-input-block">
                            <input id="account" type="text" name="account" required  lay-verify="required" placeholder="登录帐号" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label"><i class="iconfont">&#xe609;</i> 密码</label>
                        <div class="layui-input-block">
                            <input id="pwd" type="password" name="pwd" value="" autocomplete="off" required lay-verify="required" placeholder="登录密码"  class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">

                            账户类型</label>
                        <div class="layui-input-block">
                            <select id="utype" name="utype" lay-verify="required">
                                <option value="0" selected>普通用户</option>
                                <option value="1">系统管理员</option>
                                <option value="2">社团负责人</option>

                            </select>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn" lay-submit lay-filter="myform">登录</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
            </section>

        </div>
    </div>
</div>

<script type="text/javascript">
    if (window.parent !== window.self) {
        window.parent.location=window.self.location;
    }
    var layer;
    var form
    layui.use(['layer', 'form'], function(){
        form = layui.form();
        layer = layui.layer;

        form.on('submit(myform)', function(data){
            var t = $('#utype option:selected').val();

            var d =  $("#myform").serialize();

            $.ajax({
                type: "POST",
                url: "${ctx}lgc.html",
                data: d,
                success: function(data){
                    var d =  $.parseJSON(data);
                    var s = d.status;
                    var msg = d.data;

                    if(s==1){
                        layer.alert(msg, {icon: 2},function(index){
                            layer.close(index);
                        });
                    }else{
                        if(t==0){
                            window.location.href='${ctx}index.html';
                        }else{
                           window.location.href='${ctx}mgr/index.html';
                        }
                    }
                }
            });
            return false;
        });

    });

</script>
</body>
</html>
