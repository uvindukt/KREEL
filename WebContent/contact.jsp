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
<title>KREEL AUCTIONS | Contact</title>
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
	%>
	<%
		if (request.getAttribute("result") != null) {
			out.print("<script type='text/javascript'> Alert.render('" + request.getAttribute("result") + "') </script>");
		}
	%>
	<%@ page import="kreel.model.User"%>
	<header>
	<div class="header">
		<img src="img/header.jpg" class="img-header">
		<nav class="container-nav"> <a href="home.jsp" class="navlink">Home</a>
		<a href="sell.jsp" class="navlink">Sell</a> <a href="contact.jsp"
			class="navlink active">Contact</a> <a
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
	<div class="cont-wrap">
		<div class="non-cont">
			<div class="cl">
				<div class="cont-logo">
					<img src="img/logo.png" width="160px" height="70px">
				</div>
				<div class="cont-logo2">
					<img src="img/logo2.png" width="180px" height="90px">
				</div>
				<p class="ac">
					245/B, <br> Main Road, <br> Galle.<br>
					<br> <span class="kl">+94 91 3492471</span><br> <span
						class="kl">+94 91 6825157</span>
				</p>
			</div>
		</div>
		<form method="post" action="ContactServlet">
			<div class="cont">
				<div class="cont-col1">
					<input type="text" name="fname" class="log-box" size="30"
						<%if (loggedin != null && loggedin.getAttribute("user") != null) {
				User usr = (User) loggedin.getAttribute("user");
				out.print("value='" + usr.getFirstName() + "'");
				out.print("disabled");
			}%>
						placeholder="First Name" autocomplete="off" required>
				</div>
				<div class="cont-col2">
					<input type="email" name="email" class="log-box" size="30"
						<%if (loggedin != null && loggedin.getAttribute("user") != null) {
				User usr = (User) loggedin.getAttribute("user");
				out.print("value='" + usr.getEmail() + "'");
				out.print("disabled");
			}%>
						placeholder="E-Mail" autocomplete="off" required>
				</div>
				<div class="cont-col3">
					<input type="text" name="tel" pattern="[0-9]{10}" class="log-box"
						size="30"
						<%if (loggedin != null && loggedin.getAttribute("user") != null) {
				User usr = (User) loggedin.getAttribute("user");
				out.print("value='" + usr.getTelephone() + "'");
				out.print("disabled");
			}%>
						placeholder="Telephone" autocomplete="off" required>
				</div>
				<div class="cont-big">
					<textarea name="cmnt" class="txt-ar" placeholder="Comment" autocomplete="off" required></textarea>
				</div>
				<div class="cont-but1">
					<input type="reset" class="button">
				</div>
				<div class="cont-but2">
					<input type="submit" value="Submit" class="button">
				</div>
			</div>
		</form>
	</div>
	</main>
	<footer>
	<div class="foot" class="foot"
		style="position: absolute; bottom: 0; right: 0; left: 0">Copyright
		© 2018 KREEL AUCTIONS (Pvt) Ltd. All rights reserved.</div>
	</footer>
</body>
</html>