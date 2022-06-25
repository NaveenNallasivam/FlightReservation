package Main;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class calculations {
public calculations() {
	
}

public static void spend(String name,double amount,String category) {
if(category.equalsIgnoreCase("transport")) {
	try {
		Connection con=databaseConnector.initializeDatabase();
		PreparedStatement st=con.prepareStatement("select travel from userinfo where userName=(?)");
		st.setString(1, name);
		System.out.print("Name is"+name);
		ResultSet rs=st.executeQuery();
		double returnedAmount=0;
		if(rs.next()) {
			returnedAmount=rs.getDouble(1);
		}
		amount=amount+returnedAmount;
		st=con.prepareStatement("update userinfo set travel=(?) where userName=(?)");
		st.setDouble(1, amount);
		st.setString(2, name);
		st.execute();	
		}
	catch(Exception e) {
		e.printStackTrace();
	}
}
if(category.equalsIgnoreCase("food")) {
	try {
		Connection con=databaseConnector.initializeDatabase();
		PreparedStatement st=con.prepareStatement("select food from userinfo where userName=(?)");
		st.setString(1, name);
		System.out.print("Name is"+name);
		ResultSet rs=st.executeQuery();
		double returnedAmount=0;
		if(rs.next()) {
			returnedAmount=rs.getDouble(1);
		}
		amount=amount+returnedAmount;
		st=con.prepareStatement("update userinfo set food=(?) where userName=(?)");
		st.setDouble(1, amount);
		st.setString(2, name);
		st.execute();	
		}
	catch(Exception e) {
		e.printStackTrace();
	}
}
if(category.equalsIgnoreCase("accomodation")) {
	try {
		Connection con=databaseConnector.initializeDatabase();
		PreparedStatement st=con.prepareStatement("select accomodation from userInfo where userName=(?)");
		st.setString(1, name);
		System.out.print("Name is"+name);
		ResultSet rs=st.executeQuery();
		double returnedAmount=0;
		if(rs.next()) {
			returnedAmount=rs.getDouble(1);
		}
		amount=amount+returnedAmount;
		st=con.prepareStatement("update userinfo set accomodation=(?) where userName=(?)");
		st.setDouble(1, amount);
		st.setString(2, name);
		st.execute();	
		}
	catch(Exception e) {
		e.printStackTrace();
	}
}
if(category.equalsIgnoreCase("leisure")) {
	try {
		Connection con=databaseConnector.initializeDatabase();
		PreparedStatement st=con.prepareStatement("select leisure from userinfo where userName=(?)");
		st.setString(1, name);
		System.out.print("Name is"+name);
		ResultSet rs=st.executeQuery();
		double returnedAmount=0;
		if(rs.next()) {
			returnedAmount=rs.getDouble(1);
		}
		amount=amount+returnedAmount;
		st=con.prepareStatement("update userinfo set leisure=(?) where userName=(?)");
		st.setDouble(1, amount);
		st.setString(2, name);
		st.execute();	
		}
	catch(Exception e) {
		e.printStackTrace();
	}
}
}

public static double[] retrieval(String name) throws ClassNotFoundException, SQLException{
	Connection con=databaseConnector.initializeDatabase();
	PreparedStatement st=con.prepareStatement("select food from userinfo where userName=(?)");
	st.setString(1,name);
	double foodAmount;
	double transportAmnt;
	double leisureAmnt;
	double accomodationAmnt;
	double amounts[]=new double[4];
	ResultSet rs=st.executeQuery();
	if(rs.next()) {
		foodAmount=rs.getDouble(1);
		amounts[0]=foodAmount;
		System.out.println("foodAmnt");
	}
	//con.close();
	PreparedStatement st2=con.prepareStatement("select travel from userinfo where userName=(?)");
	st2.setString(1, name);
	rs=st2.executeQuery();
	if(rs.next()) {
		transportAmnt=rs.getDouble(1);
		System.out.println("transprtAmnt");
		amounts[1]=transportAmnt;
	}
	//con.close();
	PreparedStatement st3=con.prepareStatement("select leisure from userinfo where userName=(?)");
	st3.setString(1, name);
	rs=st3.executeQuery();
	con.prepareStatement("select leisure from userinfo where userName=(?)");
	st.setString(1, name);
	if(rs.next()) {
		leisureAmnt=rs.getDouble(1);
		amounts[2]=leisureAmnt;
		System.out.println("leisureAmnt");
	}
	//con.close();
	PreparedStatement st4=con.prepareStatement("select accomodation from userinfo where userName=(?)");
	st4.setString(1, name);
	rs=st4.executeQuery();
	con.prepareStatement("select accomodation from userinfo where userName=(?)");
	st.setString(1, name);
	if(rs.next()) {
		accomodationAmnt=rs.getDouble(1);
		amounts[3]=accomodationAmnt;
		System.out.println("accomodationAmnt");
	}
	con.close();
	return amounts;
}
}

