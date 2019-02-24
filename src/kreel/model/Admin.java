package kreel.model;

public class Admin {

	private static Admin admin = null;
	private static final String securityCode = "1234";
	private static String name;

	private Admin() {
		Admin.name = "Uvindu";
	}

	public static Admin getAdmin() {

		if (admin == null) {
			synchronized (Admin.class) {
				if (admin == null) {
					Admin.admin = new Admin();
				}
			}
		}

		return Admin.admin;

	}

	public static String getSecuritycode() {
		return securityCode;
	}

}
