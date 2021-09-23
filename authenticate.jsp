<%@page contentType="text/html" pageEncoding="UTF-8"%>


<html>
   <head>
     <%@ page import="java.util.*" %>
   <%@ page import="java.sql.*" %>
   <%@ page import="java.lang.*"%>
<title>authenticate page</title>
   </head>
<body>
<%
	try
		{
          String uname=request.getParameter("t1");

            String pwd=request.getParameter("t2");
            String name=request.getParameter("t5");
              String fathername=request.getParameter("t6");
              String gen=request.getParameter("d1");
              String age=request.getParameter("t7");
              String email=request.getParameter("t4");
              String address=request.getParameter("m1");
              String zip=request.getParameter("t8");
               
              String district=request.getParameter("d4");
              String area=request.getParameter("d5");
              String phno=request.getParameter("t9");
              String bgroup=request.getParameter("d6");

              String ldd=request.getParameter("t10");
              System.out.println("last donation date=="+ldd);
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/blooddonar","root","1234");

            Statement st=conn.createStatement();
         //int i= st.executeUpdate("create table (uname varchar(20),psw varchar(10), name VARCHAR(20),fname VARCHAR(25),gend VARCHAR(10),age INT,email VARCHAR(40),address VARCHAR(250),country VARCHAR(10),state VARCHAR(15),city VARCHAR(10),area VARCHAR(10),zip VARCHAR(10),phno VARCHAR(20),bg VARCHAR(5),ldd varchar(20));");
            int j= st.executeUpdate("INSERT INTO user VALUES('"+uname+"','"+pwd+"','donor');");

			int i= st.executeUpdate("INSERT INTO donorprofile VALUES('"+uname+"','"+name+"','"+fathername+"','"+gen+"',"+age+",'"+email+"','"+address+"',"+"'"+district+"','"+area+"',"+zip+","+phno+",'"+bgroup+"','"+ldd+"',0"+");");
          

		  /* ResultSet r=st.executeQuery("SELECT * FROM UserDetails;");
           while(r.next())
			{
 				out.println(r.getInt("id")+"\t"+r.getString("name")+"\t"+r.getInt("AGE")+"\t"+r.getString("SEX")+"\t"+r.getString("EMAIL")+"\t"+r.getString("ADDRESS")+"\t"+r.getInt("ZIP"));
			}
*/
    request.setAttribute("regsuccess","success");
    %>
    <jsp:forward page="login.jsp"/>
    <%}
		catch(SQLException e)
		{
			e.printStackTrace();
             %><%

		}
		catch(Exception e)
		{
			%><%= "other error" %><%
            e.printStackTrace();
		}

%>


    </body>
</html>
