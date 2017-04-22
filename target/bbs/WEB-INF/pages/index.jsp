<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>天津城建</title>
    <%@include file="/WEB-INF/pages/common/taglib.jsp" %>
   <%-- <script type="text/javascript" src="${ctx}resources/js/cms.js"></script>--%>
</head>
<body>
<!-- 布局容器 -->
<div class="layui-layout layui-layout-admin">
    <!-- 头部 -->
    <div class="layui-header">
        <div class="layui-main">
            <!-- logo -->
            <a href="/" style="color: #c2c2c2; font-size: 18px; line-height: 60px;">天津城建大学社团信息平台</a>
            <!-- 水平导航 -->
            <ul class="layui-nav" style="position: absolute; top: 0; right: 0; background: none;">
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        进入前台
                    </a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        系统管理员
                    </a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;">
                                个人信息
                            </a>
                        </dd>
                        <dd>
                            <a href="javascript:;">
                                修改密码
                            </a>
                        </dd>
                        <dd>
                            <a href="javascript:;">
                                退出登录
                            </a>
                        </dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <!-- 侧边栏 -->
    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree" lay-filter="left-nav" style="border-radius: 0;">
            </ul>
        </div>
    </div>

    <!-- 主体 -->
    <div class="layui-body">
        <!-- 顶部切换卡 -->
        <div class="layui-tab layui-tab-brief" lay-filter="top-tab" lay-allowClose="true" style="margin: 0;">
            <ul class="layui-tab-title"></ul>
            <div class="layui-tab-content"></div>
        </div>
    </div>

    <!-- 底部 -->
    <div class="layui-footer" style="text-align: center; line-height: 44px;">
        Copyright © 2017  Powered by 天津城建大学社团信息平台
    </div>
</div>


<script type="text/javascript">
    /**
     * 对layui进行全局配置
     */
    layui.config({
        base: '${ctx}resources/js/'
    });

    /**
     * 初始化整个cms骨架
     */
    layui.use(['cms'], function() {
        var cms = layui.cms('left-nav', 'top-tab');

        cms.addNav([
            {id: 1, pid: 0, node: '主页', url: '${ctx}main.html'},
            {id: 2, pid: 0, node: '系统管理', url: ''},
            {id: 3, pid: 0, node: '用户信息管理', url: ''},
            {id: 4, pid: 0, node: '新闻动态管理', url: ''},
            {id: 5, pid: 0, node: '留言板管理', url: ''},
            {id: 6, pid: 0, node: '公共设置管理', url: ''},
            {id: 7, pid: 2, node: '系统用户', url: '${ctx}user/index.html'},
            {id: 8, pid: 2, node: '角色管理', url: ''},
            {id: 9, pid: 2, node: '资源管理', url: ''},
            {id:10, pid: 3, node: '注册用户管理', url: '${ctx}account/list.html'},
            {id:11, pid: 4, node: '社团新闻', url: '${ctx}news/index.html'},
            {id:12, pid: 4, node: '社团动态', url: '${ctx}article/index.html'},
            {id:13, pid: 4, node: '社团公告', url: '${ctx}notes/index.html'},
            {id:12, pid: 5, node: '留言管理', url: '${ctx}topic/all.html'},
            {id:13, pid: 6, node: '公共设施管理', url: '${ctx}device/index.html'},


        ], 0, 'id', 'pid', 'node', 'url');

        cms.bind(60 + 41 + 20 + 44); //头部高度 + 顶部切换卡标题高度 + 顶部切换卡内容padding + 底部高度

        cms.clickLI(0);
    });
</script>
</body>
</html>
