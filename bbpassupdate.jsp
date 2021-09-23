
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import="java.sql.*"%>


        <% try {
             String s = (String)session.getAttribute("uname");
             String newpsw=request.getParameter("t2");

            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blooddonar", "root", "1234");
            Statement st = conn.createStatement();

            int i=st.executeUpdate("update bloodbankdetials set psw='"+newpsw+"' where uname='"+s+"'");
            int j=st.executeUpdate("update user set pswd='"+newpsw+"' where uname='"+s+"'");


            response.sendRedirect("login.jsp");


 } catch (SQLException e) {
     e.printStackTrace();
                   %><%

 } catch (Exception e) {
                   %><%= "other error"%><%
            e.printStackTrace();
        }

                   %>



    </body>
</html>
