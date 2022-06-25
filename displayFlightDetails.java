package Main;

import java.io.Console;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.jdbc.CallableStatement;

/**
 * Servlet implementation class displayFlightDetails
 */
@WebServlet("/displayFlightDetails")
public class displayFlightDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public displayFlightDetails() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub;
		PrintWriter out = response.getWriter();
		String source = (String) request.getParameter("source");
		String destination = (String) request.getParameter("destination");
		String dayOfTravel = request.getParameter("date");
		String noOfPassengers = request.getParameter("quantity");
		if (source.toLowerCase().equals(destination.toLowerCase()) == true) {
			out.printf("Source and destination cannot be same!");
		} else {
			try {
				Connection con = databaseConnector.initializeDatabase();
				String query = "{CALL flight_info(?,?,?,?,?,?,?,?)}";
				CallableStatement st = (CallableStatement) con.prepareCall(query);
				System.out.printf(source);
				System.out.printf(destination);
				st.setString(1, source.toLowerCase());
				st.setString(2, destination.toLowerCase());
				st.setString(3, dayOfTravel);
				st.setString(4, noOfPassengers);
				st.registerOutParameter(5, Types.VARCHAR);
				st.registerOutParameter(6, Types.VARCHAR);
				st.registerOutParameter(7, Types.VARCHAR);
				st.registerOutParameter(8, Types.TIME);
				st.executeUpdate();
				ResultSet rs = st.getResultSet();
				//System.out.printf(st.getString(5));
				request.setAttribute("flightNo", st.getString(5));
				request.setAttribute("sourceCity", st.getString(6));
				request.setAttribute("destCity", st.getString(7));
				request.setAttribute("timings", st.getString(8));
				System.out.println(st.getString(5));
				request.getRequestDispatcher("finalPage.jsp").forward(request, response);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
