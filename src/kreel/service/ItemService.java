package kreel.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;

import kreel.model.Bid;
import kreel.model.CreditCard;
import kreel.util.DBConnect;

public class ItemService {

	Bid bid = new Bid();
	
	public static Double getHighestBid(int itemId) {
		
		Connection con;
		PreparedStatement ps;
		ArrayList<Double> bids = new ArrayList<Double>();
		Double highestBid = null;
		
		try {
			
			con = DBConnect.getDBConnection();
			
			ps = con.prepareStatement("SELECT * FROM bid WHERE item_id = ?");
			ps.setInt(1, itemId);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				bids.add(rs.getDouble("bid"));
			}
			
			ps.close();
			con.close();
			
			highestBid = Collections.max(bids);
			return highestBid;
			
		} catch (Exception e) {
			
			System.out.println(e.getMessage());
			
		}
		
		return highestBid;
		
	}
	
	public static String getExpDate(int itemId, Double highestBid) {
		
		Connection con;
		PreparedStatement ps;
		String expDate = null;
		
		try {
			
			con = DBConnect.getDBConnection();
			
			ps = con.prepareStatement("SELECT * FROM bid WHERE item_id = ? and bid = ?");
			ps.setInt(1, itemId);
			ps.setDouble(2, highestBid);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				expDate = rs.getString("exp_time");
				
			}
			
			ps.close();
			con.close();
			
		} catch (Exception e) {
			
			System.out.println(e.getMessage());
			
		}
		
		return expDate;
		
	}
	
}