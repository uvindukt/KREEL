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
<title>KREEL AUCTION | Sell</title>
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
	<%@ page import="kreel.model.User"%>
	<%
		if (request.getAttribute("result") != null) {
			out.print("<script type='text/javascript'> Alert.render('" + request.getAttribute("result") + "') </script>");
		}

		HttpSession loggedin = request.getSession(false);

		if (loggedin == null || loggedin.getAttribute("user") == null) {

			request.setAttribute("result", "Please login to continue");
			request.getRequestDispatcher("login.jsp").forward(request, response);

		}

		User usr = (User) loggedin.getAttribute("user");
	%>
	<header>
	<div class="header">
		<img src="img/header.jpg" class="img-header">
		<nav class="container-nav"> <a href="home.jsp" class="navlink">Home</a>
		<a href="sell.jsp" class="navlink active">Sell</a> <a
			href="contact.jsp" class="navlink">Contact</a> <a
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
	<main style="display: grid; grid-template-columns: 1.5fr 1fr">
	<div class="non-reg-container" style="padding: 2vw;">
		<span>
			<h1 style="color: red;">Important</h1>
			<ul>
				<li>If you enter a large <i style="color: red;">Bid
						Duration Time</i> probably item will take long to be sold.
				</li>
				<br>
				<li>If the <i style="color: red;">Bid Duration Time</i> is too
					low you probably won't get the best value for your item.
				</li>
				<br>
				<li>So it's recommended to enter a average <i
					style="color: red;">Bid Duration Time</i> depending on the value of
					your item.
				</li>
				<br>
				<li>After the item has been sold you'll be notified.</li>
			</ul>
		</span>
	</div>
	<div class="reg-container">
		<form method="post" action="SellServlet">
			<table class="reg-table">
				<tr class="row">
					<td class="col">Item Name</td>
					<td class="col"><input type="text" name="iname"
						class="text-box" placeholder="eg. Phillips Hairdryer" required>
					</td>
				</tr>
				<tr class="row">
					<td class="col">Item Category</td>
					<td class="col"><select name="category" class="text-box"
						style="width: 100%">
							<option value="Other">Other</option>
							<option value="Antiques">Antiques</option>
							<option value="Garment">Garment</option>
							<option value="Automobile">Automobile</option>
							<option value="Electronics">Electronics</option>
							<option value="Art">Art</option>
					</select></td>
				</tr>
				<tr class="row">
					<td class="col">Starting Price</td>
					<td class="col"><input type="text" name="sprice"
						class="text-box" placeholder="eg. 2500.00"
						pattern="[0-9]{1,}||[0-9]{1,}[.]{1}[0-9]{1,2}" required></td>
				</tr>
				<tr class="row">
					<td class="col">Bid Duration</td>
					<td class="col"><input type="number" name="bdurationd"
						class="text-box" placeholder="Days" pattern="[0-9]{1,2}" required></td>
				</tr>
				<tr class="row">
					<td class="col"></td>
					<td class="col"><input type="number" name="bdurationh"
						class="text-box" placeholder="Hours" pattern="[0-9]{1,2}" required></td>
				</tr>
				<tr class="row">
					<td class="col"></td>
					<td class="col"><input type="number" name="bdurationm"
						class="text-box" placeholder="Minutes" pattern="[0-9]{1,2}"
						required></td>
				</tr>
				<tr class="row">
					<td class="col">Item Description</td>
					<td class="col"><input type="text" name="idesc"
						class="text-box" placeholder="eg. 230V/150W, 3 Months Warrenty"
						required></td>
				</tr>
				<tr class="row">
					<td class="col">Item Image</td>
					<td class="col"><input type="file" name="iimg"
						accept=".jpg, .jpeg, .png" required></td>
				</tr>
				<tr class="row">
					<td class="col"><input type="reset" name="reset"
						class="button"></td>
					<td class="col"><input type="submit" value="Submit"
						name="submit" class="button"></td>
				</tr>
			</table>
		</form>
	</div>
	</main>
	<footer>
	<div class="foot">Copyright © 2018 KREEL AUCTIONS (Pvt) Ltd. All
		rights reserved.</div>
	</footer>
</body>
</html>