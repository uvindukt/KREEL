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
<script type="text/javascript" src="script/confirm.js"></script>
<title>KREEL AUCTIONS | Admin</title>
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
	<%@ page
		import="javax.servlet.http.HttpSession, kreel.model.Item, java.util.ArrayList, kreel.model.Contact, kreel.model.Bid"%>
	<%
		if (request.getAttribute("result") != null) {
			out.print("<script type='text/javascript'> Alert.render('" + request.getAttribute("result")
					+ "') </script>");
		}

		HttpSession admin = request.getSession(false);

		if (admin == null) {
			request.setAttribute("result", "login as administrator to access Admin Portal");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}

		ArrayList<Contact> feedbacks = (ArrayList<Contact>) admin.getAttribute("feedback");
		ArrayList<Bid> bids = (ArrayList<Bid>) admin.getAttribute("bids");
		ArrayList<Item> items = (ArrayList<Item>) admin.getAttribute("solditems");
	%>
	<header>
	<div class="header">
		<img src="img/header.jpg" class="img-header">
		<nav class="container-nav">
		<form method="post" action="AdminLogoutServlet" id="out">
			<a class="adminlink" onclick="document.forms['out'].submit()">Admin
				Logout</a>
		</form>
		</nav>
		<div class="search">
			<div></div>
		</div>
		<div class="logo">
			<img src="img/logo.png" class="l1">
		</div>
		<div class="logo2">
			<img src="img/logo2.png" class="l2">
		</div>
		<div class="slogan">Your Price, Your Way!</div>
	</div>
	</header>
	<main style="text-align: center">
	<h1
		style="color: #800000; font-family: 'Calibri'; font-weight: lighter;">ADMIN
		DASHBOARD</h1>
	<div
		style="display: grid; padding: 1vw; text-align: center; grid-template-columns: 1fr 1fr; grid-gap: 1vw">
		<div class="admin-div">
			<h2
				style="color: #800000; font-family: 'Calibri'; font-weight: lighter;">User
				Feedback</h2>
			<div style="margin: 2vw">
				<table cellpadding="10vw" class="feedback"
					style="margin: 0; border-collapse: collapse; position: absoulute; width: 100%;">
					<%
						if (admin != null) {

							boolean head = false;

							for (int i = 0; i < feedbacks.size(); i++) {

								if (head == false) {

									out.print("<tr style='color: black;'>");
									out.print("<th style=' border: gray 1px solid;'>Name</th>");
									out.print("<th style=' border: gray 1px solid;'>E-Mail</th>");
									out.print("<th style=' border: gray 1px solid;'>Comment</th>");
									out.print("<th style=' border: gray 1px solid;'>Options</th>");
									out.print("</tr>");

									head = true;

								}

								out.print("<tr style='color: gray'>");
								out.print("<td style=' border: gray 1px solid;'>" + feedbacks.get(i).getFirstName() + "</td>");
								out.print("<td style=' border: gray 1px solid;'>" + feedbacks.get(i).getEmail() + "</td>");
								out.print("<td style=' border: gray 1px solid;'>" + feedbacks.get(i).getComment() + "</td>");
								out.print(
										"<td style=' border: gray 1px solid;'><form id='" + feedbacks.get(i).getId() + feedbacks.get(i).getFirstName() + "' method='post' action='DeleteCommentServlet'><input hidden name='id' value='" + feedbacks.get(i).getId() + "'><button type='button' class='button' onClick=\"Confirm.render('Are you sure?','" + feedbacks.get(i).getId() + feedbacks.get(i).getFirstName() + "')\">&#10006;</button></form></td>");
								out.print("</tr>");

							}

							if (head == false) {

								out.print("<br><br><span style='color: gray; font-size: larger'>No Feedbacks</span>");

							}
						}
					%>
				</table>
			</div>
		</div>
		<div class="admin-div">
			<h2
				style="color: #800000; font-family: 'Calibri'; font-weight: lighter;">Bids</h2>
			<div style="margin: 2vw">
				<form method="post" action="GetBidsServlet">
					<table cellpadding="10vw" class="feedback"
						style="margin: 0; position: absoulute; width: 100%; border: 1px solid gray; padding-top: 1.5vw; padding-bottom: 1.5vw">
						<tr>
							<td class="col">Start Date</td>
							<td class="col">:</td>
							<td class="col"><input type="date" name="sdate"
								class="text-box" required></td>
						</tr>
						<tr>
							<td class="col">End Date</td>
							<td class="col">:</td>
							<td class="col"><input type="date" name="edate"
								class="text-box" required></td>
						</tr>
						<tr>
							<td class="col" colspan="3"><input type="submit"
								value="Get Bids" class="button"></td>
						</tr>
					</table>
				</form>
			</div>
			<div style="margin: 2vw; margin-top: 0vw">
				<table cellpadding="10vw" class="feedback"
					style="margin: 0; border-collapse: collapse; position: absoulute; width: 100%;">

					<%
						if (bids != null) {

							boolean head = false;

							for (int i = 0; i < bids.size(); i++) {

								if (head == false) {

									out.print("<tr style='color: black;'>");
									out.print("<th style=' border: gray 1px solid;'>Item ID</th>");
									out.print("<th style=' border: gray 1px solid;'>E-Mail</th>");
									out.print("<th style=' border: gray 1px solid;'>Amount</th>");
									out.print("</tr>");

									head = true;

								}

								out.print("<tr style='color: gray'>");
								out.print("<td style=' border: gray 1px solid;'>" + bids.get(i).getItemId() + "</td>");
								out.print("<td style=' border: gray 1px solid;'>" + bids.get(i).getBidder() + "</td>");
								out.print("<td style=' border: gray 1px solid;'>" + bids.get(i).getBid() + "</td>");
								out.print("</tr>");

							}

							if (head == false) {

								out.print(
										"<br><br><span style='color: gray; font-size: larger'>No Bids Between those dates</span>");

							}
						}
					%>

				</table>
			</div>
		</div>
		<div class="admin-div" id="solditems">
			<h2
				style="color: #800000; font-family: 'Calibri'; font-weight: lighter;">Sold
				Items</h2>
			<div style="margin: 2vw">
				<table cellpadding="10vw" class="feedback"
					style="margin: 0; border-collapse: collapse; position: absoulute; width: 100%;">
