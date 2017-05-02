<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/WEB-INF/pages/common/taglib.jsp" %>

    <title>天津城建</title>
    <link rel="stylesheet" href="http://cdn.bootcss.com/zui/1.6.0/css/zui.min.css">
    <link rel="stylesheet" type="text/css" href="${ctx}resources/css/font/iconfont.css" media="all">
    <link rel="stylesheet" type="text/css" href="${ctx}resources/css/main.css" media="all">

</head>

<body class="bg-color">
<%@include file="/WEB-INF/pages/common/header.jsp" %>
<div class="container-fluid larry-wrapper">

    <div class="row">
        <div class="col-xs-12 col-sm-8 col-md-6 col-md-offset-3 col-sm-offset-2 ">
            <section class="panel panel-padding login-pane">
                <h1 class="head-title">天津城建大学生社团</h1>
                <form id="myform" class="layui-form" action="${ctx}reg.html" method="post">
                    <div class="layui-form-item">
                        <label class="layui-form-label"><i class="iconfont">&#xe672;</i> 帐号</label>
                        <div class="layui-input-block">
                            <input type="text" name="account" required lay-verify="required|account" placeholder="登录帐号(学号)" autocomplete="off" class="layui-input">
                        </div>

                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label"><i class="iconfont">&#xe672;</i> 昵称</label>
                        <div class="layui-input-block">
                            <input type="text" name="nickName" required lay-verify="required" placeholder="昵称" autocomplete="off" class="layui-input">
                        </div>

                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label"><i class="iconfont">&#xe63a;</i> 邮箱</label>
                        <div class="layui-input-block">
                            <input type="text" name="email" required lay-verify="required|email" placeholder="邮箱" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label"><i class="iconfont">&#xe609;</i> 密码</label>
                        <div class="layui-input-block">
                            <input id="pwd" type="password" name="pwd" required lay-verify="required|pwd" placeholder="登录密码" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">确认密码</label>
                        <div class="layui-input-block">
                            <input type="password" name="pwd1" required lay-verify="required|pwd1" placeholder="确认密码"  class="layui-input">
                        </div>
                    </div>


                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button  id=""class="layui-btn" lay-submit lay-filter="myform" >注册</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
            </section>

        </div>
    </div>
</div>

<script type="text/javascript">
    var layer;
    var form
    layui.use(['layer', 'form'], function(){
        form = layui.form();
       layer = layui.layer;
        form.verify({
            account: function(value){
                if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
                    return '用户名不能有特殊字符';
                }
                if(/(^\_)|(\__)|(\_+$)/.test(value)){
                    return '用户名首尾不能出现下划线\'_\'';
                }

            },pwd:function(value){
                if(value.lengh<6 || value.lengh > 10){
                    return"密码最少为6位到10位数字";
                }
            },pwd1:function(value){
               var  w =  $('#pwd').val();
                if(value !== w){
                    return"两次密码不一致！";
                }
            }
        });
        form.on('submit(myform)', function(data){
            var d =  $("#myform").serialize();
            var returnUrl = '${ctx}login.html';
            $.ajax({
                type: "POST",
                url: "${ctx}regsave.html",
                data: d,
                success: function(data){

                    var d =  $.parseJSON(data);
                    console.info(d)
                    var s = d.status;
                    var msg = d.data;
                    console.info("msg :" +msg);
                    if(s==1){
                        layer.alert(msg, {icon: 2},function(index){
                            layer.close(index);
                        });
                    }else{
                        layer.alert(msg, {icon: 1},function(index){
                            layer.close(index);
                            window.location.href=returnUrl;
                        });
                    }
                }
            });
           return false;
        });

    });

</script>
</body>
</html>
