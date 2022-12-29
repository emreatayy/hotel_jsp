<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
 
    if(request.getParameter("submit")!=null)
    {
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/smart_hotel_room","root","");
        pst = con.prepareStatement("insert into customers(name,password,roomType)values(?,?,?)");
        pst.setString(1, name);
        pst.setString(2, password);
        pst.setString(3, "Null");
        pst.executeUpdate();  
        
        %>
    <script>  
        alert("Record Adddeddddd");    
    </script>
    <%            
    }
   %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kayıt Ol</title>
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css" />
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css" />	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css" />
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css" />
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css" />
	<link rel="stylesheet" type="text/css" href="css/util.css" />
	<link rel="stylesheet" type="text/css" href="css/main.css" />
    </head>
    <body>
        <div class="limiter">
            <div class="container-login100">
		<div class="wrap-login100">
                    <form class="login100-form validate-form p-l-55 p-r-55 p-t-178">
			<span class="login100-form-title">
                            Hesap Oluştur
				</span>
                                    <div class="wrap-input100 validate-input m-b-16" data-validate="Please enter username">
					<input class="input100" type="text" name="name" placeholder="Adınız" />
					<span class="focus-input100"></span>
                                    </div>
                                    <div class="wrap-input100 validate-input" data-validate = "Please enter password">
					<input class="input100" type="password" name="password" placeholder="Şifreniz" />
					<span class="focus-input100"></span>
                                    </div>
                                    <br>
                                    <div class="container-login100-form-btn">
                                        <button class="login100-form-btn" name="submit">
                                            Kayıt Ol
					</button>
                                    </div>
                                    <div class="flex-col-c p-t-170 p-b-40">
					<span class="txt1 p-b-9">
                                            Hesabın var mı ?
					</span>
                                            <a href="pages/logIn.jsp" class="txt3">
						Şimdi Giriş Yap
                                            </a>
                                    </div>
                    </form>
		</div>
            </div>
	</div>  
        <div class="col-sm-8">
            <div class="panel-body">
                <table id="tbl-student" class="table table-responsive table-bordered" cellpadding="0" width="100%">
                    <thead>
                        <tr>
                            <th>Customer Name</th>
                            <th>Password</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>        
                            <%
                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/smart_hotel_room","root","");
                                
                                String query = "select * from customers";
                                Statement st = con.createStatement();
                                rs = st.executeQuery(query);
                                
                                while (rs.next()){
                                    String id = rs.getString("id");
                                
                            %>                         
                            <tr>
                                <td> <%=rs.getString("name") %> </td>
                                <td> <%=rs.getString("password") %> </td>
                                <td> <a href="update.jsp?id=<%=id%>"> Edit </a></td>
                                <td> <a href="delete.jsp?id=<%=id%>" target="_parent"> Delete </a></td>
                            </tr>                           
                            <% 
                                } 
                            %>
                        </thead>
                    </table>
                </div>
            </div>              
    </body>
</html>