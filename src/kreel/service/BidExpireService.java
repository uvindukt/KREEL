package kreel.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kreel.util.DBConnect;

public class BidExpireService {

	public static void setSold(int itemId, double highestBid) {

		Connection con;
		PreparedStatement ps1, ps2;
		String soldTo = null;

		try {

			con = DBConnect.getDBConnection();

			ps1 = con.prepareStatement("SELECT * FROM bid WHERE item_id = ? AND bid = ?");
			ps1.setInt(1, itemId);
			ps1.setDouble(2, highestBid);
			ResultSet rs = ps1.executeQuery();

			while (rs.next()) {
				soldTo = rs.getString("bidder");
			}

			ps1.close();

			if (soldTo != null) {

				ps2 = con.prepareStatement("UPDATE item SET sold = ?, sold_to = ? WHERE id = ?");
				ps2.setBoolean(1, true);
				ps2.setString(2, soldTo);
				ps2.setInt(3, itemId);
				ps2.execute();
				ps2.close();
				con.close();

			} else {
				
				System.out.println("Bidder : " + soldTo);
				
			}

		} catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {

			e.printStackTrace();

		}

	}

}
