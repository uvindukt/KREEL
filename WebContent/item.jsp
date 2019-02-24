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
<title>KREEL AUCTIONS | Item</title>
<%
	HttpSession loggedin = request.getSession(false);

	if (loggedin == null || loggedin.getAttribute("user") == null) {

		response.sendRedirect("login.jsp");

	}

	HttpSession se = request.getSession(false);
	String expDate = (String) se.getAttribute("exp");
	Item item = (Item) se.getAttribute("item");

	if (request.getAttribute("i1") != null && request.getAttribute("i2") != null) {
		item = (Item) request.getAttribute("i1");
	}

	String ghost1 = "", ghost2 = "", ghost3 = "expform";

	if (se.getAttribute("exp") == null) {
		ghost1 = "hidden";
		ghost2 = "disabled";
		ghost3 = "";
	}
%>
<script type="text/javascript">
var countDownDate = new Date("<%=expDate%>").getTime();

	var id = setInterval(function() {

		var now = new Date().getTime();
		var distance = countDownDate - now;

		var days = Math.floor(distance / (1000 * 60 * 60 * 24));
		var hours = Math.floor((distance % (1000 * 60 * 60 * 24))
				/ (1000 * 60 * 60));
		var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
		var seconds = Math.floor((distance % (1000 * 60)) / 1000);

		document.getElementById("timer").innerHTML = days + "d " + hours + "h "
				+ minutes + "m " + seconds + "s ";
		
		if (distance < 0) {
			clearInterval(id);
			document.getElementById("timer").innerHTML = "ITEM EXPIRED";
			if (<%=item.isSold()%> == false) {
				<%se.removeAttribute("items");%>
				document.forms['ref'].submit();
			}
		}

	}, 500);

	function CustomAlert() {

		this.render = function(dialog) {

			var winW = window.innerWidth;
			var winH = window.innerHeight;
			var dialogoverlay = document.getElementById('overlay');
			var dialogbox = document.getElementById('alertbox');

			overlay.style.display = "block";
			overlay.style.height = winH + "px";
			alertbox.style.left = (winW / 2) - (550 * .5) + "px";
			alertbox.style.top = "30%";
			alertbox.style.display = "block";

			document.getElementById('alertboxhead').innerHTML = '<img src="img/logo2.png" width="100vw" height="50vw">';
			document.getElementById('alertboxbody').innerHTML = dialog;
			document.getElementById('alertboxfoot').innerHTML = '<button style="width: 5vw" class="button" onclick="Alert.ok()">OK</button>';

		}

		this.ok = function() {

			document.getElementById('alertbox').style.display = "none";
			document.getElementById('overlay').style.display = "none";
			<%se.removeAttribute("items");%>
			document.forms['ref'].submit();

		}

	}

	var Alert = new CustomAlert();
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
	<%@ page
		import="javax.servlet.http.HttpSession, kreel.model.Item, kreel.model.Item, java.util.ArrayList, kreel.model.CreditCard"%>
	<%
		if (request.getAttribute("result") != null) {
			out.print("<script type='text/javascript'> document.forms['ref'].submit(); </script>");
			out.print("<script type='text/javascript'> Alert.render('" + request.getAttribute("result")
					+ "') </script>");
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
	<main
		style="padding: 1em; display: grid; grid-template-columns: 1fr 1fr;">
	<div>
		<div class="itm">
			<div
				style='position: relative; top: 0; left: 0; right: 0; width: 640px; height: 360px; overflow: hidden'>
				<img src="<%=item.getImagePath()%>"
					style="width: 100%; height: auto">
			</div>
			<div style="text-align: left; padding: 0.5vw">
				<table>
					<tr class="row" <%=ghost1%>>
						<td style="padding: 0.2em"><span style="color: red"><b>Time
									Left</b></span></td>
						<td style="padding: 0.2em">:</td>
						<td style="padding: 0.2em"><p id="timer" class="ti2"></p></td>
					</tr>
					<tr class="row">
						<td style="padding: 0.2em"><span style="color: red"><b>Item
									ID</b></span></td>
						<td style="padding: 0.2em">:</td>
						<td style="padding: 0.2em"><%=item.getItemId()%></td>
					</tr>
					<tr class="row">
						<td style="padding: 0.2em"><span style="color: red"><b>Item
									Name</b></span></td>
						<td style="padding: 0.2em">:</td>
						<td style="padding: 0.2em"><%=item.getItemName()%></td>
					</tr>
					<tr class="row">
						<td style="padding: 0.2em"><span style="color: red"><b>Starting
									Price</b></span></td>
						<td style="padding: 0.2em">:</td>
						<td style="padding: 0.2em"><%=item.getStartingPrice()%></td>
					</tr>
					<tr class="row">
						<td style="padding: 0.2em"><span style="color: red"><b>Highest
									Bid</b></span></td>
						<td style="padding: 0.2em">:</td>
						<td style="padding: 0.2em">
							<%
								if (loggedin.getAttribute("hb") != null) {
									Double highestBid = (Double) loggedin.getAttribute("hb");
									out.print(highestBid);
								} else if (request.getAttribute("i1") != null && request.getAttribute("i2") != null) {
									Double highestBid = (Double) request.getAttribute("i2");
									out.print(highestBid);
								} else {
									out.print("No Bids");
								}
							%>
						</td>
					</tr>
					<tr class="row">
						<td style="padding: 0.2em"><span style="color: red"><b>Category</b></span></td>
						<td style="padding: 0.2em">:</td>
						<td style="padding: 0.2em"><%=item.getCategory()%></td>
					</tr>
					<tr class="row">
						<td style="padding: 0.2em"><span style="color: red"><b>Seller
									ID</b></span></td>
						<td style="padding: 0.2em">:</td>
						<td style="padding: 0.2em"><%=item.getSellerId()%></td>
					</tr>
					<tr class="row">
						<td style="padding: 0.2em"><span style="color: red"><b>Bid
									Duration</b></span></td>
						<td style="padding: 0.2em">:</td>
						<td style="padding: 0.2em"><%=item.getBidDurationD()%> Days <%=item.getBidDurationH()%>
							Hours <%=item.getBidDurationM()%> Minutes</td>
					</tr>
					<tr class="row">
						<td style="padding: 0.2em"><span style="color: red"><b>Description</b></span></td>
						<td style="padding: 0.2em">:</td>
						<td style="padding: 0.2em"><%=item.getDescription()%></td>
					</tr>
					<tr>
						<br>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div hidden>
		<form hidden id="ref" method="post" action="ItemServlet">
			<input hidden type="text" name="itembut"
				value="<%=item.getItemId()%>">
		</form>
	</div>
	<div class="bid-form"
		<%if (item.isSold() == true) {
				out.print("hidden");
			}%>>
		<form method="post" action="BidServlet">
			<input hidden type="text" name="iid" value="<%=item.getItemId()%>">
			<input hidden type="text" name="sp"
				value="<%=item.getStartingPrice()%>"> <input hidden
				type="text" name="bidd" value="<%=item.getBidDurationD()%>">
			<input hidden type="text" name="bidh"
				value="<%=item.getBidDurationH()%>"> <input hidden
				type="text" name="bidm" value="<%=item.getBidDurationM()%>">
			<table class="bid-table">
				<tr class="row">
					<td class="col" style="padding-right: 0">Credit Card</td>
					<td class="col">:</td>
					<td class="col" style="padding-left: 0;"><select required type="text"
						name="cc" class="text-box" style="width: 22.3vw">
							<%
								ArrayList<CreditCard> cards = (ArrayList<CreditCard>) se.getAttribute("cards");
								int i = 0;
								for (i = 0; i < cards.size(); i++) {

									out.print("<option value='" + cards.get(i).getCardNo() + "'>");
									out.print(cards.get(i).getNetwork() + " - " + cards.get(i).getCardNo());
									out.print("</option>");

								}
							%>
					</select></td>
				</tr>
				<tr class="row">
					<td class="col" style="padding-right: 0">Enter Your Bid</td>
					<td class="col">:</td>
					<td class="col" style="padding-left: 0"><input type="text"
						name="bid" class="text-box"
						placeholder="Shoud be greater than current the current bid"
						pattern="[0-9]{1,}||[0-9]{1,}[.]{1}[0-9]{1,2}" required></td>
				</tr>
				<tr class="row">
					<td class="col" colspan="3">
						<input type="submit" value="Place Bid" name="submit" class="button" style="float: right">
						</form>
						<form action="creditcard.jsp">
						<input type="submit" class="button" value="Add Credit Card" style="float: right; margin-right: 3vw">
					</td>
					</form>
				</tr>
			</table>
	</div>
	</main>
		<footer>
		<div class="foot">Copyright © 2018 KREEL AUCTIONS (Pvt) Ltd. All rights reserved.</div>
		</footer>
</body>
</html>