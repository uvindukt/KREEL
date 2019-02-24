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
<title>KREEL AUCTIONS | Login</title>
<script type="text/javascript">
	function AdminLogin() {
		
		var x = document.getElementById('adminlog');
		
		if (x.style.display == "none") {
			x.style.display = "block";
		} else {
			x.style.display = "none";
		}
		
	}
</script>
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
	<div id="adminbox">
		<div>
			<div id="adminhead"></div>
			<div id="adminbody"></div>
			<div id="adminfoot"></div>
		</div>
	</div>
	<%@ page import="javax.servlet.http.HttpSession"%>
	<%
		if (request.getAttribute("result") != null) {
			out.print("<script type='text/javascript'> Alert.render('" + request.getAttribute("result")
					+ "') </script>");
		}

		HttpSession loggedin = request.getSession(false);

		if (loggedin.getAttribute("user") != null) {

			response.sendRedirect("profile.jsp");

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
			class="navlink active"> <%
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
	<div class="pic">
		<img src="img/sda.png"
			style="width: 100%; height: 100%; z-index: 2; transform: translate(-0.5%, 10%)">
	</div>
	<div class="login-container">
		<form method="post" action="LoginServlet">
			<table class="login-rable">
				<tr class="row">
					<td class="col"><input type="email" class="log-box"
						name="email" placeholder="E-Mail" autocomplete="off"></td>
				</tr>
				<tr class="row">

					<td class="col"><input type="password" class="log-box"
						name="pw" placeholder="Password" autocomplete="off"></td>
				</tr>
				<tr class="row">
					<td class="col"><input type="submit" class="button"
						name="log-but" value="Sign In"></td>
				</tr>
			</table>
		</form>
		<p style="color: #800000; font-size: 0.9vw; cursor: pointer; text-decoration: underline" onclick="AdminLogin()">Login As Administrator</p>
		<form method="post" action="AdminServlet">
			<div id="adminlog" style="display: none;"><input type="password" name="code" class="log-box" placeholder="Security Code" style="width: 31%; height: 1.1vw; margin-right: 1vw"><input type="submit" class="button" style="height: 1.3vw" value="Login"></div>
		</form>
	</div>
	</main>
	<footer>
	<div class="foot"
		style="position: absolute; bottom: 0; right: 0; left: 0;">Copyright
		© 2018 KREEL AUCTIONS (Pvt) Ltd. All rights reserved.</div>
	</footer>
</body>
</html>