<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Whiplash-我的技术社区&lsaquo; 登录</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="/resource/assets/img/logo.png">
    <link href="/resource/assets/css/style1.css" rel='stylesheet' type='text/css' />
</head>
<body background="/resource/assets/img/bg.jpg">
<div class="main">
    <div class="login">
        <h1>博客登录</h1>
        <div class="inset">
            <!--start-main-->
            <form method="post" action="/admin">
                <div>
                    <h2>用户登录</h2>
                    <span><label>用户名</label></span>
                    <span><input type="text" class="textbox" name="username" ></span>
                </div>
                <div>
                    <span><label>密码</label></span>
                    <span><input type="password" class="password" name="password" ></span>
                </div>
                <div class="sign">
                    <input type="submit" value="登录" class="submit" />
                    ${msg}
                </div>
            </form>
        </div>
    </div>
    <!--//end-main-->
</div>




</body>
</html>