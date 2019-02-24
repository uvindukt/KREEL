package kreel.service;

import java.util.regex.*;
import kreel.model.User;
import kreel.util.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.http.HttpSession;

public class EditProfileService {

	private User usr = new User();

	public void editUser(String fname, String lname, String email, String tel, String dob, String houseNo,
			String street, String city, String district) {

		usr.setFirstName(fname);
		usr.setLastName(lname);
		usr.setEmail(email);
		usr.setTelephone(tel);
		usr.setDateOfBirth(dob);
		usr.setHouseNo(houseNo);
		usr.setStreet(street);
		usr.setCity(city);
		usr.setDistrict(district);

	}

	public String validateEdit() {

		if (!Pattern.matches("^[a-zA-Z]+$", usr.getFirstName()) && !usr.getFirstName().equals(""))
			return "First Name should only contain letters";
		else if (!Pattern.matches("^[a-zA-Z]+$", usr.getLastName()) && !usr.getLastName().equals(""))
			return "Last Name should only contain letters";
		else if (!Pattern.matches("^[a-z0-9._]+@[a-z]+\\.[a-z]+$", usr.getEmail()) && !usr.getEmail().equals(""))
			return "Please enter a vali e-mail address";
		else if (!Pattern.matches("^\\d{4}-\\d{2}-\\d{2}$", usr.getDateOfBirth()) && !usr.getDateOfBirth().equals(""))
			return "Please Select the Date of Birth";
		else if (!Pattern.matches("^[0-9]{10}$", usr.getTelephone()) && !usr.getTelephone().equals(""))
			return "Please enter a valid telephone number";
		else if (!Pattern.matches("^.+$", usr.getHouseNo()) && !usr.getHouseNo().equals(""))
			return "Please enter a valid Postal Number";
		else if (!Pattern.matches("^.+$", usr.getStreet()) && !usr.getStreet().equals(""))
			return "Please enter a valid Street";
		else if (!Pattern.matches("^.+$", usr.getCity()) && !usr.getCity().equals(""))
			return "Please enter a valid City";
		else if (!Pattern.matches("^.+$", usr.getDistrict()) && !usr.getDistrict().equals(""))
			return "Please enter a valid District";
		else
			return "Profile Updated";

	}

	public User updateUser(User currentUser) {

		Connection connection;
		PreparedStatement preparedStatement;

		try {

			connection = DBConnect.getDBConnection();

			if (!usr.getFirstName().equals("")) {

				preparedStatement = connection.prepareStatement("UPDATE user SET fname = ? WHERE email = ? ");
				preparedStatement.setString(1, usr.getFirstName());
				preparedStatement.setString(2, currentUser.getEmail());
				preparedStatement.execute();

				currentUser.setFirstName(usr.getFirstName());

			}

			if (!usr.getLastName().equals("")) {

				preparedStatement = connection.prepareStatement("UPDATE user SET lname = ? WHERE email = ? ");
				preparedStatement.setString(1, usr.getLastName());
				preparedStatement.setString(2, currentUser.getEmail());
				preparedStatement.execute();

				currentUser.setLastName(usr.getLastName());

			}

			if (!usr.getTelephone().equals("")) {

				preparedStatement = connection.prepareStatement("UPDATE user SET telephone = ? WHERE email = ? ");
				preparedStatement.setString(1, usr.getTelephone());
				preparedStatement.setString(2, currentUser.getEmail());
				preparedStatement.execute();

				currentUser.setTelephone(usr.getTelephone());

			}

			if (!usr.getDateOfBirth().equals("")) {

				preparedStatement = connection.prepareStatement("UPDATE user SET dob = ? WHERE email = ? ");
				preparedStatement.setString(1, usr.getDateOfBirth());
				preparedStatement.setString(2, currentUser.getEmail());
				preparedStatement.execute();

				currentUser.setDateOfBirth(usr.getDateOfBirth());

			}

			if (!usr.getHouseNo().equals("")) {

				preparedStatement = connection.prepareStatement("UPDATE user SET postal_no = ? WHERE email = ? ");
				preparedStatement.setString(1, usr.getHouseNo());
				preparedStatement.setString(2, currentUser.getEmail());
				preparedStatement.execute();

				currentUser.setHouseNo(usr.getHouseNo());

			}

			if (!usr.getStreet().equals("")) {

				preparedStatement = connection.prepareStatement("UPDATE user SET street = ? WHERE email = ? ");
				preparedStatement.setString(1, usr.getStreet());
				preparedStatement.setString(2, currentUser.getEmail());
				preparedStatement.execute();

				currentUser.setStreet(usr.getStreet());

			}

			if (!usr.getCity().equals("")) {

				preparedStatement = connection.prepareStatement("UPDATE user SET city = ? WHERE email = ? ");
				preparedStatement.setString(1, usr.getCity());
				preparedStatement.setString(2, currentUser.getEmail());
				preparedStatement.execute();

				currentUser.setCity(usr.getCity());

			}

			if (!usr.getDistrict().equals("")) {

				preparedStatement = connection.prepareStatement("UPDATE user SET district = ? WHERE email = ? ");
				preparedStatement.setString(1, usr.getDistrict());
				preparedStatement.setString(2, currentUser.getEmail());
				preparedStatement.execute();

				currentUser.setDistrict(usr.getDistrict());

			}

			connection.close();

			return currentUser;

		} catch (Exception e) {

			System.out.println(e.getMessage());

		}

		return currentUser;

	}

}
