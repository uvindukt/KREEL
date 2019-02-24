package kreel.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.regex.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import kreel.model.Bid;
import kreel.model.Item;
import kreel.util.DBConnect;

public class BidService {

	private Bid bd = new Bid();

	public void addBid(String bidder, double startPrice, double bid, String bidDateTime, String bidExpDateTime,
			int itemId, long creditCardNo) {

		Connection connection;
		PreparedStatement preparedStatetement;
		ArrayList<Integer> al = new ArrayList<Integer>();
		int max = 0;

		try {

			connection = DBConnect.getDBConnection();

			preparedStatetement = connection.prepareStatement("SELECT * FROM bid");
			ResultSet result = preparedStatetement.executeQuery();

			while (result.next()) {

				al.add(result.getInt("bid_id"));
				max = Collections.max(al);

			}

			preparedStatetement.close();
			connection.close();

		} catch (Exception e) {

			System.out.print(e.getMessage());

		}

		bd.setBidId(max + 1);
		bd.setBidder(bidder);
		bd.setBid(bid);
		bd.setBidDateTime(bidDateTime);
		bd.setBidExpDateTime(bidExpDateTime);
		bd.setItemId(itemId);
		bd.setStartPrice(startPrice);
		bd.setCreditCardNo(creditCardNo);

	}

	public String checkBid() {

		Connection con;
		PreparedStatement ps;
		Double currentBid = null;
		ArrayList<Double> b = new ArrayList<Double>();

		try {

			con = DBConnect.getDBConnection();
			ps = con.prepareStatement("SELECT * FROM bid WHERE item_id = ?");
			ps.setInt(1, bd.getItemId());
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b.add(rs.getDouble("bid"));
				currentBid = Collections.max(b);
			}

			ps.close();
			con.close();

		} catch (Exception e) {

			System.out.print(e.getMessage());

		}

		if (currentBid == null) {

			currentBid = bd.getStartPrice();

			if (bd.getBid() < currentBid)
				return "Your bid should be equal or higher than starting price";
			else
				return "Bid Successful";

		} else {
			
			if (bd.getBid() <= currentBid)
				return "Your bid should be higher than the current bid";
			else
				return "Bid Successful";
			
		}

	}

	public String saveBid() {

		Connection connection;
		PreparedStatement preparedStatement;

		try {

			connection = DBConnect.getDBConnection();
			preparedStatement = connection.prepareStatement("INSERT INTO bid VALUES (?, ?, ?, ?, ?, ?, ?)");
			preparedStatement.setInt(1, bd.getBidId());
			preparedStatement.setInt(2, bd.getItemId());
			preparedStatement.setString(3, bd.getBidder());
			preparedStatement.setDouble(4, bd.getBid());
			preparedStatement.setString(5, bd.getBidDateTime());
			preparedStatement.setString(6, bd.getBidExpDateTime());
			preparedStatement.setLong(7, bd.getCreditCardNo());
			int rows = preparedStatement.executeUpdate();

			if (rows > 0)
				return "Bid Added";

			preparedStatement.close();
			connection.close();

		} catch (Exception e) {

			System.out.println(e.getMessage());

		}

		return "Bid Failed";

	}
	
	public void setExpireTimer(Calendar cal) {
		
		long delay = cal.getTimeInMillis() - System.currentTimeMillis();
		
		ScheduledExecutorService expire = Executors.newSingleThreadScheduledExecutor();
		expire.schedule(new Runnable(){
			
		    @Override
		    public void run() {
		        
		    	BidExpireService.setSold(bd.getItemId(), bd.getBid());
		    	
		    }
		    
		}, delay, TimeUnit.MILLISECONDS);
		
	}

}
