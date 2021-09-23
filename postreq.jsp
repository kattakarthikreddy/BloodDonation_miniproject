<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>

<%
   try {
     
       Class.forName("com.mysql.jdbc.Driver");
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blooddonar", "root", "1234");
     Statement st = conn.createStatement();

     String bg=request.getParameter("t1");
     String units=request.getParameter("t2");
     String phno=request.getParameter("t3");
     String date=request.getParameter("t4");
     int i = st.executeUpdate("INSERT INTO emergencyreq values('"+bg+"','"+units+"','"+phno+"','"+date+"');");
             %><jsp:forward page="homepage.jsp" /><%
     }
 	catch (Exception e) {
            e.printStackTrace();
            out.println("Error Occured");
        }

        %>