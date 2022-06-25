package Main;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.protocol.Resultset;
public class RetrieveProfileInfo {
	static String firstName;
	static String emailid;
	public  static void retrieveData(long customerId) {
		try {
			Connection  con=databaseConnector.initializeDatabase();	
			PreparedStatement ps1= con.prepareStatement("select firstName from customerRecords where customerId=(?)");
			ps1.setLong(1, customerId);
			ResultSet rs=ps1.executeQuery();
			if(rs.next()) {
				firstName=rs.getString(1);
				System.out.println("The retrieved name is"+firstName);
			}
			ps1=con.prepareStatement("select emailId from customerRecords where customerId=(?)");
			ps1.setLong(1, customerId);
			rs=ps1.executeQuery();
					if(rs.next()) {
						emailid=rs.getString(1);
					}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	public static String getFirstName() {
		// TODO Auto-generated method stub
		return firstName;
	}
	
	public static String getEmailid() {
		return emailid;
	}

}	

	