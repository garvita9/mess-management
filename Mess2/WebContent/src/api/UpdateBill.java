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
 * Servlet implementation class UpdateBill
 */
@WebServlet("/UpdateBill")
public class UpdateBill extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBill() {
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
		String id=request.getParameter("id");
		System.out.println("id "+id);
        String amount=request.getParameter("amount");
        System.out.println("amount "+amount);
        try{
			System.out.println("Inside try1 of getting prev balance");
			Connection con=ConnectionProvider.getConnection();
			// second connection and start
			System.out.println("Inside try2 of inserting value in transaction table ");
			//con.setAutoCommit(false);
			//insert using prepared statements
			String query="UPDATE BILL SET amount=? where id=?";
			// create the Oracle insert preparedstatement
		      PreparedStatement preparedStmt = con.prepareStatement(query);
		     
		      preparedStmt.setString (1, amount);
		      preparedStmt.setString (2, id);
		 
		    
		      preparedStmt.execute();
		      // insert value in bill
		      request.setAttribute("message","Record Updated succesfully for id  "+id);
		      getServletContext().getRequestDispatcher("/updateBill.jsp").forward(request, response);
		}
		catch(SQLException e){
			e.printStackTrace();
			request.setAttribute("message","Unable to update try after some time ");
        	getServletContext().getRequestDispatcher("/signup.jsp").forward(request, response);
		}
		
        
	}

}
