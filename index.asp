<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" />
<meta NAME="copyright" content="北京师范大学珠海分校" />
<meta NAME="Keywords" content="北京师范大学珠海分校" />
<meta NAME="Description" content="北京师范大学珠海分校" />
<title>欢迎使用毕业选题与论文管理系统</title>
</head>
<script>
       var devies = navigator.userAgent.toLowerCase();
           var ipad = devies.match(/ipad/i) == "ipad";
           var iphone = devies.match(/iphone os/i) == "iphone os";
           var midp = devies.match(/midp/i) == "midp";
           var uc7 = devies.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";
           var uc = devies.match(/ucweb/i) == "ucweb";
           var android = devies.match(/android/i) == "android";
           var wince = devies.match(/windows ce/i) == "windows ce";
           var winphone = devies.match(/windows mobile/i) == "windows mobile";
           if (ipad || iphone || midp || uc7 || uc || android || wince || winphone) {
               window.location.href="./login/index1.asp";
           } else {
               window.location.href="./login/index.asp";
           }

 </script>
<body >
</body>

</html>
