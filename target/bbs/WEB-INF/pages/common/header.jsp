<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="header" style="margin-bottom: 20px;">
    <div class="main">
        <a class="logo" href="/" title="天津城建">Fly社区</a>
        <div style="margin-left: 110px;">
            <ul class="layui-nav" lay-filter="">
                <li class="layui-nav-item"><a href="${ctx}index.html">首页</a></li>
                <li class="layui-nav-item"><a href="">社团新闻</a></li>
                <li class="layui-nav-item"><a href="">社团公告</a></li>
                <li class="layui-nav-item"><a href="${ctx}device/toAdd.html">公共设施预约</a></li>

                <li class="layui-nav-item"><a href="${ctx}topic/list.html">留言版</a></li>
                <li class="layui-nav-item"><a href="${ctx}about/index.html">关于我们</a></li>
            </ul>
        </div>

        <div class="nav-user">
            <!-- 未登入状态 -->


            <!-- 登入后的状态 -->

            <c:if test="${ empty  sessionScope.user_name }">

               <span> <a href="${ctx}login.html">登入</a><a href="${ctx}reg.html">注册</a></span>
            </c:if>
            <c:if test="${not empty  sessionScope.user_name   }">
                <span><a href="javascript:void(0)"> 欢迎 : ${sessionScope.user_name }</a></span>
                <span><a href="${ctx}logout.html">退出</a></span>
            </c:if>

        </div>
    </div>
</div>