<%
						if (admin != null) {

							boolean head = false;

							for (int i = 0; i < items.size(); i++) {

								if (head == false) {

									out.print("<tr style='color: black;'>");
									out.print("<th style=' border: gray 1px solid;'>Name</th>");
									out.print("<th style=' border: gray 1px solid;'>Seller E-Mail</th>");
									out.print("<th style=' border: gray 1px solid;'>Category</th>");
									out.print("<th style=' border: gray 1px solid;'>Buyer E-Mail</th>");
									out.print("<th style=' border: gray 1px solid;'>Options</th>");
									out.print("</tr>");

									head = true;

								}

								out.print("<tr style='color: gray'>");
								out.print("<td style=' border: gray 1px solid;'>" + items.get(i).getItemName() + "</td>");
								out.print("<td style=' border: gray 1px solid;'>" + items.get(i).getSellerId() + "</td>");
								out.print("<td style=' border: gray 1px solid;'>" + items.get(i).getCategory() + "</td>");
								out.print("<td style=' border: gray 1px solid;'>" + items.get(i).getSoldTo() + "</td>");
								out.print(
										"<td style='border: gray 1px solid;'><form id='" + items.get(i).getItemId() + items.get(i).getItemName() + "' method='post' action='DeleteItemServlet'><input hidden name='id' value='" + items.get(i).getItemId() + "'><button type='button' class='button' onClick=\"Confirm.render('Are you sure?','" + items.get(i).getItemId() + items.get(i).getItemName() + "')\">&#10006;</button></form></td>");
								out.print("</tr>");

							}

							if (head == false) {

								out.print("<br><br><span style='color: gray; font-size: larger'>No Sold Items</span>");

							}
						}
					%>
				</table>
			</div>
		</div>
	</div>
	</main>
	<footer>
	<div class="foot">Copyright © 2018 KREEL AUCTIONS (Pvt) Ltd. All
		rights reserved.</div>
	</footer>
</body>
</html>