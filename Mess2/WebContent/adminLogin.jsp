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
                 width: 5000px;
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
    <body style="margin:0;">
        <div>
            <table>
                <tr>
                    <td colspan="2"><img src="12.JPG"alt="" width="219px" height="205px" ></td></div><div>
                    <td colspan="3" ><img src="24.jpg"alt="" width="1100px" height="205px"/> </td><h1><center>WELCOME TO MESS MANAGEMENT PORTAL</center></h1> </div> 
                </tr>
            </table>
        </div>
           <div>
<nav id="primary_nav_wrap">
       <ul style="list-style:none">
        <li><a href="index.html">HOME</a></li>
        <li><a href="AboutUs.html">ABOUT US</a></li>
         <li><a href="adminLogin.jsp">ADMIN</a></li>
          <li><a href="#">USER<span class="arrow">&#9660;</span></a>
<ul style="list-style:none">
<li><a href="studentLogin.jsp">Student</a></li>
<li><a href="studentLogin.jsp">Faculty</a></li>
</ul>
</li>
          <li><a href="Food.html">FOOD</a></li>
          <li><a href="Contactus.html">CONTACT US</a></li>
        </ul>
       </nav>            
        </div>
        <div style="background-color:#DEB887">
            <table align="center" style="width:1425px; height:550px;">
              <form action="AdminLogin" method="post" >  
                <div align="center"  class="login">
                <h3>Put Your information first</h3>
                 Email: <input type="email" placeholder="Email" id="uid" name="email" style="width:270px"><br/><br/><br/> 
                <br/> Password: <input type="password" placeholder="Password" id="uroll" name="pwd" style="width:270px"><br/><br/>
                <br/><br/>
                 <%if(request.getAttribute("message")!=null)
{
	%>
	<h3 style="color:blue;"><%=request.getAttribute("message")%></h3>
	<%}%>
                 <br/><br/><input type="submit" value="Sign In"><br/><br/><br/><br/>
                </div>
            </form>    
            </table>
            
        </div>
        <div>
            <table>
             <tr class="footer-style1">
                 <td colspan="5" valign="top" align="center"style="width:1342px;" ><strong> Copyright &copy;Mess Management Portal-2017  </strong><em><sub>All rights reserved.</sub></em></td>
            </tr>
            </table>
        </div>
    </body>
</html>
