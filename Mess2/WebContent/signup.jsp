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
<!DOCTYPE HTML>
<html>
    <head>
        <title>SignUP</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style type="text/css">
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
       		 top:80px;
      		 center:0;
       		 width:100%;
       		 color:#000000;
		}
        </style>
    </head>
    <body style="margin:0;background-color: black">
        <div>
            <table>
                <tr>
                      <td colspan="2"><img src="12.JPG"alt="" width="219px" height="205px" ></td></div><div>
                    <td colspan="3" ><img src="24.jpg"alt="" width="1100px" height="205px"/> </td><h1><center>WELCOME TO MESS MANAGEMENT PORTAL</center></h1> </div>    
                </tr>
            </table>
        </div>
        <div>
            <form action="signupstudent" method="post">
            <table align="center" style="width:1200px; height:550px;background-color:#F0FFFF">
                <tr>
                    <td align="center" style="width:1425px; height:550px">
                        <hr color="green"/>
                        <h2 align="center">Mess Enrollment Form</h2>
                        <hr color="green"/>
                        <fieldset >
                            <legend>
                                <h3 align="center" style="color:red">
                                     Personal Information
                                </h3>  
                                <%if(request.getAttribute("message")!=null)
{
	%>
	<h3 style="color:blue;"><%=request.getAttribute("message")%></h3>
	<%}%>  
                            </legend>
                            <center>
                                <label for="pname" style="width:225px"><strong>Enter Your Name:</strong> </label><input type="text" name="pname" style="width:250px"><br/><br/>
                                <label for="fname" style="width:225px"><strong>Father's Name:</strong> </label><input type="text" name="fname" style="width:250px"><br/><br/>
                                <label for="id" style="width:225px"><strong>Enter Your ID:</strong> </label><input type="text" name="id" style="width:250px"><br/><br/>
                                <label for="gender" style="width:225px"><strong>Gender</strong> </label><input type='radio' name='gender' value="male" style="width:90px"><strong>Male</strong>
                                                             <input type='radio' name='gender' value="female" style="width:90px"><strong>Female</strong><br/><br/>
                                <label for="dob" style="width:225px"><strong>Date Of Birth:</strong></label><input type="date" name="dob" style="width:250px"><br/><br/>
                               
                                
                            </center>
                        </fieldset>
                        <fieldset>
                            <legend>
                                <h3 align="center" style="color:red">
                                    Contact Information
                                </h3>
                            </legend>
                            <center>
                                
                                <label for="mob" style="width:225px"><strong>Mobile:</strong></label><input type="text" name="mob" style="width:250px"><br/><br/>
                                <label for="email" style="width:225px"><strong>Email:</strong></label><input type="email" name="email" style="width:250px"><br/><br/>
                            </center>
                        </fieldset>
                        <fieldset>
                            <legend>
                                <h3 align="center" style="color:red">
                                    Academic Information
                                </h3>
                            </legend>
                            <center>
                                <label for="course" style="width:225px"><strong>Course/Dept.:</strong></label><input type="text" name="course" style="width:250px"><br/><br/>
                                 <label for="person" style="width:225px"><strong>Student/Faculty:</strong></label><input type="text" name="person" style="width:250px"><br/><br/>
                               
                                
                            </center>
                         </fieldset>
                        <fieldset>
                            <legend>
                                <h3 align="center" style="color:red">
                                    Mess Information
                                </h3>
                            </legend>
                            <center>
                                <label for="ftype" style="width:225px"><strong>Food Type:</strong></label><input type="text" placeholder="Veg/NonVeg" name="ftype" style="width:250px"><br/><br/>
                               <label for="pwd" style="width:225px"><strong>Password:</strong></label><input type="password" name="pwd" style="width:250px"><br><br>
                               <label for="doj" style="width:225px"><strong>Date Of Joining:</strong></label><input type="date" name="doj" style="width:250px"><br/><br/>
                            </center>
                         </fieldset>
                        <center>
                            <input type="submit" name="Submit" value="Submit Details "style="color:black; width: 125px;height: 45px; background-color: orange">
                            <input type="reset" name="Reset" value="Reset" style="color:black; width:125px;height: 45px; background-color: orange">
                        </center>
                        
                    </td>
                    
            </table>
            </form>
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
