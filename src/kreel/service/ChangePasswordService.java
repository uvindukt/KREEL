package kreel.service;

import java.util.regex.*;
import kreel.model.User;
import kreel.util.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.http.HttpSession;

public class ChangePasswordService {

	User usr = new User();

	public void changePassword(String npw, String cpw) {

		usr.setPassword(npw);
		usr.setConfirmPassword(cpw);

	}

	public String validatePassword(String pw, User user) {

		if (!user.getPassword().equals(pw))
			return "Current password is incorrect";
		else if (!Pattern.matches("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$",
				usr.getPassword()))
			return "Please enter a valid password";
		else if (!usr.getConfirmPassword().equals(usr.getPassword()))
			return "Confirm Password should match Password";
		else
			return "Password Successfully Changed";

	}

	public User savePassword(User user) {
		
		Connection connection;
		PreparedStatement preparedStatement;
		
		try {
			
			connection = DBConnect.getDBConnection();
			
			preparedStatement = connection.prepareStatement("UPDATE user SET password = ? WHERE email = ? ");
			preparedStatement.setString(1, usr.getPassword());
			preparedStatement.setString(2, user.getEmail());
			preparedStatement.execute();
			connection.close();
			
			return user;
		
		} catch (Exception e) {
			
			System.out.println(e.getMessage());
			
		}
		
		return user;
		
	}

}
