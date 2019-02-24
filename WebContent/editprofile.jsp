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
<title>KREEL AUCTIONS | Edit Profile</title>
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

			response.sendRedirect("login.jsp");

		}
	%>
	<%@ page import="kreel.model.User"%>
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
	<main style="display: grid;grid-template-columns: 1fr 2fr">
	<div class="non-reg-container">
		<form method="post" action="EditProfileServlet">
			<table class="pro-table">
				<tr class="row">
					<td class="col">First Name</td>
					<td class="col"><input type="text" name="fname"
						class="text-box" placeholder="eg. John"></td>
				</tr>
				<tr class="row">
					<td class="col">Last Name</td>
					<td class="col"><input type="text" name="lname"
						class="text-box" placeholder="eg. Doe"></td>
				</tr>
				<tr class="row">
					<td class="col">E-Mail</td>
					<td class="col"><input type="email" name="email"
						class="text-box" placeholder="eg. john.d@gmail.com"></td>
				</tr>
				<tr class="row">
					<td class="col">Date of Birth</td>
					<td class="col"><input type="date" name="dob" class="text-box"></td>
				</tr>
				<tr class="row">
					<td class="col">Telephone No.</td>
					<td class="col"><input type="number" name="tel"
						class="text-box" placeholder="eg. 0775002685"></td>
				</tr>
				<tr class="row">
					<td class="col">Address</td>
					<td class="col"><input type="text" name="no" class="text-box"
						placeholder="Postal Number"></td>
				</tr>
				<tr class="row">
					<td class="col"></td>
					<td class="col"><input type="text" name="st" class="text-box"
						placeholder="Street"></td>
				</tr>
				<tr class="row">
					<td class="col"></td>
					<td class="col"><input type="text" name="ct" class="text-box"
						placeholder="City"></td>
				</tr>
				<tr class="row">
					<td class="col"></td>
					<td class="col"><input type="text" name="di" class="text-box"
						placeholder="District"></td>
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
	<div class="reg-container"
		style="font-size: 300%; text-align: center; padding: 2em; color: red; font-family: Calibri; animation-name: blink; animation-duration: 1s; animation-direction: alternate; animation-iteration-count: infinite; animation-timing-function: ease-in-out;">
		<%
			String result = (String) request.getAttribute("result");
			if (result != null)
				out.print("<script> Alert.render('" + result + "') </script>");
		%>
	</div>
	</main>
	<footer>
	<div class="foot">Copyright © 2018 KREEL AUCTIONS (Pvt) Ltd. All
		rights reserved.</div>
	</footer>
</body>
</html>