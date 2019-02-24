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
<body class="body">
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

		if (request.getAttribute("result") != null) {
			out.print("<script type='text/javascript'> Alert.render('" + request.getAttribute("result") + "') </script>");
		}
	%>
	<header>
	<div class="header">
		<img src="img/header.jpg" class="img-header">
		<nav class="container-nav" id="nav"> <a href="home.jsp"
			class="navlink active">Home</a> <a href="sell.jsp" class="navlink">Sell</a>
		<a href="contact.jsp" class="navlink">Contact</a> <a
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
	<script type="text/javascript">
		window.onscroll = function() {
			if (window.pageYOffset > 50) {
				document.getElemetById('nav').style.backgroundColor = 'rgba(128, 0, 0, 0.8)';
			} else {
				document.getElemetById('nav').style.backgroundColor = 'transparent';
			}
		}
	</script>
	<main>
	<div class="container">
		<form method="get" id="ant" action="ItemListServlet">
			<div class="contain" onClick="document.forms['ant'].submit();">
				<input hidden type="text" name="type" value="Antiques"> <img
					src="img/ant.jpg" class="img-box">
				<div class="txt">Antiques</div>
				<div class="p">
					One of the things that attracts me to vintage and antique things is
					they have stories, and even if I don't know the stories, I make
					them up.<br>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					- Mary Kay Andrews
				</div>
			</div>
		</form>
		<form method="get" id="gar" action="ItemListServlet">
			<div class="contain" onClick="document.forms['gar'].submit();">
				<input hidden type="text" name="type" value="Garment"> <img
					src="img/garment.jpg" class="img-box">
				<div class="txt">Garment</div>
				<div class="p" style="transform: translate(-50%, 110%)">
					When I design a garment or a piece of accessory, the first question
					I ask myself is, 'Would I wear it?'<br>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					- Tory Burch
				</div>
			</div>
		</form>
		<form method="get" id="car" action="ItemListServlet">
			<div class="contain" onClick="document.forms['car'].submit();">
				<input hidden type="text" name="type" value="Automobile"> <img
					src="img/car.jpg" class="img-box">
				<div class="txt">Automobile</div>
				<div class="p">
					The largest automobile company in the world is Volkswagen. Who owns
					it? The answer is the government of Qatar.<br>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					- Robert Zubrin
				</div>
			</div>
		</form>
		<form method="get" id="elc" action="ItemListServlet">
			<div class="contain" onClick="document.forms['elc'].submit();">
				<input hidden type="text" name="type" value="Electronics"> <img
					src="img/elec.jpg" class="img-box">
				<div class="txt">Electronics</div>
				<div class="p">
					I don't think people change; electronics change, the things we have
					change, but the way we live doesn't change.<br>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					- Judy Blume
				</div>
			</div>
		</form>
		<form method="get" id="art" action="ItemListServlet">
			<div class="contain" onClick="document.forms['art'].submit();">
				<input hidden type="text" name="type" value="Art"> <img
					src="img/art.jpg" class="img-box">
				<div class="txt">Art</div>
				<div class="p" style="transform: translate(-50%, 110%)">
					It is the supreme art of the teacher to awaken joy in creative
					expression and knowledge.<br>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					- Albert Einstein
				</div>
			</div>
		</form>
		<form method="get" id="otr" action="ItemListServlet">
			<div class="contain" onClick="document.forms['otr'].submit();">
				<input hidden type="text" name="type" value="Other"> <img
					src="img/other.jpg" class="img-box">
				<div class="txt">Other</div>
				<div class="p" style="transform: translate(-50%, 45%)">
					Auctions create greater price discovery and liquidity, resulting in
					a very meaningful final auction price. If you were building a
					securities exchange today, an auction would be a core feature.<br>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					- Tyler Winklevoss
				</div>
			</div>
		</form>
	</div>
	</main>
	<footer>
	<div class="foot">Copyright © 2018 KREEL AUCTIONS (Pvt) Ltd. All
		rights reserved.</div>
	</footer>
</body>
</html>