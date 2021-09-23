
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>editprofile</title>
        <link href="style.css" rel="stylesheet" type="text/css" />
        <style  type="text/css" >
            #pass{
                display:none;

            }
            #pass2{
                display:none;
            }
            #secret{
                display:none;
            }
</style>
    </head>
    <body>
 <%@page import="java.sql.*"%>

<div id="container">
	<div id="header">
		<div id="logo_w1">Blood Donor</div>
		<div id="logo_w2">Symbiosis</div>
		<div id="header_text">
			<p>Donate Blood, Save Life</p>
			<a href="signout.jsp">Signout</a>
		</div>
         <ul >
			<li><a href="changepswd.jsp">Change Password</a></li>
                <li><a href="bloodbankhome.jsp">Back</a></li>
        </ul>
	</div>
    <div id="content">
		<div id="center">


        <% try {
             String s = (String)session.getAttribute("uname");
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blooddonar", "root", "1234");
            Statement st = conn.createStatement();
            ResultSet r = st.executeQuery("select * from bloodbankdetails where uname='"+s+"'");
            r.next();%>



                
            
             <form name="f11" method="post" action="updatebbdetails.jsp" >
            <p><h3>Edit Profile</h3></p>
            <TABLE>
                <TR><TD>E-Mail:</TD><TD><input type="text" name="t4" value="<%=r.getString("email")%>"/></TD></TR>
                <TR><TD>Address:</TD><TD><textarea name="m1" rows="4" cols="30" ><%=r.getString("address")%></textarea></TD></TR>


                <TR><TD>Zip:</TD><TD><input type="text" name="t5" value="<%=r.getString("zip")%>"/></TD></TR>


                <TR><TD>city:</TD><TD><input type="text" name="t8" value="<%=r.getString("district")%>"/></TD><TD></TD></TR>


                <TR><TD> Area:</TD><TD><input type="text" name="t9" value="<%=r.getString("area")%>"/></TD></TR>

                <TR><TD>PhoneNo:</TD><TD><input type="text" name="t10" value="<%=r.getString("phno")%>"/></TD></TR>


            </TABLE>

            
            <input type="submit" name="s1" value="update"/>     </form>
                   <%

 } catch (SQLException e) {
     e.printStackTrace();
                   %><%

 } catch (Exception e) {
                   %><%= "other error"%><%
            e.printStackTrace();
        }

                   %>




               </div>




		<div id="footerline"></div>
	</div>

	<div id="footer">Copyright © 2019 Blood Donor Symbiosis.  All rights reserved.</div>
</div>
  
    </body>
</html>
