<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>beego work</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }
        html {
            height: 100%;
            width: 100%;
        }
        a{
            text-decoration: none;
        }
        body {
            background-image: url(static/img/ripples/bbj.png);
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
            height: 100%;
            text-align: center;
            position: relative;
            width: 100%;
        }
        body:before {
            content: '';
            display: inline-block;
            vertical-align: middle;
            height: 100%;
            width: 100%;
        }
        .main {
            position: absolute;
            left: 50%;
            top: 30%;
            width: 467px;
            height: 370px;
            margin-left: -233.5px;
            color:#FFF;
        }

    </style>

</head>

<body>

<div class="main"><h1>Welcome to Beego!</h1></div>
<script src="static/js/ripples/jquery-2.0.3.min.js"></script>
<script src="static/js/ripples/jquery.ripples.js"></script>
<script>
    $(document).ready(function () {
        $('body').ripples({
            resolution: 512,
            dropRadius: 50, //px
            perturbance: 0.01
        });
    });
</script>

</body>

</html>