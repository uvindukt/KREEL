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
<title>KREEL AUCTIONS | Home</title>
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
		import="javax.servlet.http.HttpSession, kreel.model.Item, java.util.ArrayList"%>
	<%
		HttpSession loggedin = request.getSession(false);
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
			class="navlink"> <%
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
	<main>
	<div style="display: block; padding: 1em; text-align: center">
		<%
			if (request.getAttribute("it") != null) {

				ArrayList<Item> items = (ArrayList<Item>) request.getAttribute("it");
				String availability;

				for (int i = 0; i < items.size(); i++) {
					if (items.get(i).isSold() == false) {
						availability = "Available";
					} else {
						availability = "Sold";
					}
					out.print("<div class='item-div'>");
					out.print(
							"<div style='position: relative; top: 0; left: 0; right: 0; width: 353px; height: 180px; overflow: hidden'>");
					out.print("<img src='" + items.get(i).getImagePath() + "' style='width: 100%; height: auto'>");
					out.print("</div><br>");
					out.print("<span style='color: red'><b>Item Name : </b></span>" + items.get(i).getItemName()
							+ "<br>");
					if (availability.equals("Sold"))
						out.print(
								"<span style='color: red'><b>Availability : </b></span><span style='color: blue; font-weight: bold'><i>"
										+ availability + "</i></span><br>");
					else
						out.print("<span style='color: red'><b>Availability : </b></span>" + availability + "<br>");
					out.print("<span style='color: red'><b>Starting Price : </b></span>"
							+ items.get(i).getStartingPrice() + "<br><br>");
					out.print(
							"<form method='post' action='ItemServlet'><button type='submit' class='button' style='height: 2em; width: 6em; font-size: small' name='itembut' value="
									+ items.get(i).getItemId() + ">More</button></form><br><br>");
					out.print("</div>");
				}
				
				if (items.size() == 0) {
					out.print("<script type='text/javascript'> Alert.render('No items found') </script>");	
				}
				
			}
		%>
	</div>
	</main>
	<footer>
	<div class="foot"
		style="position: fixed; bottom: 0; left: 0; right: 0">Copyright
		© 2018 KREEL AUCTIONS (Pvt) Ltd. All rights reserved.</div>
	</footer>
</body>
</html>