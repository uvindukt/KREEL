package kreel.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.regex.Pattern;

import kreel.model.CreditCard;
import kreel.util.DBConnect;

public class CreditCardService {

	CreditCard cc = new CreditCard();

	public void addCreditCard(String name, String address, String country, String network, String exp, long cardNo,
			int cvv, double creditLimit, String user) {

		cc.setName(name);
		cc.setAddress(address);
		cc.setCountry(country);
		cc.setNetwork(network);
		cc.setExp(exp);
		cc.setCardNo(cardNo);
		cc.setCvv(cvv);
		cc.setCreditLimit(creditLimit);
		cc.setUser(user);

	}

	public String validateCreditCard() {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		sdf.setLenient(false);
		Date exp = null;
		try {
			exp = sdf.parse(cc.getExp());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		boolean expired = exp.before(new Date());

		if (!Pattern.matches("^[a-zA-Z\\s]+$", cc.getName()))
			return "Name should only contain letters";
		else if (!Pattern.matches("^[a-zA-Z\\s]+$", cc.getCountry()))
			return "Country should only contain letters";
		else if (!Pattern.matches("^[0-9]{15,16}$", Long.toString(cc.getCardNo())))
			return "Please enter a valid Creid Card number";
		else if (!Pattern.matches("^[0-9]{3}$", Integer.toString(cc.getCvv())))
			return "Please enter a valid CVV";
		else if (!Pattern.matches("^[0-9]{3}$", Integer.toString(cc.getCvv())))
			return "Please enter a valid CVV";
		else if (expired == true)
			return "Credit Card is expired";
		else
			return "Credit Card Validation Successful";

	}
	
	public boolean isCreditCardExpired(CreditCard card) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		sdf.setLenient(false);
		Date exp = null;
		try {
			exp = sdf.parse(card.getExp());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		boolean expired = exp.before(new Date());
		
		if (expired == false) {
			return false;
		} else {
			return true;
		}
		
	}
	
	public boolean isCreditLimitExeeded(double bid, CreditCard card) {
		
		if (card.getCreditLimit() < bid)
			return true;
		else
			return false;
		
	}

	public String saveCreditCard() {

		Connection con;
		PreparedStatement ps;

		try {

			con = DBConnect.getDBConnection();
			ps = con.prepareStatement("INSERT INTO credit_card VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
			ps.setLong(1, cc.getCardNo());
			ps.setString(2, cc.getNetwork());
			ps.setInt(3, cc.getCvv());
			ps.setString(4, cc.getExp());
			ps.setDouble(5, cc.getCreditLimit());
			ps.setString(6, cc.getName());
			ps.setString(7, cc.getAddress());
			ps.setString(8, cc.getCountry());
			ps.setString(9, cc.getUser());

			int rows = ps.executeUpdate();

			ps.close();
			con.close();

			if (rows > 0)
				return "Credit Card Added Successfully";

		} catch (Exception e) {

			e.getStackTrace();

		}

		return "Failed to add Credit Card";

	}

	public ArrayList<CreditCard> getCreditCards(String user) {

		Connection con;
		PreparedStatement ps;
		ArrayList<CreditCard> cards = new ArrayList<CreditCard>();
		int i = 0;

		try {

			con = DBConnect.getDBConnection();
			ps = con.prepareStatement("SELECT * FROM credit_card WHERE user = ?");
			ps.setString(1, user);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				
				CreditCard card = new CreditCard();

				card.setName(rs.getString("name"));
				card.setAddress(rs.getString("address"));
				card.setCountry(rs.getString("country"));
				card.setNetwork(rs.getString("network"));
				card.setExp(rs.getString("exp"));
				card.setCardNo(rs.getLong("card_no"));
				card.setCvv(rs.getInt("cvv"));
				card.setCreditLimit(rs.getDouble("credit_limit"));
				card.setUser(rs.getString("user"));

				cards.add(i, card);
				i++;

			}

			ps.close();
			con.close();

			return cards;

		} catch (Exception e) {

			e.printStackTrace();

		}

		return cards;

	}
	
	public CreditCard getCreditCard(String user, long creditCardNo) {
		
		Connection con;
		PreparedStatement ps;
		CreditCard card = new CreditCard();

		try {

			con = DBConnect.getDBConnection();
			ps = con.prepareStatement("SELECT * FROM credit_card WHERE user = ? AND card_no = ?");
			ps.setString(1, user);
			ps.setLong(2, creditCardNo);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				card.setName(rs.getString("name"));
				card.setAddress(rs.getString("address"));
				card.setCountry(rs.getString("country"));
				card.setNetwork(rs.getString("network"));
				card.setExp(rs.getString("exp"));
				card.setCardNo(rs.getLong("card_no"));
				card.setCvv(rs.getInt("cvv"));
				card.setCreditLimit(rs.getDouble("credit_limit"));
				card.setUser(rs.getString("user"));
				
			}

			ps.close();
			con.close();

			return card;

		} catch (Exception e) {

			e.printStackTrace();

		}

		return card;
		
	}
	
	public String deleteCreditCard(long creditCardNo) {
		
		Connection connection;
		PreparedStatement preparedStatement;
		
		try {
			
			connection = DBConnect.getDBConnection();
			preparedStatement = connection.prepareStatement("DELETE FROM credit_card WHERE card_no = ?");
			preparedStatement.setLong(1, creditCardNo);
			preparedStatement.execute();
			
			preparedStatement.close();
			connection.close();
			
			return "Credit Card Successfully deleted";
			
			
		} catch (Exception e) {
			
			e.getStackTrace();
			
		}
		
		return "Failed to delete Credit Card";
		
	}
	
	public String updateCreditCard(long creditCardNo, double creditLimit) {
		
		Connection connection;
		PreparedStatement preparedStatement;
		
		try {
			
			connection = DBConnect.getDBConnection();
			preparedStatement = connection.prepareStatement("UPDATE credit_card SET credit_limit = ? WHERE card_no = ?");
			preparedStatement.setDouble(1, creditLimit);
			preparedStatement.setLong(2, creditCardNo);
			preparedStatement.execute();
			
			preparedStatement.close();
			connection.close();
			
			return "Credit Card Successfully Updated";
			
			
		} catch (Exception e) {
			
			e.getStackTrace();
			
		}
		
		return "Failed to update Credit Card";
		
	}

}
