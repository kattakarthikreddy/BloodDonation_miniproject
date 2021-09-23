<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>


<html>
   <head>
    <%@ page import="java.util.*" %>
   <%@ page import="java.sql.*" %>
   <%@ page import="java.lang.*"%>
<title>authenticate page </title>
   </head>
<body>
    <table rules="all">
<%
	try

{
        if(!c1==null)
{
        String bggroup=request.getParameter("d1");
         String country=request.getParameter("d2");
         String state=request.getParameter("d3");
         String city=request.getParameter("t1");
          String zip=request.getParameter("t2");
         String area=request.getParameter("t3");

         Class.forName("com.mysql.jdbc.Driver");

            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blooddonar", "root", "1234");
           Statement st = conn.createStatement();
           String sql="select * from donorprofile where bg='"+bggroup+"'";
           if(!country.equals("All"))
            sql = sql+" and country='"+country+"'";
           if(!state.equals("All"))
            sql=sql+"and  state='"+state+"'" ;
           if(!city.equals(""))
             sql=sql+"and city='"+city+"'";
           if(!area.equals(""))
              sql=sql+"and area='"+area+"'";
           if(!zip.equals(""))
              sql=sql+"and zip='"+zip+"'";
           ResultSet rs=st.executeQuery(sql);
        while(rs.next())
            {
            %>

                <tr>

            <td><%= rs.getString("name") %></td><td><%=rs.getString("gend")%></td><td><%=rs.getInt("age")%></td><td><%=rs.getString("email")%></td><td><%=rs.getString("address")%></td><td><%=rs.getString("country")%></td><td><%=rs.getString("state")%></td><td><%=rs.getString("city")%></td><td><%=rs.getString("area")%></td><td><%=rs.getInt("zip")%></td><td><%=rs.getString("phno") %></td>
</tr>



<%
            
           }

          if(!c2==null)
          {
           String c2= request.getParameter("c2");
          }

           if(c1==null&&c2==null){
               out.println("no results");
           }
}
        catch(SQLException e)
		{
			e.printStackTrace();
             %><%= "sql error"%><%
		}
		catch(Exception e)
		{    e.printStackTrace();
			%><%= "other error" %><%
            e.printStackTrace();
		}

%>

</table>
    </body>
</html>

