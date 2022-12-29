<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
    String dbname;
    String dbid;
    String dbpassword;
    String name;
    String password;
    
    Connection con;
    PreparedStatement pst;
    ResultSet rs;
    
    String sql = "select * from customers where name=? and password=?";
    
    name = request.getParameter("name");
    password = request.getParameter("password");
    
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/smart_hotel_room","root","");
        pst = con.prepareStatement(sql);
        pst.setString(1, name);
        pst.setString(2, password);
        rs = pst.executeQuery();
        
        if (rs.next()) {
            dbname = rs.getString("name");
            dbpassword = rs.getString("password");
            dbid = rs.getString("id");
            if (name.equals(dbname) && password.equals(dbpassword)) {
                session.setAttribute("name", dbname);
                session.setAttribute("password", dbpassword);
                session.setAttribute("id",dbid);
                response.sendRedirect("main.jsp?id="+dbid);
            }
            rs.close();
            pst.close();
        }
%>       
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Giriş Yap</title>
        <link rel="stylesheet" type="text/css" href="../vendor/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="../fonts/font-awesome-4.7.0/css/font-awesome.min.css" />
	<link rel="stylesheet" type="text/css" href="../vendor/animate/animate.css" />	
	<link rel="stylesheet" type="text/css" href="../vendor/css-hamburgers/hamburgers.min.css" />
	<link rel="stylesheet" type="text/css" href="../vendor/animsition/css/animsition.min.css" />
	<link rel="stylesheet" type="text/css" href="../vendor/select2/select2.min.css" />	
	<link rel="stylesheet" type="text/css" href="../vendor/daterangepicker/daterangepicker.css" />
	<link rel="stylesheet" type="text/css" href="../css/util.css" />
	<link rel="stylesheet" type="text/css" href="../css/main.css" />
    </head>
    <body>
        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <form class="login100-form p-l-55 p-r-55 p-t-178" method="POST">
                        <span class="login100-form-title">
                            Giriş Yap
                        </span>
                        <div class="wrap-input100 validate-input m-b-16 form-group" data-validate="Please enter username">
                            <input class="input100" type="text" name="name" placeholder="Adınız" />
                            <span class="focus-input100"></span>
                        </div>
                        <div class="wrap-input100 validate-input form-group" data-validate = "Please enter password">
                            <input class="input100" type="password" name="password" placeholder="Şifreniz" />
                            <span class="focus-input100"></span>
                        </div>
                        <br>
                        <div class="container-login100-form-btn form-group">
                            <input class="login100-form-btn" type="submit" value="Giriş Yap"/>
                        </div>
                        <div class="flex-col-c p-t-170 p-b-40">
                            <span class="txt1 p-b-9">
                                Hesabın yok mu ?
                            </span>
                            <a href="../index.jsp" class="txt3">
                                Şimdi Kayıt Ol
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>