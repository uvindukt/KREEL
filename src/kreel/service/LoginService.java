package kreel.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import kreel.model.Item;
import kreel.model.User;
import kreel.util.DBConnect;

public class LoginService {

	User usr = new User();

	public boolean checkLogin(String email, String password) {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {

			connection = DBConnect.getDBConnection();

			preparedStatement = connection.prepareStatement("SELECT * FROM user WHERE email = ?; ");
			preparedStatement.setString(1, email);
			ResultSet results = preparedStatement.executeQuery();

			while (results.next()) {

				usr.setEmail(results.getString("email"));
				usr.setFirstName(results.getString("fname"));
				usr.setLastName(results.getString("lname"));
				usr.setDateOfBirth(results.getString("dob"));
				usr.setTelephone(results.getString("telephone"));
				usr.setPassword(results.getString("password"));
				usr.setConfirmPassword(results.getString("password"));
				usr.setHouseNo(results.getString("postal_no"));
				usr.setStreet(results.getString("street"));
				usr.setCity(results.getString("city"));
				usr.setDistrict(results.getString("district"));
				usr.setBank(results.getString("bank"));
				usr.setAccountNo(results.getString("account_no"));

			}

			if (results != null && usr.getPassword().equals(password)) {

				return true;

			}

			else {

				return false;

			}

		} catch (Exception e) {

			System.out.println(e.getMessage());

		}

		finally {

			if (preparedStatement != null) {
				
				try {
					preparedStatement.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}

			}

			if (connection != null) {

				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}

			}

		}

		return false;

	}
	
	public User getLoginDetails() {
		
		return usr;
		
	}
	
	public ArrayList<Item> getSoldItemDetails(String sellerId) {
		
		Connection con;
		PreparedStatement ps;
		ArrayList<Item> items = new ArrayList<Item>();
		int i = 0;
		
		try {
			
			con = DBConnect.getDBConnection();
			ps = con.prepareStatement("SELECT * FROM item WHERE sellerid = ? AND sold = ?");
			ps.setString(1, sellerId);
			ps.setBoolean(2, true);
			ResultSet result = ps.executeQuery();
			
			while (result.next()) {
				
				Item temp = new Item();

				temp.setItemId(result.getInt("id"));
				temp.setItemName(result.getString("iname"));
				temp.setCategory(result.getString("category"));
				temp.setDescription(result.getString("description"));
				temp.setBidDurationD(result.getInt("bid_duration_d"));
				temp.setBidDurationH(result.getInt("bid_duration_h"));
				temp.setBidDurationM(result.getInt("bid_duration_m"));
				temp.setStartingPrice(result.getDouble("st_price"));
				temp.setSellerId(result.getString("sellerid"));
				temp.setSoldTo(result.getString("sold_to"));
				temp.setSold(result.getBoolean("sold"));
				temp.setImagePath(result.getString("image"));

				items.add(i, temp);
				i++;
				
			}
			
			ps.close();
			con.close();
			
			return items;
			
		} catch (Exception e) {
			
			System.out.println(e.getMessage());
			
		}
		
		return items;
		
	}
	
	public ArrayList<User> getClients() {
		
		Connection con;
		Statement s;
		ArrayList<User> users = new ArrayList<User>();
		int i = 0;
		
		try {
			
			con = DBConnect.getDBConnection();
			s = con.createStatement();
			ResultSet results = s.executeQuery("SELECT * FROM user");
			
			while (results.next()) {
				
				User user = new User();
				
				user.setEmail(results.getString("email"));
				user.setFirstName(results.getString("fname"));
				user.setLastName(results.getString("lname"));
				user.setDateOfBirth(results.getString("dob"));
				user.setTelephone(results.getString("telephone"));
				user.setPassword(results.getString("password"));
				user.setConfirmPassword(results.getString("password"));
				user.setHouseNo(results.getString("postal_no"));
				user.setStreet(results.getString("street"));
				user.setCity(results.getString("city"));
				user.setDistrict(results.getString("district"));
				
				users.add(i, user);
				i++;
				
			}
			
			con.close();
			
			return users;
			
		} catch (Exception e) {
			
			System.out.println(e.getMessage());
			
		}
		
		return users;
		
	}
	
}
