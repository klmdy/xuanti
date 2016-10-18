
<!--cookie 常用用于识别用户。cookie 是一种服务器留在用户计算机上的小文件。-->
<!--每当同一台计算机通过浏览器请求页面时，这台计算机将会发送 cookie。通过 ASP，您能够创建并取回 cookie 的值。-->

<!--Response.Cookies 命令用于创建 cookie-->



<%
dim numvisits
response.cookies("NumVisits").Expires=date+365
numvisits=request.cookies("NumVisits")

if numvisits="" then
   response.cookies("NumVisits")=1
   response.write("Welcome! This is the first time you are visiting this Web page.")
else
   response.cookies("NumVisits")=numvisits+1
   response.write("You have visited this ")
   response.write("Web page " & numvisits)
   if numvisits=1 then
     response.write " time before!"
   else
     response.write " times before!"
   end if
end if
%>

<%
Response.Cookies("firstname")="Alex"
Response.Cookies("user")("firstname")="John"
Response.Cookies("user")("lastname")="Smith"
Response.Cookies("user")("country")="Norway"
Response.Cookies("user")("age")="25"
%>


<!DOCTYPE html>
<html>
<body>

<%
dim x,y
for each x in Request.Cookies
response.write("<p>")
if Request.Cookies(x).HasKeys then
for each y in Request.Cookies(x)
response.write(x & ":" & y & "=" & Request.Cookies(x)(y))
response.write("<br>")
next
else
Response.Write(x & "=" & Request.Cookies(x) & "<br>")
end if
response.write "</p>"
next
%>

</body>
</html>
