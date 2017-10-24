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
 * Servlet implementation class UpdateMenu
 */
@WebServlet("/UpdateMenu")
public class UpdateMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMenu() {
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
		String day=request.getParameter("day");
		System.out.println("day "+day);
        String breakfast=request.getParameter("breakfast");
        System.out.println("breakfast "+breakfast);
        String lunch=request.getParameter("lunch");
        String dinner=request.getParameter("dinner");
        try{
			System.out.println("Inside try1 of getting prev balance");
			Connection con=ConnectionProvider.getConnection();
			// second connection and start
			System.out.println("Inside try2 of inserting value in transaction table ");
			//con.setAutoCommit(false);
			//insert using prepared statements
			String query="UPDATE MENU SET breakfast=?,lunch=?,dinner=? where day=?";
			// create the Oracle insert preparedstatement
		      PreparedStatement preparedStmt = con.prepareStatement(query);
		      preparedStmt.setString (1, breakfast);
		      preparedStmt.setString (2, lunch);
		      preparedStmt.setString (3, dinner);
		      preparedStmt.setString (4, day);
		 
		    
		      preparedStmt.execute();
		      // insert value in bill
		      request.setAttribute("message","Record Updated succesfully for day  "+day);
		      getServletContext().getRequestDispatcher("/updateMenu.jsp").forward(request, response);
		}
		catch(SQLException e){
			e.printStackTrace();
			request.setAttribute("message","Unable to update try after some time ");
        	getServletContext().getRequestDispatcher("/updateMenu.jsp").forward(request, response);
		}
	}

}
