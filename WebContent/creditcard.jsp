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
<script type="text/javascript" src="script/prompt.js"></script>
<script type="text/javascript" src="script/confirm.js"></script>
<title>KREEL AUCTIONS | Credit Card</title>
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
		if (request.getAttribute("result") != null) {
			out.print("<script type='text/javascript'> Alert.render('" + request.getAttribute("result")
					+ "') </script>");
		}

		HttpSession loggedin = request.getSession(false);

		if (loggedin == null || loggedin.getAttribute("user") == null) {

			response.sendRedirect("login.jsp");

		}
	%>
	<%@ page
		import="kreel.model.User, kreel.model.Item, java.util.ArrayList, kreel.model.CreditCard"%>
	<%
		User usr = (User) loggedin.getAttribute("user");
		ArrayList<CreditCard> cards = (ArrayList<CreditCard>) loggedin.getAttribute("ccs");
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
	<main style="display: grid; grid-template-columns: 1fr 2fr; grid-gap: 1vw">
	<div class="non-reg-container">
		<form method="post" action="CreditCardServlet">
			<table class="pro-table">
				<tr class="row">
					<td class="col">Name</td>
					<td class="col"><input type="text" name="name"
						class="text-box" placeholder="eg. Addison Baker"></td>
				</tr>
				<tr class="row">
					<td class="col">Address</td>
					<td class="col"><input type="text" name="add" class="text-box"
						placeholder="eg. Laurel Drive 72"></td>
				</tr>
				<tr class="row">
					<td class="col">Country</td>
					<td class="col"><input type="text" name="country"
						class="text-box" placeholder="eg. France"></td>
				</tr>
				<tr class="row">
					<td class="col">Issuing Network</td>
					<td class="col"><select name="network" class="text-box" style="width: 100%;"><option
								value="Visa">Visa</option>
							<option value="MasterCard">MasterCard</option>
							<option value="American Express">American Express</option></select></td>
				</tr>
				<tr class="row">
					<td class="col">Card No.</td>
					<td class="col"><input type="text" name="cardno"
						class="text-box" pattern="[0-9]{16}"
						placeholder="eg. 4857610135746974"></td>
				</tr>
				<tr class="row">
					<td class="col">CVV</td>
					<td class="col"><input type="text" name="cvv"
						class="text-box" pattern="[0-9]{3}" placeholder="eg. 374"></td>
				</tr>
				<tr class="row">
					<td class="col">Credit Limit</td>
					<td class="col"><input type="text" name="limit"
						class="text-box" pattern="[0-9]{3,}" placeholder="eg. 100000"></td>
				</tr>
				<tr class="row">
					<td class="col">Exp. Date</td>
					<td class="col"><input type="month" name="exp"
						class="text-box"></td>
				</tr>
				<tr class="row">
					<td class="col"><input type="reset" name="reset" value="Reset"
						class="button"></td>
					<td class="col"><input type="submit" name="submit"
						value="Submit" class="button"></td>
				</tr>
			</table>
		</form>
	</div>
	<div class="admin-div" style="margin: 2vw">
	<h2 style="color: #800000; font-family: 'Calibri'; font-weight: lighter;">Credit Cards</h2>
	<div style="margin: 2vw">
	<table cellpadding="10vw" class="feedback"
					style="margin: 0; border-collapse: collapse; position: absoulute; width: 100%;">
					<%
						if (cards != null) {

							boolean head = false;

							for (int i = 0; i < cards.size(); i++) {

								if (head == false) {

									out.print("<tr style='color: black;'>");
									out.print("<th style=' border: gray 1px solid;'>Network</th>");
									out.print("<th style=' border: gray 1px solid;'>Number</th>");
									out.print("<th style=' border: gray 1px solid;'>Owner</th>");
									out.print("<th style=' border: gray 1px solid;'>Credit Limit</th>");
									out.print("<th style=' border: gray 1px solid;'>Update</th>");
									out.print("<th style=' border: gray 1px solid;'>Delete</th>");
									out.print("</tr>");

									head = true;

								}

								out.print("<tr style='color: gray'>");
								out.print("<td style=' border: gray 1px solid;'>" + cards.get(i).getNetwork() + "</td>");
								out.print("<td style=' border: gray 1px solid;'>" + cards.get(i).getCardNo() + "</td>");
								out.print("<td style=' border: gray 1px solid;'>" + cards.get(i).getName() + "</td>");
								out.print("<td style=' border: gray 1px solid;'>" + cards.get(i).getCreditLimit() + "</td>");
								out.print(
										"<td style=' border: gray 1px solid;'><button type='button' class='button' onClick=\"Prompt.render('Enter New Credit Limit','" + cards.get(i).getCardNo() + "')\">&#x270E;</button></td>");
								out.print(
										"<td style=' border: gray 1px solid;'><form id='" + cards.get(i).getCardNo() + "' method='post' action='DeleteCreditCardServlet'><input hidden name='id' value='" + cards.get(i).getCardNo() + "'><button type='button' class='button' onClick=\"Confirm.render('Are you sure?','" + cards.get(i).getCardNo() + "')\">&#10006;</button></form></td>");
								out.print("</tr>");

							}

							if (head == false) {

								out.print("<br><br><span style='color: gray; font-size: larger'>No Credit Cards</span>");

							}
						}
					%>
	</table>
	</div>
	</div>
	</main>
	<footer>
	<div class="foot">Copyright © 2018 KREEL AUCTIONS (Pvt) Ltd. All
		rights reserved.</div>
	</footer>
</body>
</html>