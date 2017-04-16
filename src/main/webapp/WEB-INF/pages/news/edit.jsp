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
        <h3>发布新闻</h3>
        <div class="col-md-12 ">
            <form  id="" class="layui-form" action="${ctx}news/save.html" method="post">
                <input type="hidden" id="id" name="id" value="${entity.id}" />
                <div class="layui-form-item">
                    <label class="layui-form-label">标题</label>
                    <div class="layui-input-block">
                        <input type="text" id="title" name="title" value="${entity.title}" lay-verify="required"  placeholder="标题" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">标题</label>
                    <div class="layui-input-block">
                        <input type="text" id="subTitle" name="subTitle" value="${entity.subTitle}" lay-verify="required" placeholder="副标题" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">新闻内容:</label>
                    <div class="layui-input-block">
                        <textarea id="contents" name="contents" placeholder="新闻内容" lay-verify="required"  class="layui-textarea">${entity.contents}</textarea>
                        <%--<textarea id="contents" name="contents" placeholder="新闻内容" lay-verify="required"  class="layui-textarea">${entity.contents}</textarea>--%>
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
        var layedit = layui.layedit;
        layedit.set({
            uploadImage: {
                url: '${ctx}upload/image.html' //接口url
                ,type: '' //默认post
            }
        });
        layedit.build('contents'); //建立编辑器
        form.on('submit(myform)', function(data){

            return true;
        });

    });

</script>
</body>
</html>
