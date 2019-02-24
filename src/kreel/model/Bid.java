package kreel.model;

public class Bid {

	private int bidId;
	private String bidder;
	private double bid;
	private double startPrice;
	private String bidDateTime;
	private String bidExpDateTime;
	private int bidDuration;
	private int itemId;
	private long creditCardNo;

	public int getBidId() {
		return bidId;
	}

	public void setBidId(int bidId) {
		this.bidId = bidId;
	}

	public String getBidder() {
		return bidder;
	}

	public void setBidder(String bidder) {
		this.bidder = bidder;
	}

	public String getBidDateTime() {
		return bidDateTime;
	}

	public void setBidDateTime(String bidDateTime) {
		this.bidDateTime = bidDateTime;
	}

	public String getBidExpDateTime() {
		return bidExpDateTime;
	}

	public void setBidExpDateTime(String bidExpDateTime) {
		this.bidExpDateTime = bidExpDateTime;
	}

	public double getBid() {
		return bid;
	}

	public void setBid(double bid) {
		this.bid = bid;
	}

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public int getBidDuration() {
		return bidDuration;
	}

	public void setBidDuration(int bidDuration) {
		this.bidDuration = bidDuration;
	}

	public double getStartPrice() {
		return startPrice;
	}

	public void setStartPrice(double startPrice) {
		this.startPrice = startPrice;
	}

	public long getCreditCardNo() {
		return creditCardNo;
	}

	public void setCreditCardNo(long creditCardNo) {
		this.creditCardNo = creditCardNo;
	}

}
