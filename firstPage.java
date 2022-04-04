package Main;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mysql.cj.protocol.Resultset;

/**
 * Servlet implementation class Hello
 */
@WebServlet("/firstPage")
public class firstPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public  static long customerId;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public firstPage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getParameter("signupSubmit")!=null) {
			System.out.println("i am working");
			RequestDispatcher view = request.getRequestDispatcher("firstPage.html");
			view.forward(request, response);
		}
		if(request.getParameter("Login")!=null) {
			RequestDispatcher view = request.getRequestDispatcher("mainPage.jsp");
			customerId=Long.parseLong(request.getParameter("userName"));
			System.out.print("Name is"+customerId);
			String password=request.getParameter("password");

			 try {
				 Connection con = databaseConnector.initializeDatabase();
				 PrintWriter out = response.getWriter();
			      PreparedStatement st = con
		                   .prepareStatement("select password from customerRecords where customerId=(?);");
			      st.setLong(1,customerId);
			      ResultSet rs=st.executeQuery();
			      if(rs.next()) {
			    	  String enteredPassword=rs.getString(1);
			    	  System.out.printf(enteredPassword);
			    	  System.out.println(password);
			    	  if(enteredPassword.equals(password)&&!enteredPassword.isEmpty()) {
			    		view.forward(request, response);
			    	  }
			    	  else {
			    		  out.printf("please enter valid customerId and password");
			    		 
			    	  }
			      }
			      else {
			    	  out.printf("please enter valid customerId and password");
			      }
	            
			 }
			 catch(Exception e) {
				 e.printStackTrace();
			 }
		}
		
		}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	
	}


}
