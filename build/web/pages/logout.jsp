<%-- 
    Document   : logout
    Created on : 29 Ara 2022, 02:23:56
    Author     : rdc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <% session.invalidate(); %>
    <p>Başarılı Bir Şekilde Çıkış Yapıldı.</p>
</body>
</html>
