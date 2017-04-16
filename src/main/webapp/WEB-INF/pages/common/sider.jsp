<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div style="margin-top: 80px;"></div>
<div id="myNiceCarousel" class="carousel slide" data-ride="carousel">
    <!-- 圆点指示器 -->
    <ol class="carousel-indicators">
        <li data-target="#myNiceCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myNiceCarousel" data-slide-to="1"></li>
        <li data-target="#myNiceCarousel" data-slide-to="2"></li>
    </ol>

    <!-- 轮播项目 -->
    <div class="carousel-inner">
        <div class="item active">
            <img alt="First slide" src="${ctx}resources/images/1.jpg">
            <div class="carousel-caption">
                <h3>我是第一张幻灯片</h3>
                <p>:)</p>
            </div>
        </div>
        <div class="item">
            <img alt="Second slide" src="${ctx}resources/images/2.jpg">
            <div class="carousel-caption">
                <h3>我是第二张幻灯片</h3>
                <p>0.0</p>
            </div>
        </div>
        <div class="item">
            <img alt="Third slide" src="${ctx}resources/images/3.png">
            <div class="carousel-caption">
                <h3>我是第三张幻灯片</h3>
                <p>最后一张咯~</p>
            </div>
        </div>
    </div>

    <!-- 项目切换按钮 -->
    <a class="left carousel-control" href="#myNiceCarousel" data-slide="prev">
        <span class="icon icon-chevron-left"></span>
    </a>
    <a class="right carousel-control" href="#myNiceCarousel" data-slide="next">
        <span class="icon icon-chevron-right"></span>
    </a>
</div>