<%-- 
    Document   : Login
    Created on : 25-Feb-2021, 22:23:54
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Đăng nhập</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="Css/grid.css">
        <link rel="stylesheet" href="Css/dangnhap.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link rel="stylesheet" href="font\fontawesome-free-5.15.2-web\css\all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">
        <style>
            .header_web-input{
            }
            *{
                padding: 0;
                margin: 0;
                box-sizing: border-box;
                /*background-color: #f1f1f1;*/
            }
            input:focus{
                outline-offset: none !important;
            }
            .sign_in{
                width: 360px;
                min-height: 100px;
                padding: 32px 24px;
                text-align: center;
                background: #fff;
                border-radius: 2px;
                margin: 24px;
                align-self: center;
                box-shadow: 0 2px 5px 0 rgba(51, 62, 73, 0.1);
            }
            .Sign_up{
                background-color: #1F7DDD;
                /* padding: 5px 0px; */
                color: #fff;
                cursor: pointer;
                width: 85%;
                text-align: center;
                text-decoration: none;
                height: 40px;
                /* text-align: center; */
                display: flex;
                align-items: center;
                justify-content: center;
            }
            .wide_sign{
                display: flex;
                justify-content: center;
                min-height: 100vh;
            }
            .main{
                width: 100%;
                min-height: 100vh;
                background-color: #f1f1f1;
                /* margin: 0 auto; */
                margin-top: -47px;
                display: flex;
                align-items: center;
                box-shadow: 0 2px 5px 0 rgb(51 62 73 / 10%);
                justify-content: center;
            }
        </style>
    </head>
    <body>
        <!--    <div class="wide grid wide_sign">-->
        <div class="main">
            <form class="sign_in" action="login" method="post">
                <h1 style="margin-bottom:30px">Đăng nhập</h1>
                <input name="user" type="text" class="header_web-input" placeholder="Tên tài khoản">
                <input name="pass" type="password" class="header_web-input" placeholder="Mật khẩu" value="">
                <div class="form-group form-check">
                    <div class="form-note">
                        <input name="remember" value="1" type="checkbox" class="form-check-input" id="exampleCheck1">
                        <label class="form-check-label" for="exampleCheck1">Nhớ mật khẩu</label>
                    </div>
                    <span class="check_true_false">${mess}</span>
                </div>
                <div class="check_click">
                    <button class="btn btn-success btn-block" type="submit" style="margin-bottom: 15px;height: 40px;"><i class="fas fa-sign-in-alt"></i> Đăng nhập</button>
                    <hr>
                    <a href="Signup.jsp"class="Sign_up">
                        <i class="fas fa-user-plus"></i> Tạo tài khoản
                    </a>
                </div>

            </form>
        </div>
        <!--    </div>-->
    </body>
</html>
