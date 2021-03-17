<%-- 
    Document   : Signup
    Created on : 26-Feb-2021, 17:28:37
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="Css/form.css">
        <title>Đăng Ký</title>
    </head>
    <body>
        <div class="main">

            <form action="signup" method="POST" class="form" id="form-1">
                <h3 class="heading">Đăng ký</h3>
                <!--<p class="desc">Cùng nhau học lập trình miễn phí tại F8 ❤️</p>-->

                <!--          <div class="spacer"></div>-->

                <!--          <div class="form-group">
                            <label for="fullname" class="form-label">Tên đầy đủ</label>
                            <input id="fullname" name="fullname" type="text" placeholder="VD: Viết Cường" class="form-control">
                            <span class="form-message"></span>
                          </div>-->
                <div class="form-group">
                    <label for="name" class="form-label">Họ Tên</label>
                    <input id="email" name="name" type="text" placeholder="Nguyễn Văn A..." class="form-control">
                    <span class="form-message"></span>
                </div>
                <div class="form-group">
                    <label for="address" class="form-label">Địa chỉ</label>
                    <input id="email" name="name" type="text" placeholder="Hà Nôi..." class="form-control">
                    <span class="form-message"></span>
                </div>
                <div class="form-group">
                    <label for="phone" class="form-label">Số điện thoại</label>
                    <input id="email" name="phone" type="text" placeholder="0528129662" class="form-control">
                    <span class="form-message"></span>
                </div>
                <!--          <div class="form-group">
                            <label for="name" class="form-label">Họ Tên</label>
                            <input id="email" name="name" type="text" placeholder="Tên của bạn" class="form-control">
                            <span class="form-message"></span>
                          </div>-->
                <div class="form-group">
                    <label for="email" class="form-label">Tên đăng nhập</label>
                    <input id="email" name="email" type="text" placeholder="Tên đăng nhập" class="form-control">
                    <span class="form-message"></span>
                </div>

                <div class="form-group">
                    <label for="password" class="form-label">Mật khẩu</label>
                    <input id="password" name="password" type="password" placeholder="Nhập mật khẩu" class="form-control">
                    <span class="form-message"></span>
                </div>

                <div class="form-group">
                    <label for="password_confirmation" class="form-label">Nhập lại mật khẩu</label>
                    <input id="password_confirmation" name="password_confirmation" placeholder="Nhập lại mật khẩu" type="password" class="form-control">
                    <span class="form-message"></span>
                </div>

                <button class="form-submit" type="submit">Đăng ký</button>
            </form>
        </div>
        <script src="js/validator.js"></script>
        <script>

            Validator({
                form: '#form-1',
                errorSelector: '.form-message',
                rules: [
                    //                  Validator.isRequired('#fullname'),
//                    Validator.isRequired('#email'),
                    Validator.isRequired('#name'),
//                    Validator.isRequired('#address'),
//                    Validator.isRequired('#phone'),
                    //                  Validator.isEmail('#email'),
                    Validator.minLength('#password', 6),
//                    Validator.isRequired('#password_confirmation'),
                    Validator.isConfirmed('#password_confirmation', function () {
                        return document.querySelector('#form-1 #password').value;
                    }, 'Mật khẩu nhập lại không chính xác')
                ],
            })
        </script>
    </body>
</html>