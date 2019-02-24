package kreel.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import kreel.model.Admin;
import kreel.model.Bid;
import kreel.model.Contact;
import kreel.model.Item;
import kreel.util.DBConnect;

public class AdminService {

	public static boolean validateSecurityCode(String securityCode) {

		if (Admin.getSecuritycode().equals(securityCode))
			return true;
		else
			return false;

	}

	public static ArrayList<Contact> getFeedback() {

		Connection connection;
		Statement statement;
		ArrayList<Contact> feedbacks = new ArrayList<Contact>();
		int i = 0;

		try {

			connection = DBConnect.getDBConnection();
			statement = connection.createStatement();
			ResultSet results = statement.executeQuery("SELECT * FROM comment");

			while (results.next()) {

				Contact contact = new Contact();

				contact.setEmail(results.getString("email"));
				contact.setFirstName(results.getString("fname"));
				contact.setTelephone(results.getString("telephone"));
				contact.setComment(results.getString("comment"));
				contact.setId(results.getInt("id"));

				feedbacks.add(i, contact);
				i++;

			}

			statement.close();
			connection.close();

			return feedbacks;

		} catch (Exception e) {

			e.getStackTrace();

		}

		return feedbacks;

	}

	public static String deleteComment(int commentId) {

		Connection connection;
		PreparedStatement preparedStatement;

		try {

			connection = DBConnect.getDBConnection();
			preparedStatement = connection.prepareStatement("DELETE FROM comment WHERE id = ?");
			preparedStatement.setInt(1, commentId);
			preparedStatement.execute();
			preparedStatement.close();
			connection.close();

			return "Comment Successfully Deleted";

		} catch (Exception e) {

			e.getStackTrace();

		}

		return "Failed to delete the comment";

	}

	public static ArrayList<Bid> getBids(String startDate, String endDate) {

		Connection connection;
		PreparedStatement preparedStatement;
		ArrayList<Bid> bids = new ArrayList<Bid>();
		int i = 0;

		try {

			connection = DBConnect.getDBConnection();
			preparedStatement = connection.prepareStatement("SELECT * FROM bid WHERE bid_time >= ? AND bid_time <= ?");
			preparedStatement.setString(1, startDate);
			preparedStatement.setString(2, endDate);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				Bid bid = new Bid();

				bid.setBidder(resultSet.getString("bidder"));
				bid.setBidId(resultSet.getInt("bid_id"));
				bid.setItemId(resultSet.getInt("item_id"));
				bid.setBid(resultSet.getDouble("bid"));
				bid.setCreditCardNo(resultSet.getLong("credit_card"));
				bid.setBidDateTime(resultSet.getString("bid_time"));
				bid.setBidExpDateTime(resultSet.getString("exp_time"));

				bids.add(i, bid);
				i++;

			}

			preparedStatement.close();
			connection.close();
			
			return bids;

		} catch (Exception e) {

			e.getStackTrace();

		}

		return bids;

	}
	
	public static ArrayList<Item> getSoldItems() {
		
		Connection connection;
		PreparedStatement preparedStatement;
		ArrayList<Item> items = new ArrayList<Item>();
		int i = 0;
		
		try {
			
			connection = DBConnect.getDBConnection();
			preparedStatement = connection.prepareStatement("SELECT * FROM item WHERE sold = ?");
			preparedStatement.setBoolean(1, true);
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				
				Item item = new Item();
				
				item.setItemId(resultSet.getInt("id"));
				item.setItemName(resultSet.getString("iname"));
				item.setCategory(resultSet.getString("category"));
				item.setDescription(resultSet.getString("description"));
				item.setImagePath(resultSet.getString("image"));
				item.setStartingPrice(resultSet.getDouble("st_price"));
				item.setBidDurationD(resultSet.getInt("bid_duration_d"));
				item.setBidDurationH(resultSet.getInt("bid_duration_h"));
				item.setBidDurationM(resultSet.getInt("bid_duration_m"));
				item.setSellerId(resultSet.getString("sellerid"));
				item.setSold(resultSet.getBoolean("sold"));
				item.setSoldTo(resultSet.getString("sold_to"));
				
				items.add(i, item);
				i++;
				
			}
			
			preparedStatement.close();
			connection.close();
			
			return items;
			
		} catch (Exception e) {
			
			e.getStackTrace();
			
		}
		
		return items;
		
	}
	
	public static String deleteItem(int itemId) {
		
		Connection connection;
		PreparedStatement preparedStatement;
		
		try {
			
			connection = DBConnect.getDBConnection();
			preparedStatement = connection.prepareStatement("DELETE FROM item WHERE id = ?");
			preparedStatement.setInt(1, itemId);
			preparedStatement.execute();
			preparedStatement.close();
			connection.close();
			
			return "Item Deleted";
			
		} catch (Exception e) {
			
			e.getStackTrace();
			
		}
		
		return "Delete Failed";
		
	}

}
