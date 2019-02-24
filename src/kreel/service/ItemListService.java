package kreel.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import kreel.model.Item;
import kreel.util.DBConnect;

public class ItemListService {

	public static ArrayList<Item> getItems() {

		Connection connection;
		Statement statetement;
		int i = 0;
		ArrayList<Item> items = new ArrayList<Item>();

		try {

			connection = DBConnect.getDBConnection();

			statetement = connection.createStatement();
			ResultSet result = statetement.executeQuery("SELECT * FROM item");

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

				items.add(i, temp);
				i++;

			}

			statetement.close();
			connection.close();

		} catch (Exception e) {

			System.out.println(e.getMessage());

		}

		return items;

	}

}
