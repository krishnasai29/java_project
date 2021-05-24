package skill;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Contact
 */
@WebServlet("/Contact")
public class Contact extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Contact() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
	          Class.forName("oracle.jdbc.driver.OracleDriver");
				
				Connection conn = DriverManager.getConnection(
						"jdbc:oracle:thin:@localhost:1521:xe","ep","ep123");
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				String subject = request.getParameter("subject");
				
				String message = request.getParameter("message");
				String sql = "INSERT INTO contact VALUES(?,?,?,?)";
				
				PreparedStatement ps = conn.prepareStatement(sql);
				
				ps.setString(1, name);
				ps.setString(2, email);
				ps.setString(3, subject);
				ps.setString(4, message);
				
				int count = ps.executeUpdate();
				
				if(count > 0) {
					RequestDispatcher rd=request.getRequestDispatcher("contactsuceess.jsp");
					rd.forward(request, response);
				}else {
					RequestDispatcher rd=request.getRequestDispatcher("contactfail.jsp");
					rd.forward(request, response);
				}
				
				
				
			
				System.out.println("executed");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

}
