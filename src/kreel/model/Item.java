package kreel.model;

public class Item {

	private int itemId;
	private String itemName;
	private String sellerId;
	private String soldTo;
	private boolean sold;
	private String category;
	private double startingPrice;
	private int bidDurationD;
	private int bidDurationH;
	private int bidDurationM;
	private String description;
	private String imagePath;

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public double getStartingPrice() {
		return startingPrice;
	}

	public void setStartingPrice(double startingPrice) {
		this.startingPrice = startingPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getSellerId() {
		return sellerId;
	}

	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}

	public int getBidDurationD() {
		return bidDurationD;
	}

	public void setBidDurationD(int bidDurationD) {
		this.bidDurationD = bidDurationD;
	}

	public int getBidDurationH() {
		return bidDurationH;
	}

	public void setBidDurationH(int bidDurationH) {
		this.bidDurationH = bidDurationH;
	}

	public int getBidDurationM() {
		return bidDurationM;
	}

	public void setBidDurationM(int bidDurationM) {
		this.bidDurationM = bidDurationM;
	}

	public boolean isSold() {
		return sold;
	}

	public void setSold(boolean sold) {
		this.sold = sold;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getSoldTo() {
		return soldTo;
	}

	public void setSoldTo(String soldTo) {
		this.soldTo = soldTo;
	}

}
