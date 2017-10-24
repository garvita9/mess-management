package api;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connect.ConnectionProvider;



/**
 * Servlet implementation class SignUpStudent
 */
@WebServlet("/signupstudent")
public class SignUpStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpStudent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pname=request.getParameter("pname");
		System.out.println("pname "+pname);
        String fname=request.getParameter("fname");
        System.out.println("pname "+fname);
        String id=request.getParameter("id");
        System.out.println("pname "+id);
        String gender=request.getParameter("gender");
        System.out.println("pname "+gender);
        String dob=request.getParameter("dob");
        System.out.println("pname "+dob);
        String mobile=request.getParameter("mob");
        System.out.println("pname "+mobile);
        String email=request.getParameter("email");
        System.out.println("pname "+email);
        String course=request.getParameter("course");
        System.out.println("pname "+course);
        String person=request.getParameter("person");
        System.out.println("pname "+person);
        String ftype=request.getParameter("ftype");
        System.out.println("pname "+ftype);
        String doj=request.getParameter("doj");
        System.out.println("pname "+doj);
        String pwd=request.getParameter("pwd");
        System.out.println("pname "+pwd);
			
		
			//get previous balance
			try{
				System.out.println("Inside try1 of getting prev balance");
				Connection con=ConnectionProvider.getConnection();
				// second connection and start
				System.out.println("Inside try2 of inserting value in transaction table ");
				//con.setAutoCommit(false);
				//insert using prepared statements
				String query="INSERT INTO user_details (NAME, FATHER_NAME, ID, GENDER, DOB, MOBILE, EMAIL,COURSE,PERSON,FOOD_TYPE,DOJ,PASSWORD)"
				+"VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
				// create the Oracle insert preparedstatement
			      PreparedStatement preparedStmt = con.prepareStatement(query);
			      System.out.println("Inside try of inserting value in USER_DETAILS table ");
			      preparedStmt.setString (1, pname);
			      System.out.println("Inside try2 of inserting value in transaction table ");
			      preparedStmt.setString(2, fname);
			      System.out.println("Inside try2 of inserting value in transaction table ");
			      preparedStmt.setString(3, id);
			      System.out.println("Inside try2 of inserting value in transaction table ");
			      preparedStmt.setString(4, gender);
			      System.out.println("Inside try2 of inserting value in transaction table ");
			      preparedStmt.setString    (5, dob);
			      System.out.println("Inside try2 of inserting value in transaction table ");
			      preparedStmt.setString    (6, mobile);
			      preparedStmt.setString(7, email);
			      preparedStmt.setString(8, course);
			      preparedStmt.setString(9, person);
			      preparedStmt.setString(10, ftype);
			      preparedStmt.setString(11, doj);
			      preparedStmt.setString(12, pwd);
			      preparedStmt.execute();
			      // insert value in bill
			      String query2="INSERT INTO bill (id, Amount,name)VALUES(?,?,?)";
			      PreparedStatement preparedStmt2 = con.prepareStatement(query2);
			      preparedStmt2.setString(1,id);
			      preparedStmt2.setString(2,"14000");
			      preparedStmt2.setString(3,pname);
			      preparedStmt2.execute();
			      getServletContext().getRequestDispatcher("/").forward(request, response);
			}
			catch(SQLException e){
				e.printStackTrace();
				request.setAttribute("message","Unable to signup please fill form correctly ");
            	getServletContext().getRequestDispatcher("/signup.jsp").forward(request, response);
			}
			
	}

}
