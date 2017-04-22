<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>天津城建</title>
    <%@include file="/WEB-INF/pages/common/taglib.jsp" %>
    <link rel="stylesheet" href="${ctx}resources/css/global.css">

<style type="text/css">

    .more{
        float: right;
        padding:10px 20px;
        margin-right: 20px;
        font-size: 12px;

    }
</style>
</head>
<body style="background-color: #f8f8f8" >

<%@include file="/WEB-INF/pages/common/header.jsp" %>

<div class="container" >

    <%@include file="/WEB-INF/pages/common/sider.jsp" %>
</div>

<div class="container" style="margin-top: 30px;margin-bottom: 5px;height: 350px">
    <div class="row" style="background-color: #ffffff">
        <div class="col-md-8" >

            <div class="layui-tab layui-tab-brief">
                <ul class="layui-tab-title ">
                    <li class="layui-this"><h3>最新公告</h3></li>
                    <li><h3>最新新闻</h3></li>

                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <ul class="fly-list">
                            <li class="fly-list-li" style="padding-left: 15px">

                                <p>
                                    <span><a href="user/home.html">我校召开2017届毕业生就业推动会</a></span>
                                    <span></span>
                                    <span class="fly-list-hint">
                                        <i class="iconfont">2017-3-25</i>&nbsp;&nbsp;
                                        <i class="iconfont" title="人气">&#xe60c;</i> 106
                                    </span>
                                </p>
                            </li>
                            <li class="fly-list-li" style="padding-left: 15px">

                                <p>
                                    <span><a href="user/home.html">我校召开2017届毕业生就业推动会</a></span>
                                    <span></span>
                                    <span class="fly-list-hint">
                                          <i class="iconfont">2017-3-25</i>&nbsp;&nbsp;
                                        <i class="iconfont" title="人气">&#xe60c;</i> 106
                                    </span>
                                </p>
                            </li>
                            <li class="fly-list-li" style="padding-left: 15px">

                                <p>
                                    <span><a href="user/home.html">我校召开2017届毕业生就业推动会</a></span>
                                    <span></span>
                                    <span class="fly-list-hint">
                                          <i class="iconfont">2017-3-25</i>&nbsp;&nbsp;
                                        <i class="iconfont" title="人气">&#xe60c;</i> 106
                                    </span>
                                </p>
                            </li>
                           <li> <span class="more"><a href="">更多...</a></span></li>
                        </ul>

                    </div>
                    <div class="layui-tab-item">

                        <ul class="fly-list">
                            <li class="fly-list-li" style="padding-left: 15px">

                                <p>
                                    <span><a href="user/home.html">用户昵称</a></span>
                                    <span>我校召开2017届毕业生就业推动会</span>
                                    <span class="fly-list-hint">
                                        <i class="iconfont" title="人气">&#xe60c;</i> 106
                                    </span>
                                </p>
                            </li>
                        </ul>
                        <li> <span class="more"><a href="">更多...</a></span></li>
                    </div>

                </div>
            </div>
        </div>

        <div class="col-md-4 " >
            <div class="layui-tab layui-tab-brief ">
                <ul class="layui-tab-title">
                    <li class="layui-this"><h3 style="color: #0C0C0C">最新留言</h3></li>

                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">


                        <ul class="fly-list">
                            <li class="fly-list-li" style="padding-left: 15px">

                                <p>
                                    <span><a href="user/home.html">我校召开2017届毕业生就业推动会</a></span>

                                    <span class="fly-list-hint">
                                        <i class="iconfont" title="人气">&#xe60c;</i> 106
                                    </span>
                                </p>
                            </li>
                            <li class="fly-list-li" style="padding-left: 15px">

                                <p>
                                    <span><a href="user/home.html">我校召开2017届毕业生就业推动会</a></span>

                                    <span class="fly-list-hint">
                                        <i class="iconfont" title="人气">&#xe60c;</i> 106
                                    </span>
                                </p>
                            </li>
                            <li class="fly-list-li" style="padding-left: 15px">

                                <p>
                                    <span><a href="user/home.html">我校召开2017届毕业生就业推动会</a></span>

                                    <span class="fly-list-hint">
                                        <i class="iconfont" title="人气">&#xe60c;</i> 106
                                    </span>
                                </p>
                            </li>
                            <li class="fly-list-li" style="padding-left: 15px">

                                <p>
                                    <span><a href="user/home.html">我校召开2017届毕业生就业推动会</a></span>

                                    <span class="fly-list-hint">
                                        <i class="iconfont" title="人气">&#xe60c;</i> 106
                                    </span>
                                </p>
                            </li>
                            <li class="fly-list-li" style="padding-left: 15px">

                                <p>
                                    <span><a href="user/home.html">我校召开2017届毕业生就业推动会</a></span>

                                    <span class="fly-list-hint">
                                        <i class="iconfont" title="人气">&#xe60c;</i> 106
                                    </span>
                                </p>
                            </li>

                            <li> <span class="more"><a href="">更多...</a></span></li>
                        </ul>

                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<!-- 底部 -->


    <%@include file="/WEB-INF/pages/common/footer.jsp" %>
    <script>

    layui.use('element', function(){
        var element = layui.element();


    });

</script>
</body>
</html>
