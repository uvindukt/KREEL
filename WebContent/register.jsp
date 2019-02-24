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
<title>KREEL AUCTIONS | Register</title>
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

		if (loggedin.getAttribute("user") != null) {

			response.sendRedirect("profile.jsp");

		}
		
		String result = (String) request.getAttribute("result");
		
		if (result != null) {
			out.print("<script type='text/javascript'> Alert.render('" + request.getAttribute("result") + "') </script>");	
		}
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
	<main style="display: grid;grid-template-columns: 2fr 1.3fr">
	<div class="non-reg-container" style="padding: 2vw; padding-right: 4vw">
		<span>
			<h1 style="color: red;">Privacy Notice</h1>
			<p>
				This privacy notice discloses the privacy practices for KREEL
				AUCTION. This privacy notice applies solely to information collected
				by this website. It will notify you of the following:<br>
			<ul type="disc">
				<li>What personally identifiable information is collected from
					you through the website, how it is used and with whom it may be
					shared.<br>
				</li>
				<li>What choices are available to you regarding the use of your
					data.<br>
				</li>
				<li>The security procedures in place to protect the misuse of
					your information.<br>
				</li>
				<li>How you can correct any inaccuracies in the information.</li>
			</ul>
			<h3>Information Collection, Use, and Sharing</h3> We are the sole
			owners of the information collected on this site. We only have access
			to/collect information that you voluntarily give us via email or
			other direct contact from you. We will not sell or rent this
			information to anyone.<br> <br> We will use your
			information to respond to you, regarding the reason you contacted us.
			We will not share your information with any third party outside of
			our organization, other than as necessary to fulfill your request,
			e.g. to ship an order.<br> <br> Unless you ask us not to,
			we may contact you via email in the future to tell you about
			specials, new products or services, or changes to this privacy
			policy.
			<h3>Your Access to and Control Over Information</h3> You may opt out
			of any future contacts from us at any time. You can do the following
			at any time by contacting us via the email address or phone number
			given on our website:<br>
			<ul type="disc">
				<li>what data we have about you, if any.<br></li>
				<li>Change/correct any data we have about you.<br></li>
				<li>Have us delete any data we have about you. Express any
					concern you have about our use of your data.</li>
			</ul>
			<h3>Security</h3>We take precautions to protect your information.
			When you submit sensitive information via the website, your
			information is protected both online and offline.<br> <br>
			Wherever we collect sensitive information (such as credit card data),
			that information is encrypted and transmitted to us in a secure way.
			You can verify this by looking for a lock icon in the address bar and
			looking for "https" at the beginning of the address of the Web page.<br>
			<br> While we use encryption to protect sensitive information
			transmitted online, we also protect your information offline. Only
			employees who need the information to perform a specific job (for
			example, billing or customer service) are granted access to
			personally identifiable information. The computers/servers in which
			we store personally identifiable information are kept in a secure
			environment.<br>
			<h3>If you feel that we are not abiding by this privacy policy,
				you should contact us immediately via telephone at +94 91 3492471 or
				via email.</h3>
			</p>
		</span>
	</div>
	<div class="reg-container" style="padding-top: 2vw">
		<form method="post" action="RegisterServlet">
			<table class="reg-table">
				<tr class="row">
					<td class="col">First Name</td>
					<td class="col"><input type="text" name="fname"
						class="text-box" placeholder="eg. John" autocomplete="off" required></td>
				</tr>
				<tr class="row">
					<td class="col">Last Name</td>
					<td class="col"><input type="text" name="lname"
						class="text-box" placeholder="eg. Doe" autocomplete="off" required></td>
				</tr>
				<tr class="row">
					<td class="col">E-Mail</td>
					<td class="col"><input type="email" name="email"
						class="text-box" placeholder="eg. john.d@gmail.com" autocomplete="off" required>
					</td>
				</tr>
				<tr class="row">
					<td class="col">Password</td>
					<td class="col"><input type="password" name="pw"
						class="text-box"
						placeholder="Use a combination of numbers, letters & sumbols" autocomplete="off" required>
					</td>
				</tr>
				<tr class="row">
					<td class="col">Confirm Password</td>
					<td class="col"><input type="password" name="cpw"
						class="text-box"
						placeholder="Use a combination of numbers, letters & symbols" autocomplete="off" required>
					</td>
				</tr>
				<tr class="row">
					<td class="col">Date of Birth</td>
					<td class="col"><input type="date" name="dob" class="text-box" autocomplete="off"
						required></td>
				</tr>
				<tr class="row">
					<td class="col">Telephone No.</td>
					<td class="col"><input type="text" name="tel" class="text-box"
						pattern="[0-9]{10}" title="Telephone Number should consist of 10 digits" placeholder="eg. 0775002685" autocomplete="off" required></td>
				</tr>
				<tr class="row">
					<td class="col">Bank Name</td>
					<td class="col"><input type="text" name="bank"
						class="text-box" placeholder="eg. BOC" autocomplete="off" required></td>
				</tr>
				<tr class="row">
					<td class="col">Bank Account No.</td>
					<td class="col"><input type="text" name="acc" class="text-box"
						pattern="[0-9]{10,12}" title="Banck Account Number should contain 10 - 12 digits " placeholder="eg. 10-12 digits" autocomplete="off" required></td>
				</tr>
				<tr class="row">
					<td class="col">Address</td>
					<td class="col"><input type="text" name="no" class="text-box" autocomplete="off"
						placeholder="Postal Number" required></td>
				</tr>
				<tr class="row">
					<td class="col"></td>
					<td class="col"><input type="text" name="st" class="text-box" autocomplete="off"
						placeholder="Street" required></td>
				</tr>
				<tr class="row">
					<td class="col"></td>
					<td class="col"><input type="text" name="ct" class="text-box" autocomplete="off"
						placeholder="City" required></td>
				</tr>
				<tr class="row">
					<td class="col"></td>
					<td class="col"><input type="text" name="di" class="text-box" autocomplete="off"
						placeholder="District" required></td>
				</tr>
				<tr>
					<td colspan="2" class="col"><input type="checkbox"
						name="checkbox">&emsp;I have read and agree to the Privacy
						Policy</td>
				</tr>
				<tr class="row">
					<td class="col"><input type="reset" name="reset"
						class="button"></td>
					<td class="col"><input type="submit" name="submit"
						value="Submit" class="button"
						onClick="if(!this.form.checkbox.checked) { Alert.render('You must agree to the terms first.'); return false; }"></td>
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