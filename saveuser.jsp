
<%@ page import="java.sql.*" %>
<%
	String userid=request.getParameter("userid");
	String password=request.getParameter("password");
	String username=request.getParameter("username");
	try{
		DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
		Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/evServices","root","");
		String sql="INSERT INTO user VALUES(?,?,?)";
		PreparedStatement ps=cn.prepareStatement(sql);
		ps.setString(1,userid);
		ps.setString(2,password);
		ps.setString(3,username);
		ps.executeUpdate();
		cn.close();
		out.println("User Created");
	  }catch(Exception ex){
		out.println("Error : "+ex.getMessage());
		}
%>