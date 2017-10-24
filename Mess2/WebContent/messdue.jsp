<%-- 
    Document   : messdue
    Created on : 29 JULY 2017, 3:29:05 AM
    Author     : GARVITA GARG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<% Class.forName("com.mysql.jdbc.Driver"); %>

<HTML>
    <HEAD>
        <TITLE> </TITLE>
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
        <SCRIPT type="text/javascript">
            function printInfo(ele) {
    var openWindow = window.open("", "title", "attributes");
    openWindow.document.write(ele.previousSibling.innerHTML);
    openWindow.document.close();
    openWindow.focus();
    openWindow.print();
    openWindow.close();
}
        </script>
    </HEAD>

    
         <body style="margin:0;background-color:cream">
             <div>    
        <div>
            <table>
                <tr>
                    <td colspan="2"><img src="12.JPG"alt="" width="219px" height="205px" ></td></div><div>
                    <td colspan="3" ><img src="24.jpg"alt="" width="1100px" height="205px"/> </td><h1><center>WELCOME TO MESS MANAGEMENT PORTAL</center></h1> </div> 
                </tr>
            </table>
        </div>
       
        <div>
        <H2 align="center">BILL</H2>
        </div>

        <% 
            Connection connection = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/mess","root","tsunadesama");
            
            Statement statement = connection.createStatement() ;
            HttpSession s=request.getSession(false);
                        String id=(String)s.getAttribute("uid");
            String sr="select * from userdetails where id='"+id+"';";
            ResultSet resultset = 
                statement.executeQuery(sr); 
        %>
        
<div style="background-color:#DEB887">
        <TABLE BORDER="1" align="center" style="width:500px; height:100px; background-color:brown">
            
            <TR>
                <TH>ID</TH>
                <TH>Mess Due</TH>
            </TR>
            <% while(resultset.next()){ %>
            <TR>
                <TD> <%= resultset.getString(1) %></td>
                <TD> <%= resultset.getString(6) %></TD>
                
            </TR>
            <% } %>
            
        </TABLE>
</DIV>
       </div><input type="button" name="Print" value="Print"  align="center" style="color:white; width: 125px;height: 50px; background-color: black;" onclick="printInfo(this)"  >
 <div>
          <section id="main">
               <article>
               <div>
                 <table>
                   
                   
                
                    <footer> 
                        <input type="button" name="Back" value="Home" style="color:red; width: 125px;height: 50px; background-color: #DEB887" onclick="window.location.href='index.html' " >
  <input type="button" name="Back" value="Back" align="center" style="color:red; width: 125px;height: 50px; background-color: #DEB887" onclick="window.location.href='Bill.html' " >
   
	
</footer>
			 </article>
           </section>
           
        </div>
                   
            </BODY>
</HTML>
