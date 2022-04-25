package Main;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.protocol.Resultset;

/**
 * Servlet implementation class signup
 */
@WebServlet("/signup")
public class signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static String firstName;
	public String lastName;
	public String address;
	public long contactNo;
	public String city;
	public String state;
	public String country;
	public String gender;
	public String emailId;
	public static long customerId;
	public String password;   
	public String confirmPassword;
	public String to;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public signup() {
        super();
        // TODO Auto-generated constructor stub
        Random rand=new Random();
        customerId=rand.nextInt(1000);
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 try {
			  
	            // Initialize the database
	            Connection con = databaseConnector.initializeDatabase();
	            this.firstName=request.getParameter("firstName");
	            System.out.println(firstName);
	            this.lastName=request.getParameter("lastName");
	            this.address=request.getParameter("address");
	            this.contactNo=Long.parseLong(request.getParameter("contactno"));
	            System.out.println(contactNo);
	            this.city=request.getParameter("city");
	            this.state=request.getParameter("state");
	            this.country=request.getParameter("country");
	            this.gender=request.getParameter("gender");
	            this.emailId=request.getParameter("mailid");
	            this.password=request.getParameter("password");
	            this.confirmPassword=request.getParameter("confirmpassword");
	            customerId++;
	            PreparedStatement ps= con.prepareStatement("select * from customerRecords where emailId=(?)");
	            ps.setString(1, emailId);
	            ResultSet rs=ps.executeQuery();
	            PrintWriter out = response.getWriter();
	            if(rs.next()) {
	            	System.out.println("delei");
	            	out.printf("User already exists please login");
	            }
	            else {
	            	System.out.println("delei2");
	            	 ps= con.prepareStatement("Insert into customerRecords values(?,?,?,?,?,?,?,?,?,?,?)");
	 	            ps.setString(1, firstName);
	 	            ps.setString(2, lastName);
	 	            ps.setString(3, address);
	 	            ps.setLong(4, contactNo);
	 	            ps.setString(5, city);
	 	            ps.setString(6, state);
	 	            ps.setString(7, country);
	 	            ps.setString(8, gender);
	 	            ps.setString(9, emailId);
	 	            ps.setLong(10, customerId);
	 	            ps.setString(11, password);
	 	            ps.execute();
	 	         MailVerification mailVerification=new MailVerification();
	 	   		 mailVerification.sendMail(to);
	 	   		RequestDispatcher view = request.getRequestDispatcher("mailVerificationPage.html");
	 	   		 view.forward(request, response);
	            }
	           
	        }
	        catch (Exception e) {
	            e.printStackTrace();
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