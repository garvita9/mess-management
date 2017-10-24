<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="connect.ConnectionProvider"%>
<%@page import="javax.servlet.http.*"%>
<html>
    <head>
        <title>MESS MANAGEMENT PORTAL</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <style type="text/css">
           nav li a 
           {
	      background: #000000;
	      border-right: 1px solid #00ffff;
	      color: #00ffff;
	      display: block;
	      float:left;
                        
	      font: 400 13px/1.4 'Cutive', Helvetica, Verdana, Arial, sans-serif;
	      padding: 20px;
	      text-align: center;
	      text-decoration:none;
	       text-transform: uppercase;
	       width: 200px;
               height:50px;
             }
              nav li a:hover
              {
	         background: grey;
               }
              .footer-style1
               {
                 width: 1310px;
                  height: 30px;
                 border: 1px solid #800000;
                 background:red;
                color:white;
               
               }
   h1
{
       position:absolute;
       top:100px;
       right:0;
       width:100%;
       color:#000000;
}
#primary_nav_wrap
{
	margin-top:10px;
                  
}

#primary_nav_wrap ul
{
	list-style:none;
        display: flex;
        justify-content: center;
        text-align:center;
	margin:0;
	padding:0;
                 
}
#primary_nav_wrap ul a
{
	display:block;
	color:silver;
	text-decoration:none;
	font-weight:700;
	font-size:16px;
	line-height:32px;
	padding:0px 30px;
	font-family:"HelveticaNeue","Helvetica Neue",Helvetica,Arial,sans-serif;
                  center:0;
}

#primary_nav_wrap ul li
{
	position:float;
	float:left;
	margin:0;
	padding:0 8px;
                  
}

#primary_nav_wrap ul li.current-menu-item
{
	background:#000000
}

#primary_nav_wrap ul li:hover
{
	background:#ff0000
}

#primary_nav_wrap ul ul
{
	display:none;
	position:absolute;
	top:100%;
	left:0;
	background:#fff;
	padding:0
}

#primary_nav_wrap ul ul li
{
	float:none;
	width:200px
}

#primary_nav_wrap ul ul a
{
	line-height:120%;
	padding:10px 15px
}

#primary_nav_wrap ul ul ul
{
	top:0;
	left:100%
}

#primary_nav_wrap ul li:hover > ul
{
	display:block
}
 #main
			   {
			  font:bold 30px tahoma;
			 text-align:center;
			 padding:40px;
			 padding-bottom:100px;
			   
			   }
			   article footer
			   {
			   padding-top:40px;
			   }
			  


       </style>
</head>
    <body style=" background-color:#DEB887;">

        <div>
        <table>
                <tr>
                    <td colspan="2"><img src="12.JPG"alt="" width="219px" height="205px" ></td></div><div class="image">
                    <td colspan="3" ><img src="24.jpg"alt="" width="1100px" height="205px"/> </td><h1><center>WELCOME TO MESS MANAGEMENT PORTAL</center></h1> </div>   
                </tr>
            </table>
        </div>
         <div>
         <%
         HttpSession s=request.getSession();
         String id= (String)s.getAttribute("id");
         String name= (String)s.getAttribute("name");
         %>
           <font color="white"> <h2> <p><center>Welcome Admin <%= name%></p></center></h2></font>
           <a href="AdminLogout" >Logout</button>
            </div>
            
<div align="center">
    <nav id="primary_nav_wrap">
<table >
                <tr>
                     <td colspan="5" style="background-color:maroon;height:300px;width:1000px;">

       <ul style="list-style:none;">  
        <li><a href="updateMenu.jsp">UPDATE MENU</a></li><br/>
        <li><a href="fetchDetails.jsp">FETCH STUDENT DETAILS</a></li><br/>
          <li><a href="updateBill.jsp">UPDATE MESS BILL</a></li><br/>
          
        </ul>
</td>

</tr>
</table>
       </nav>            
        </div>
        <div>
         <section id="main">
  <TABLE BORDER="1" align="center" style="width:100vh; height:auto; background-color:#ddd;color:blue; text-size:20px;">
                              <%if(request.getAttribute("message")!=null)
{
	%>
	<h6 style="color:blue;"><%=request.getAttribute("message")%></h6>
	<%}%>
            <TR>
                <TH>ID</TH>
                <TH>Name</TH>
                <TH>Bill</TH>
                <TH>Update</TH>
               
            </TR>
            <% 
           Statement st;
            try{
            	Connection con = connect.ConnectionProvider.getConnection();
                con.setAutoCommit(false);
                st=con.createStatement();
                ResultSet resultset = st.executeQuery("select * from bill");
                while(resultset.next()){ 
                    %>
                    <TR>
                    <form action="UpdateBill" method="post">
                        <TD><input type="text" name="id" value=<%= resultset.getString("id") %> readonly></td>
                        <TD><input type="text" name="name" value=<%= resultset.getString("name") %> readonly></td>
                        <TD><input type="text" name="amount" value=<%= resultset.getString("amount") %> ></td>
                        <TD><input type="submit" value="Update"></TD>
                        
                    </form>
  
                    </TR>
                    <% }

            }
            catch(SQLException e){
    			e.printStackTrace();
    		}
%>
           
            
        </TABLE>
           </section>
        </div>
<div>
       <table>
             <tr class="footer-style1">
                 <td colspan="5" valign="top" align="center"style="width:1342px;" ><strong> Copyright &copy; Mess Management Portal-2017  </strong><em><sub>All rights reserved.</sub></em></td>
            </tr>
            </table>
        </div>
    </body>
</html>
