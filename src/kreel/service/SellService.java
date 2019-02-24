package kreel.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.regex.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kreel.model.Item;
import kreel.util.DBConnect;

public class SellService {

	private Item item = new Item();

	public void addItem(String itemName, String category, String description, double startingPrice,
			int bidDurationD, int bidDurationH, int bidDurationM, String imagePath, String sellerId) {

		Connection connection;
		PreparedStatement preparedStetement;
		ArrayList<Integer> al = new ArrayList<Integer>();
		int max = 0;

		try {

			connection = DBConnect.getDBConnection();

			preparedStetement = connection.prepareStatement("SELECT * FROM item");
			ResultSet result = preparedStetement.executeQuery();

			while (result.next()) {

				al.add(result.getInt("id"));
				max = Collections.max(al);

			}
			
			preparedStetement.close();
			connection.close();

		} catch (Exception e) {

			System.out.print(e.getMessage());

		}

		item.setItemId(max + 1);
		item.setItemName(itemName);
		item.setCategory(category);
		item.setSellerId(sellerId);
		item.setDescription(description);
		item.setStartingPrice(startingPrice);
		item.setBidDurationD(bidDurationD);
		item.setBidDurationH(bidDurationH);
		item.setBidDurationM(bidDurationM);
		item.setImagePath(imagePath);
		item.setSold(false);

	}

	public String validateItem() {

		if (!Pattern.matches("^.+$", item.getItemName()))
			return "Please enter a valid item name";
		else if (!Pattern.matches("^.+$", item.getDescription()))
			return "Please enter a description for your item";
		else
			return "Item Added Successfully";

	}

	public String saveItem() {

		Connection connection;
		PreparedStatement preparedStetement;

		try {

			connection = DBConnect.getDBConnection();

			preparedStetement = connection.prepareStatement("INSERT INTO item (id, iname, category, description, st_price, bid_duration_d, bid_duration_h, bid_duration_m, sellerid, sold, image) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			preparedStetement.setInt(1, item.getItemId());
			preparedStetement.setString(2, item.getItemName());
			preparedStetement.setString(3, item.getCategory());
			preparedStetement.setString(4, item.getDescription());
			preparedStetement.setDouble(5, item.getStartingPrice());
			preparedStetement.setDouble(6, item.getBidDurationD());
			preparedStetement.setDouble(7, item.getBidDurationH());
			preparedStetement.setDouble(8, item.getBidDurationM());
			preparedStetement.setString(9, item.getSellerId());
			preparedStetement.setBoolean(10, item.isSold());
			preparedStetement.setString(11, ("file/" + item.getImagePath()));

			int rows = preparedStetement.executeUpdate();

			if (rows > 0)
				return "Item Added Successfully";

			preparedStetement.close();
			connection.close();

		} catch (Exception e) {

			System.out.println(e.getMessage());

		}

		return "Failed to Add Item";

	}

}
