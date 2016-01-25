/**
 * Created by liang on 2015/12/22.
 */


$(window).load(function () {
    $('.post-module').hover(function () {
        $(this).find('.description').stop().animate({
            height: 'toggle',
            opacity: 'toggle'
        }, 300);
    });
});
/*登录注册静模框*/
$(document).ready(
    function(){
        $('.login-btn').click(function(){

            $(".login-main").fadeToggle(1000);/*显示和隐藏 */
            $(".search-main").hide(1000);/*隐藏 */
            $(".register-main").hide(1000);

        });
        $('.register-btn').click(function(){
            $(".register-main").fadeToggle(1000);;

            $(".login-main").hide(1000);
            $(".search-main").hide(1000);

        });
        $('#search-btn').click(function(){
            $(".search-main").fadeToggle(1000);
            $(".register-main").hide(1000);
            $(".search-btn").hide(1000);
            $(".login-main").hide(1000);

        });
        $('#pw_btn').click(function(){
            $(".password-main").fadeToggle(1000);


        });
        $('#orders-btn').click(function(){
            $(".orders-main").fadeToggle(1000);


        });
        $('.close-btn').click(function(){/*关闭按钮*/
            $(".search-main").hide()
            $(".register-main").hide();
            $(".password-main").hide();
            $(".orders-main").hide()
            $(".login-main").hide();

        });




    }
)