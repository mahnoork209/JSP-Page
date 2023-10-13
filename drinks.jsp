<% @ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<% @ page import="java.sql.Connection"%>
<% @ page import="java.sql.Statement"%>

<%

String driver="com.mysql.jdbc.Driver";
String ConnectionUrl="jdbc:mysql://localhost:3306/";
String database="Database";
String userid="root";
String password=" ";

try{
  class.forName(driver);
}catch(classNotFoundException e)
{
  e.printStackTrace();
}
Connection connection=null;
Statement statement=null;
ResultSet resultset=null;
%>

<html>
  <body>
  <select name="beverages">
  <%
  try{
  connection=DriverManager.getConnection(ConnectionUrl+database,userid,password);
  statement= Connection.createStatement();
  String sql= "Select name,rate from beverages";
  resultSet = statement.executeQuery(sql);
  while(resultSet.next()){
    %>
      <option><%=resultSet.getString("name")%>
      </option>
      <option><%=resultSet=getInt("rate")%>
      </option>

      <%
      }
      connection.close();
  }
  catch(Exception e)
{
  e.printStackTrace();
}
  %>
  </select>
  </body> 
  </html>
