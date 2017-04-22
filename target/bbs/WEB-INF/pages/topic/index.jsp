
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/WEB-INF/pages/common/taglib.jsp" %>
<%--
    <!-- ZUI 标准版压缩后的 CSS 文件 -->
    <link rel="stylesheet" href="http://cdn.bootcss.com/zui/1.5.0/css/zui.min.css">

    <!-- ZUI Javascript 依赖 jQuery -->
    <script src="http://cdn.bootcss.com/zui/1.5.0/lib/jquery/jquery.js"></script>
    <!-- ZUI 标准版压缩后的 JavaScript 文件 -->
    <script src="http://cdn.bootcss.com/zui/1.5.0/js/zui.min.js"></script>--%>
    <title>bbs</title>

    <script type="text/javascript">

        $(function (){
            $('#sbt').click(function(){
                var topic = $('#topic').val();
                $.ajax({
                    type: "POST",
                    url: "${ctx}topic/add.html",
                    data: "topic="+topic,
                    dataType:"json",
                    success: function(msg){
                        console.info("replay : " + msg.success)
                       window.location.reload();
                    }
                });
            })
        })

        var str =  '<form id="textBox" name="textBox" class="form textBox"  method="post" style="margin-top: 10px;">'
                  + '<div class="form-group">'
                  + '<textarea  id="comment" name="comment" class="form-control new-comment-text" rows="2" placeholder="说点什么吧 ..."></textarea>'
                  + '<div class="row">'
                  +'<div class=" offset-md-8 " style="float: right ;margin-top: 10px;margin-right:20px;">'
                  +' <button class="btn btn-primary" type="button" onclick="reply(this)">确定</button>'
                  + '</div  > </div> </div> </form>'

        // 提交评论和回复
        function reply(_this){
            var action = $('#textBox').attr('action');
            console.info("action : " + action);
            var topic = $('#comment').val();
            $.ajax({
                type: "POST",
                url: action,
                data: "topic="+topic,
                dataType:"json",
                success: function(msg){
                    console.info("replay : " + msg.success)
                    window.location.reload();
                }
            });
        }

        // 显示评论文本框
        function discuss(_id,_this){
            var url = $(_this).attr('url');
            console.info("url : " + url);
            var textBox = $('.textBox');
            console.info("text box : " + textBox.length)
            if(textBox.length == 0 ){
                var isShow = $('#'+_id).attr('data')

                    $('#'+_id).append(str);
                    $('#'+_id).attr('data',true);
                $('#textBox').attr('action',url);
            }else {
                $('.textBox').each(function (){

                    var p = $(this).parent();
                    var pid = p.attr('id');
                    console.info( " *** : " +  pid);
                    if(pid !=_id){
                        $(this).remove();
                        $('#'+_id).append(str);
                        $('#'+_id).attr('data',true);
                        $('#textBox').attr('action',url);
                    }else{
                        var isShow = $('#'+_id).attr('data')
                        if(isShow){
                            $('#'+_id ).find('form').remove();
                            $('#'+_id).attr('data','');
                        }else{
                            $('#'+_id).append(str);
                            $('#'+_id).attr('data',true);
                            $('#textBox').attr('action',url);
                        }
                    }
                })

            }

        }


    </script>
</head>
<body>
<%@include file="/WEB-INF/pages/common/header.jsp" %>


<div class="container" style="margin-top: 90px;">
    <div class="comments">
        <footer>
            <div class="reply-form" id="commentReplyForm2">
                <a href="###" class="avatar"><i class="icon-user icon-2x"></i></a>
                <form class="form" id="topicForm" action="${ctx}topic/add.html">
                    <div class="form-group">
                        <textarea id="topic" class="form-control new-comment-text" rows="2" placeholder="说点什么吧 ..."></textarea>
                    </div>
                    <div class="form-group comment-user">
                        <div class="row">
                            <div class="col-md-3">
                                &nbsp;
                            </div>
                            <div class="col-md-7">
                                &nbsp;
                            </div>
                            <div class="col-md-2"><button id="sbt" type="button" class="btn  btn-primary"><i class="icon-comment-alt">&nbsp;给我们留言</i></button></div>
                        </div>
                    </div>
                </form>
            </div>
        </footer>
    </div>

    <div class="comments">

        <header>

            <h3>所有留言</h3>
        </header>

        <section class="comments-list">

            <!--  话题开始-->
            <c:forEach var="topic" items="${topics}">
                <c:set var="commentKey" value="${topic.id }"  />


                <div class="comment" >
                    <a href="###" class="avatar">
                        <i class="icon-user icon-2x"></i>
                    </a>
                    <div class="content" style="margin-right: 155px; ">
                        <div class="pull-right text-muted"><fmt:formatDate value="${topic.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></div>
                        <div><a href="###"><strong>${topic.name}</strong></a></div>
                        <div class="text">${topic.commentText}</div>
                        <div id="p_${topic.id}" class="actions" data="">
                            <a id="" href="javaScript:void(0);" url="${ctx}topic/comment/${topic.id}/add.html" onclick="discuss('p_${topic.id}',this);">评论</a>
                        </div>
                    </div>

                    <div class="comments-list">

                        <!-- 评论开始 -->
                    <c:forEach var="comment" items="${comments[commentKey]}">
                        <c:set var="replyKey" value="${comment.id }"  />
                            <div class="comment">
                                <a href="###" class="avatar">
                                    <i class="icon-user icon-2x"></i>
                                </a>
                                <div class="content" style="margin-right: 155px; ">
                                    <div class="pull-right text-muted"><fmt:formatDate value="${comment.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></div>
                                    <div><a href="###"><strong>${comment.fromName}</strong></a> <span class="text-muted">评论</span> <a href="###">${comment.toName}</a></div>
                                    <div class="text">  ${comment.commentText}</div>
                                    <div  id= 'c_${comment.id}' class="actions" data="">
                                        <a href="javaScript:void(0);" url="${ctx}topic/reply/${comment.id}/add.html" onclick="discuss('c_${comment.id}',this);">回复</a>

                                    </div>
                                </div>

                            <div class="comments-list">

                                <!-- 回复 -->
                                <c:forEach var="reply" items="${replys[replyKey]}">
                                <div class="comment" >
                                    <a href="###" class="avatar">
                                        <i class="icon-user icon-2x"></i>
                                    </a>
                                    <div class="content" style="margin-right: 155px; ">
                                        <div class="pull-right text-muted"><fmt:formatDate value="${reply.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></div>
                                        <div><a href="###"><strong>${reply.fromName}</strong></a> <span class="text-muted">回复</span> <a href="###">${reply.toName}</a></div>
                                        <div class="text"> ${reply.commentText}</div>
                                        <div id="r_${reply.id}" class="actions" data="">
                                            <a href="javaScript:void(0);" url="${ctx}topic/reply/${reply.replyId}/add.html" onclick="discuss('r_${reply.id}',this);">回复</a>
                                        </div>
                                    </div>
                                </div>

                                 </c:forEach>
                                <!-- 回复结束 -->
                            </div>
                        </div>
                         </c:forEach>
                        <!-- 评论结束 -->
                    </div>
                </div>

            </c:forEach>
<!-- 话题结束 -->
        </section>

    </div>
</div>
<%@include file="/WEB-INF/pages/common/footer.jsp" %>
</body>
</html>
