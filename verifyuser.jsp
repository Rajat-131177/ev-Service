
<%@ page import="java.sql.*"%>
<%String userid=request.getParameter("userid");
String password=request.getParameter("password");
try{
	String sql="SELECT * FROM users WHERE userid=? and password=?";
	DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/evServices","root","");
	PreparedStatement ps=cn.prepareStatement(sql);
	ps.setString(1,userid);
	ps.setString(2,password);
	ResultSet rs=ps.executeQuery();
	if(rs.next()){
		RequestDispatcher rd=request.getRequestDispatcher("index.html"); 
		rd.forward(request, response);
		 }
	else{
		out.println("Sorry! User Not found");
	    }
	cn.close();
   }catch(Exception ex){
		out.println("Error : "+ex.getMessage());
		}
%>