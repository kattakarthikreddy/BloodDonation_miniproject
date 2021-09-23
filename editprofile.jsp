
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
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
        <div id="container">
	<div id="header">
		<div id="logo_w1">Blood Donor</div>
		<div id="logo_w2">Symbiosis</div>
		<div id="header_text">
			<p>Donate Blood, Save Life</p>
			<a href="registration.jsp">Register As Donor!</a>
		</div>
		<ul >
			<li><a href="donorhome.jsp">MyHomePage</a></li>
			<li><a href="aboutblood.jsp">About Blood</a></li>
			<li><a href="searchreg.jsp">Search</a></li>
			<li><a href="bbhome.jsp">BloodBank Details</a></li>
			<li><a href="hospitalhome.jsp">Hospital Details</a></li>
		
			<li><a href="docarticles.jsp">Doctor Articles</a></li>
		</ul>
	</div>
	<div id="content">
		<div id="left">
			<% try {
             String s = (String)session.getAttribute("uname");
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blooddonar", "root", "1234");
            Statement st = conn.createStatement();
            ResultSet r = st.executeQuery("select * from donorprofile where uname='"+s+"'");
            r.next();%>




               
             <form name="f11" method="post" action="updatedetails.jsp" >
            <p><h3>Edit Profile</h3></p>
            <TABLE>
                <TR><TD>E-Mail:</TD><TD><input type="text" name="t4" value="<%=r.getString("email")%>"/></TD></TR>
                <TR><TD>Address:</TD><TD><textarea name="m1" rows="4" cols="30" ><%=r.getString("address")%></textarea></TD></TR>


                <TR><TD>Zip:</TD><TD><input type="text" name="t5" value="<%=r.getString("zip")%>"/></TD></TR>


                <TR><TD>city:</TD><TD><input type="text" name="t8" value="<%=r.getString("district")%>"/></TD><TD></TD></TR>


                <TR><TD> Area:</TD><TD><input type="text" name="t9" value="<%=r.getString("area")%>"/></TD></TR>

                <TR><TD>PhoneNo:</TD><TD><input type="text" name="t10" value="<%=r.getString("phno")%>"/></TD></TR>


            <TR><TD>LastDonationDate:</TD><TD><input type="text" name="t11" value="<%=r.getString("ldd")%>"/></TD></TR>
             <% int status=r.getInt("Availability"); 
                String st2="";
                if(status==0)
                    st2="UnAvailable";
                else
                    st2="Available";
                %>
               <TR><TD>Your Status:</TD><TD><input type="text" name="t12" value="<%=st2%>"/></TD></TR>
            <tr><td>Availability:</td><td><select name="avail">
                <option value="1">Available</option>
                <option value="0">UnAvailable</option>
            </select></td></tr><tr><td height="10"></td></tr>
            <tr><td colspan="2" align="center"> <input type="submit" name="s1" value="update"/></td></tr>
            </TABLE>
           
                   <%

 } catch (SQLException e) {
     e.printStackTrace();
                   %><%

 } catch (Exception e) {
                   %><%= "other error"%><%
            e.printStackTrace();
        }

                   %>



               </form>
			
		</div>

		<div id="right">
            <a href="changepswd.jsp">Change Password</a>
			
		</div>

		<div id="footerline"></div>
	</div>

	<div id="footer">Copyright � 2019 Blood Donor Symbiosis.  All rights reserved.</div>
</div>
 

        
    </body>
</html>
