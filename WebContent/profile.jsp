<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" type="image/x-icon" href="img/ico.png">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="script/alert.js"></script>
<title>KREEL AUCTIONS | Profile</title>
</head>
<body>
	<div id="overlay"></div>
	<div id="alertbox">
		<div>
			<div id="alertboxhead"></div>
			<div id="alertboxbody"></div>
			<div id="alertboxfoot"></div>
		</div>
	</div>
	<%@ page import="javax.servlet.http.HttpSession"%>
	<%
		HttpSession loggedin = request.getSession(false);

		if (loggedin == null || loggedin.getAttribute("user") == null) {

			request.setAttribute("result", "Please login to continue");
			request.getRequestDispatcher("login.jsp").forward(request, response);

		}
	%>
	<%@ page
		import="kreel.model.User, kreel.model.Item, java.util.ArrayList"%>
	<%
		User usr = (User) loggedin.getAttribute("user");
	%>
	<header>
	<div class="header">
		<img src="img/header.jpg" class="img-header">
		<nav class="container-nav"> <a href="home.jsp" class="navlink">Home</a>
		<a href="sell.jsp" class="navlink">Sell</a> <a href="contact.jsp"
			class="navlink">Contact</a> <a
			href="
			<%if (loggedin.getAttribute("user") == null)
				out.print("register.jsp");
			else
				out.print("profile.jsp");%>"
			class="navlink active"> <%
 	if (loggedin.getAttribute("user") == null)
 		out.print("Sign Up");
 	else
 		out.print("Profile");
 %>
		</a> <a
			href="
				<%if (loggedin.getAttribute("user") == null)
				out.print("login.jsp");
			else
				out.print("LogoutServlet");%>"
			class="navlink"> <%
 	if (loggedin.getAttribute("user") == null)
 		out.print("Sign In");
 	else
 		out.print("Sign Out");
 %>
		</a> </nav>
		<form method="get" action="SearchServlet">
			<div class="search">
				<div>
					<input type="search" class="search-box" name="search-box"
						placeholder="Search">
				</div>
				<div>
					<button class="search-button" name="search-button">
						<i class="fa fa-search"></i>
					</button>
				</div>
			</div>
		</form>
		<div class="logo">
			<img src="img/logo.png" class="l1">
		</div>
		<div class="logo2">
			<img src="img/logo2.png" class="l2">
		</div>
		<div class="slogan">Your Price, Your Way!</div>
	</div>
	</header>
	<main style="display: grid;grid-template-columns: 1fr 1fr">
	<div class="non-reg-container">
		<form>
			<table class="pro-table">
				<tr class="row">
					<td class="col">First Name</td>
					<td class="col"><input type="text" name="fname"
						class="pro-box" <%="value='" + usr.getFirstName() + "'"%>
						<%="disabled"%>></td>
				</tr>
				<tr class="row">
					<td class="col">Last Name</td>
					<td class="col"><input type="text" name="lname"
						class="pro-box" <%="value='" + usr.getLastName() + "'"%>
						<%="disabled"%>></td>
				</tr>
				<tr class="row">
					<td class="col">E-Mail</td>
					<td class="col"><input type="text" name="email"
						class="pro-box" <%="value='" + usr.getEmail() + "'"%>
						<%="disabled"%>></td>
				</tr>
				<tr class="row">
					<td class="col">Date of Birth</td>
					<td class="col"><input type="text" name="fname"
						class="pro-box" <%="value='" + usr.getDateOfBirth() + "'"%>
						<%="disabled"%>></td>
				</tr>
				<tr class="row">
					<td class="col">Bank</td>
					<td class="col"><input type="text" name="tel" class="pro-box"
						<%="value='" + usr.getBank() + "'"%> <%="disabled"%>></td>
				</tr>
				<tr class="row">
					<td class="col">Account No.</td>
					<td class="col"><input type="text" name="tel" class="pro-box"
						<%="value='" + usr.getAccountNo() + "'"%> <%="disabled"%>></td>
				</tr>
				<tr class="row">
					<td class="col">Telephone No.</td>
					<td class="col"><input type="text" name="tel" class="pro-box"
						<%="value='" + usr.getTelephone() + "'"%> <%="disabled"%>></td>
				</tr>
				<tr class="row">
					<td class="col">Address</td>
					<td class="col" style="width: 100%"><input type="text"
						name="no" class="pro-box"
						<%="value='" + usr.getHouseNo() + ", " + usr.getStreet() + ", " + usr.getCity() + ", "
					+ usr.getDistrict() + "'"%>
						<%="disabled"%>></td>
				</tr>
				<tr class="row">
					<td class="col"><a href="editprofile.jsp"><input
							type="button" name="ep" value="Edit Profile" class="button"></a></td>
					<td class="col"><a href="changepassword.jsp"><input
							type="button" name="cp" value="Change Password" class="button"></a>&emsp;&emsp;&emsp;&emsp;<a
						href="creditcard.jsp"><input type="button" name="addcr"
							value="Credit Card" class="button"></a></td>
				</tr>
			</table>
		</form>
	</div>
	<%
		HttpSession details = request.getSession(false);
		ArrayList<User> clients = new ArrayList<User>();
		ArrayList<Item> items = new ArrayList<Item>();
		if (details.getAttribute("soldi") != null && details.getAttribute("soldu") != null) {
			clients = (ArrayList<User>) details.getAttribute("soldu");
			items = (ArrayList<Item>) details.getAttribute("soldi");
		}
	%>
	<div class="pc">
		<h1
			style="color: rgba(128, 0, 0); font-family: 'Calibri'; font-weight: light">Notifications</h1>
		<table cellpadding="10vw" cellsapcing="0px"
			style="border-collapse: collapse; transform: translateX(-5%)">
			<%
				if (details.getAttribute("soldi") != null && details.getAttribute("soldu") != null) {

					boolean head = false;

					for (int i = 0; i < items.size(); i++) {

						for (int j = 0; j < clients.size(); j++) {

							if (items.get(i).getSoldTo().equals(clients.get(j).getEmail())) {

								if (head == false) {

									out.print("<caption style='font-size: larger'>Sold Items</caption><tr><td></td></tr>");
									out.print("<tr style='color: black;'>");
									out.print("<th style=' border: gray 1px solid;'>Item Name</th>");
									out.print("<th style=' border: gray 1px solid;'>Buyer's Name</th>");
									out.print("<th style=' border: gray 1px solid;'>Email</th>");
									out.print("<th style=' border: gray 1px solid;'>Address</th>");
									out.print("</tr>");

									head = true;

								}

								out.print("<tr style='color: gray'>");
								out.print("<td style=' border: gray 1px solid;'>" + items.get(i).getItemName() + "</td>");
								out.print("<td style=' border: gray 1px solid;'>" + clients.get(j).getFirstName() + " "
										+ clients.get(j).getLastName() + "</td>");
								out.print("<td style=' border: gray 1px solid;'>" + clients.get(j).getEmail() + "</td>");
								out.print("<td style=' border: gray 1px solid;'>" + clients.get(j).getHouseNo() + ", "
										+ clients.get(j).getStreet() + ", " + clients.get(j).getCity() + ", "
										+ clients.get(j).getDistrict() + "</td>");
								out.print("</tr>");

							}
						}
					}

					if (head == false) {

						out.print("<br><br><span style='color: gray; font-size: larger'>No Notifications</span>");

					}
				}
			%>
		</table>
	</div>
	</main>
	<br>
	<footer>
	<div class="foot">Copyright © 2018 KREEL AUCTIONS (Pvt) Ltd. All
		rights reserved.</div>
	</footer>
</body>
</html>