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
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLogin() {
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
		String email=request.getParameter("email");
		System.out.println("email "+email);
        String pwd=request.getParameter("pwd");
        System.out.println("password "+pwd);
        
        Statement st;
        try{
        	Connection con = connect.ConnectionProvider.getConnection();
            con.setAutoCommit(false);
            st=con.createStatement();
            ResultSet resultset = st.executeQuery("select * from admin where email='" + email + "' and " +
            		"password='" + pwd + "' ");
            if(resultset.next())
            {
            	HttpSession session=request.getSession();  
                session.setAttribute("name",resultset.getString("name"));
                session.setAttribute("email",resultset.getString("email"));
            	 getServletContext().getRequestDispatcher("/adminProfile.jsp").forward(request, response);
            	
            	
            }
            else{
            	request.setAttribute("message","Invalid credentials ");
            	getServletContext().getRequestDispatcher("/adminLogin.jsp").forward(request, response);
            }
        	
        }
        catch(SQLException e){
			e.printStackTrace();
		}
	}

}
