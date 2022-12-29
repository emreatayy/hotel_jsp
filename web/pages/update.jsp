<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
    if(request.getParameter("submit")!=null)
    {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String pass = request.getParameter("pass");
        String room = request.getParameter("room");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/smart_hotel_room","root","");
        pst = con.prepareStatement("update customers set name = ?,password =?,roomType= ? where id = ?");
        pst.setString(1, name);
        pst.setString(2, pass);
        pst.setString(3, room);
        pst.setString(4, id);
        pst.executeUpdate();        
        %> 
        <script>  
            alert("Record Updateddddd");          
       </script>
    <%            
    }
%>
 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>  
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
                    <form  method="POST"  class="login100-form p-l-55 p-r-55 p-t-178" action="#" >          
                    <%
                    Connection con;
                    PreparedStatement pst;
                    ResultSet rs;
        
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost/smart_hotel_room","root","");
                          
                    String id = request.getParameter("id");
                          
                    pst = con.prepareStatement("select * from customers where id = ?");
                    pst.setString(1, id);
                    rs = pst.executeQuery();
                        
                    while(rs.next()) {
                    %> 
                <span class="login100-form-title">
                    Oda Kayıt
                </span>
                <div class="wrap-input100 validate-input m-b-16 form-group" data-validate="Please enter username">
                    <input class="input100" type="text" name="name" placeholder="Adınız" value="<%= rs.getString("name")%>" id="sname" readonly required />
                    <span class="focus-input100"></span>
                </div>
                <div class="wrap-input100 validate-input form-group" data-validate = "Please enter password">
                    <input class="input100" type="text" placeholder="Fee" name="room" id="fee" value="<%= rs.getString("roomType")%>" required />
                    <span class="focus-input100"></span>
                </div>   
                <div style="display: none">
                    <label class="form-label">pass</label>
                    <input type="text" class="form-control" placeholder="Course" name="pass" value="<%= rs.getString("password")%>" id="course" required />
                </div>  
                <br>   
                <div class="container-login100-form-btn form-group">
                    <input class="login100-form-btn" type="submit" id="submit" value="Kaydet" name="submit"/>
                </div>
                <div class="container-login100-form-btn form-group">
                    <input class="login100-form-btn" type="reset" id="reset" value="reset" name="reset"/>
                </div>
                <div class="flex-col-c p-t-170 p-b-40">
                    <a href="main.jsp?id=<%=id%>" class="txt3">
                        Geri Dön
                    </a>
                </div> 
                <% }  %> 
                    </form>
                </div>
            </div>
        </div>       
    </body>
</html>