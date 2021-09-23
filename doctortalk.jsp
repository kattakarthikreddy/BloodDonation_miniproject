
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
 
<%
   try {
      String s = (String)session.getAttribute("uname");
       Class.forName("com.mysql.jdbc.Driver");
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blooddonar", "root", "1234");
     Statement st = conn.createStatement();
      
     String content=request.getParameter("a1");
     String title=request.getParameter("title");
     int i = st.executeUpdate("INSERT INTO doctortalk values('"+s+"','"+title+"','"+content+"');");
             %><jsp:forward page="doctorstalkreg.jsp" /><%
     }
 	catch (Exception e) {
            e.printStackTrace();
            out.println("Error Occured");
        }

        %>