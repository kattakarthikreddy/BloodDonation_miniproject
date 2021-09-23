
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import="java.sql.*"%>


        <%

        try {
            String usrname = request.getParameter("t1");
            String psw = request.getParameter("t2");
            session.setAttribute("uname", usrname);

            Class.forName("com.mysql.jdbc.Driver");
            //out.println("Drivers Installed");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blooddonar", "root", "1234");
            Statement st = conn.createStatement();
            String check1 = "none";
            String check2 = "none";
            String check3 = "none";
            ResultSet rs = st.executeQuery("select * from user");
            boolean logName = false;
            while (rs.next()) {
                check1 = rs.getString("uname");
                check2 = rs.getString("pswd");
                check3 = rs.getString("role");

                if (usrname.equals(check1)) {
                    logName = true;
                    break;
                }
            }
            if (logName) {
                if (check2.equals(psw)) {
                    if (check3.equals("doctor"))
                    {
                        
                        response.sendRedirect("doctorstalkreg.jsp");
                    }
                     else if (check3.equals("bb admin"))
                     {
                         response.sendRedirect("bloodbankhome.jsp");
                     }
                     else if (check3.equals("hos admin"))
                     {
                         response.sendRedirect("hoshome.jsp");
                     }
                     else if (check3.equals("donor"))
                     {
                         response.sendRedirect("donorhome.jsp");
                     }
                    else if (check3.equals("admin"))
                     {
                         response.sendRedirect("admin.jsp");
                     }
                else {
                        response.sendRedirect("login.jsp");
                }
                    session.setAttribute("role", check3);
            }

           else {

               // out.println("You Have Entered Wrong Password");
                request.setAttribute("wrongpwd","pwderror");
                   %>
                   <jsp:forward page="login.jsp"/>
 <%
           }
        }

else


    {
                 request.setAttribute("wronguid","uiderror");
        //out.println("Wrong UserName");
        %> <jsp:forward page="login.jsp"/> <%
    }
}

catch

(Exception e) {
e.printStackTrace();
out.println

("Error Occured");
}

        %>








    </body>
</html>
