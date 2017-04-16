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
        <h3>发布公告</h3>
        <div class="col-md-12 ">
            <form  id="" class="layui-form" action="${ctx}notes/save.html" enctype="" method="post">
                <input type="hidden" id="id" name="id" value="${entity.id}" />
                <input type="hidden" id="fileUrl" name="fileUrl" value="${entity.fileUrl}" />
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
                    <label class="layui-form-label">公告内容:</label>
                    <div class="layui-input-block">
                        <textarea id="contents" name="contents" placeholder="公告内容" lay-verify="required"  class="layui-textarea">${entity.contents}</textarea>
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">附件:</label>
                    <div class="layui-input-block">
                        <input type="file" name="file" lay-ext="zip|rar" lay-type="file" lay-title="文件" class="layui-upload-file"><span>&nbsp;&nbsp;压缩成zip 文件</span>
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
    layui.use(['layer', 'form','laydate','upload'], function(){
        form = layui.form();
        layer = layui.layer;
        layui.upload({
            url: '${ctx}upload/imp.html'
            ,success: function(res){

               var d= res.url; //上传成功返回值，必须为json格式
                $('#fileUrl').val(d);
            }
        });
        form.on('submit(myform)', function(data){

            return true;
        });

    });

</script>
</body>
</html>
