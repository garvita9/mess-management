package api;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class StudentLogin
 */
@WebServlet("/StudentLogin")
public class StudentLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentLogin() {
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
        String pwd=request.getParameter("pwd");
        System.out.println("password "+pwd);
        
        Statement st;
        try{
        	Connection con = connect.ConnectionProvider.getConnection();
            con.setAutoCommit(false);
            st=con.createStatement();
            ResultSet resultset = st.executeQuery("select * from User_details where id='" + id + "' and " +
            		"password='" + pwd + "' ");
            if(resultset.next())
            {
            	HttpSession session=request.getSession();  
                session.setAttribute("name",resultset.getString("name"));
                session.setAttribute("id",resultset.getString("id"));
            	 getServletContext().getRequestDispatcher("/studentProfile.jsp").forward(request, response);
            	
            	
            }
            else{
            	request.setAttribute("message","Invalid credentials ");
            	getServletContext().getRequestDispatcher("/studentLogin.jsp").forward(request, response);
            }
        	
        }
        catch(SQLException e){
			e.printStackTrace();
		}
		 
   
        
	}

}
