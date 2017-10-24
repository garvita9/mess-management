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
        <link rel="stylesheet" href="style.css" type="text/css"/>

        <title>Mess Management</title>
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
	       width: 160px;
             }
              nav li a:hover
              {
	         background: #fbb;
               }
            .footer-style1
               {
                 width: 1310px;
                  height: 30px;
                 border: 1px solid #800000;
                 background:red;
                color:white;
               }
            .login
           {
              margin-top: 45px;
              margin-bottom: 45px;
              height:280px;
              width:470px;
              margin-left: 404px;             
              border:2px #aaa solid;
              padding:10px;
              
              background-color:brown;
           }
            input
            {
              background: #E1FFE1;
              border:1px #CCC solid;
               padding:5px;
            }  
   h1
{
       position:absolute;
       top:80px;
       center:0;
       width:100%;
       color:#000000;
}
#primary_nav_wrap
{
	margin-top:15px
}

#primary_nav_wrap ul
{
	list-style:none;
	position:relative;
	float:left;
	margin:0;
	padding:0
}

#primary_nav_wrap ul a
{
	display:block;
	color:silver;
	text-decoration:none;
	font-weight:700;
	font-size:16px;
	line-height:32px;
	padding:0 30px;
	font-family:"HelveticaNeue","Helvetica Neue",Helvetica,Arial,sans-serif;
                  
}

#primary_nav_wrap ul li
{
	position:relative;
	float:left;
	margin:0;
	padding:0
}

#primary_nav_wrap ul li.current-menu-item
{
	background:#ddd
}

#primary_nav_wrap ul li:hover
{
	background:#f6f6f6
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

  
        </style>
    </head>
    <body style="margin:0;background-color: cream">
        <div>
            <table>
                <tr>
                    <td colspan="2"><img src="12.JPG"alt="" width="219px" height="205px" ></td></div><div>
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
<nav id="primary_nav_wrap">
       <ul style="list-style:none">
        <li><a href="#">Welcome <%=name %></a></li>
        <li><a href="StudentLogout">Logout</a></li>
     


        </ul>
</nav>            
        </div>
        <div >

            <%
            Connection conn = null;
            Statement st;
            String Name,FName,gender,dob,mobile,email,course,foodType,doj,amount="";
            
            
     
            try{
            	Connection con = connect.ConnectionProvider.getConnection();
                con.setAutoCommit(false);
                st=con.createStatement();
           
                ResultSet resultset2 = st.executeQuery("select * from bill where id='" + id +"'");
                if(resultset2.next())
                {
                	amount=resultset2.getString("amount");
                 	         	
                }

            }
            catch(SQLException e){
    			e.printStackTrace();
    		}

        %>
        <br><br>
        <h3 style="color:blue;"><%=name %> your mess bill is <%=amount %></h3>
        
        </div>
        <div style="background-color:#DEB887; ">
        <TABLE BORDER="1" align="center" style="width:100vh; height:500px; background-color:#ddd;color:blue; text-size:20px;">
            
            <TR>
                <TH>Day</TH>
                <TH>Breakfast</TH>
                <TH>Lunch</TH>
                <TH>Dinner</TH>
               
            </TR>
            <% 
            try{
            	Connection con = connect.ConnectionProvider.getConnection();
                con.setAutoCommit(false);
                st=con.createStatement();
                ResultSet resultset3 = st.executeQuery("select * from menu");
                while(resultset3.next()){ 
                    %>
                    <TR>
                        <TD> <%= resultset3.getString("day") %></td>
                        <TD> <%= resultset3.getString("breakfast") %></TD>
                        <TD> <%= resultset3.getString("lunch") %></TD>
                        <TD> <%= resultset3.getString("dinner") %></TD>
                    
                    </TR>
                    <% }

            }
            catch(SQLException e){
    			e.printStackTrace();
    		}
%>
           
            
        </TABLE>
</div>
        <div>
            <table>
             <tr class="footer-style1">
                 <td colspan="5" valign="top" align="center"style="width:1342px;" ><strong> Copyright &copy; Mess Management Portal-2017 </strong><em><sub>All rights reserved.</sub></em></td>
            </tr>
            </table>
        </div>
    </body>
</html>
