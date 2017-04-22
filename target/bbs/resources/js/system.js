/**
 * Created by lance on 2017/3/25.
 */

$(function(){
    fixfooter();
})
/**
 * 解决footer 靠浏览器底部
 */
function  fixfooter(){
    var ch=document.documentElement.clientHeight;
    var vh = window.innerHeight;

    if(ch<vh){
        $('.fix').css({position:'fixed',bottom:'0px'})
    }
    //document.getElementsByTagName("body")[0].style.minHeight=h-80+"px";
}
