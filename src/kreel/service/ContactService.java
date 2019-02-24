package kreel.service;

import java.util.regex.*;
import kreel.model.Contact;
import kreel.util.DBConnect;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ContactService {

	private Contact cont = new Contact();
	
	public void addContact(String fname, String email, String tel, String cmnt) {
		
		cont.setFirstName(fname);
		cont.setEmail(email);
		cont.setTelephone(tel);
		cont.setComment(cmnt);
		
	}
	
	public String validateContact() {
		
		if (!Pattern.matches("^[a-zA-Z]+$", cont.getFirstName()))
			return "First Name should only contain letters";
		else if (!Pattern.matches("^[a-z0-9._]+@[a-z]+\\.[a-z]+$", cont.getEmail()))
			return "Please enter a vali e-mail address";
		else if (!Pattern.matches("^[0-9]{10}$", cont.getTelephone()))
			return "Please enter a valid telephone number";
		else if (!Pattern.matches("^.+$", cont.getComment()))
			return "Please enter a Comment";
		else
			return "Comment Submitted";
		
	}
	
	public void saveContact() {
		
		Connection connection;
		PreparedStatement preparedStatement;
		
		try {
			
			connection = DBConnect.getDBConnection();
			
			preparedStatement = connection.prepareStatement("INSERT INTO comment (email, fname, telephone, comment) VALUES (?, ?, ?, ?)");
			preparedStatement.setString(1, cont.getEmail());
			preparedStatement.setString(2, cont.getFirstName());
			preparedStatement.setString(3, cont.getTelephone());
			preparedStatement.setString(4, cont.getComment());
			preparedStatement.execute();
			preparedStatement.close();
			connection.close();
			
		} catch (Exception e) {
			
			System.out.println(e.getMessage());
			
		}
		
	}
	
}
