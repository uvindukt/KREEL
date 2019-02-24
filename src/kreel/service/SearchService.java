package kreel.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import kreel.model.Item;
import kreel.util.DBConnect;

public class SearchService {

	public static ArrayList<Item> getAllItems() {

		Connection con;
		PreparedStatement ps;
		int i = 0;
		ArrayList<Item> allItems = new ArrayList<Item>();

		try {
			con = DBConnect.getDBConnection();
			ps = con.prepareStatement("SELECT * FROM item");
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
				temp.setSold(result.getBoolean("sold"));
				temp.setImagePath(result.getString("image"));

				allItems.add(i, temp);
				i++;
			}

			return allItems;

		} catch (Exception e) {
			e.getStackTrace();
		}

		return allItems;

	}

	public static ArrayList<Item> getResult(String search) {

		ArrayList<Item> items = SearchService.getAllItems();
		ArrayList<Item> results = new ArrayList<Item>();

		for (int i = 0; i < items.size(); i++) {

			if (items.get(i).getItemName().toLowerCase().replaceAll("\\s+","").contains(search.toLowerCase().replaceAll("\\s+","")))
				results.add(items.get(i));

		}

		return results;

	}

}
