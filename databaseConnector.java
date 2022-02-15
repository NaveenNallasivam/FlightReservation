package Main;

import java.io.IOException;
import java.io.PrintWriter;
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

public class databaseConnector {
	public databaseConnector() {
		
	}
	 public static Connection initializeDatabase()
		        throws SQLException, ClassNotFoundException
		    {
		        // Initialize all the information regarding
		        // Database Connection
		        String dbDriver = "com.mysql.jdbc.Driver";
		        String dbURL = "jdbc:mysql:// localhost:3306/";
		        // Database name to access
		        String dbName = "mydb";
		        String dbUsername = "root";
		        String dbPassword = "root";
		  
		        Class.forName(dbDriver);
		        Connection con = DriverManager.getConnection(dbURL + dbName,
		                                                     dbUsername, 
		                                                     dbPassword);
		        return con;
		    }

}
