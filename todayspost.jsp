
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
   try {

       Class.forName("com.mysql.jdbc.Driver");
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blooddonar", "root", "1234");
     Statement st = conn.createStatement();
     String date=request.getParameter("t1");
     String name=request.getParameter("t2");
     String age=request.getParameter("t3");
     String address=request.getParameter("t4");
     String phno=request.getParameter("t5");
     String bg=request.getParameter("t6");
     String units=request.getParameter("t7");

     int i = st.executeUpdate("INSERT INTO todaysreq values('"+date+"','"+name+"','"+age+"','"+address+"','"+phno+"','"+bg+"','"+units+"');");
             %><jsp:forward page="todayspostreg1.jsp" /><%
     }
 	catch (Exception e) {
            e.printStackTrace();
            out.println("Error Occured");
        }

        %>