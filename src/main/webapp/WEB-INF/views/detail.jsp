<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Single Product</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Colo Shop Template">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/resources/elesco/styles/bootstrap4/bootstrap.min.css">
<link href="/resources/elesco/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/resources/elesco/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="/resources/elesco/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="/resources/elesco/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" href="/resources/elesco/plugins/themify-icons/themify-icons.css">
<link rel="stylesheet" type="text/css" href="/resources/elesco/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="/resources/elesco/styles/single_styles.css">
<link rel="stylesheet" type="text/css" href="/resources/elesco/styles/single_responsive.css">
</head>

<body>

<div class="super_container">

	<!-- Header -->

	<header class="header trans_300">
<!-- Main Navigation -->

		<div class="main_nav_container">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-right">
						<div class="logo_container">
							<a href="/main">Elesco<span style="color: #a39292">co</span></a>
						</div>
						<nav class="navbar">
							<%-- <ul class="navbar_menu">
								<li><a href="/main">home</a></li>
								<li><a href="#">shop</a></li>
								<li><a href="#">notice</a></li>
								<li><a href="/qna/list">Q&A</a></li>
								<li><a href="#">Review</a></li>
								<li><a href="/contact">Contact</a></li>
								 <sec:authorize access="isAnonymous()">
								<li><a href="/customLogin1">Login</a></li>
								</sec:authorize>
								 <sec:authorize access="isAuthenticated()">
								<li><a href="/customLogout">Logout</a></li>
								</sec:authorize>
							</ul> --%>
							<ul class="navbar_menu">
								<li><a href="/main">home</a></li>
								<li><a href="/board/list">notice</a></li>
								<li><a href="/qna/list">Q&A</a></li>
								<li><a href="/group/list">Review</a></li>
								<li><a href="/contact">Contact</a></li>
								 <sec:authorize access="isAnonymous()">
								<li><a href="/customLogin1">Login</a></li>
								</sec:authorize>
								 <sec:authorize access="isAuthenticated()">
								<li><a href="/customLogout">Logout</a></li>
								</sec:authorize>
							</ul>
							<ul class="navbar_user">
								<li><a href="#"><i class="fa fa-search" aria-hidden="true"></i></a></li>
								<sec:authorize access="isAnonymous()">
								<li><a href="/mypage/list"><i class="fa fa-user" aria-hidden="true"></i></a></li>
								</sec:authorize>
								<sec:authorize access="isAuthenticated()">
								<li><a href="/mypage/list"><i class="fa fa-user" aria-hidden="true"></i></a></li>
								</sec:authorize>
								<sec:authorize access="isAnonymous()">
								<li class="checkout"><a href="/customLogin1"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a></li>
								</sec:authorize>
								<sec:authorize access="isAuthenticated()">
								<li class="checkout"><a href="/cart/list"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a></li>
								</sec:authorize>
							</ul>
							<div class="hamburger_container">
								<i class="fa fa-bars" aria-hidden="true"></i>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</div>

	</header>

	<div class="fs_menu_overlay"></div>
	<div class="hamburger_menu">
		<div class="hamburger_close"><i class="fa fa-times" aria-hidden="true"></i></div>
		<div class="hamburger_menu_content text-right">
			<ul class="menu_top_nav">
				
				<li class="menu_item has-children">
					<a href="#">
						My Account
						<i class="fa fa-angle-down"></i>
					</a>
					<ul class="menu_selection">
						<sec:authorize access="isAnonymous()">
						<li><a href="/customLogin1"><i class="fa fa-sign-in" aria-hidden="true"></i>Login</a></li>
						<li><a href="/users/insert"><i class="fa fa-user-plus" aria-hidden="true"></i>Register</a></li>
						</sec:authorize>
						 <sec:authorize access="isAuthenticated()">
						 <li><a href="/customLogout"><i class="fa fa-sign-in" aria-hidden="true"></i>Logout</a></li>
						 </sec:authorize>
					</ul>
				</li>
				<li class="menu_item"><a href="/main">home</a></li>
				<li class="menu_item"><a href="#">shop</a></li>
				<li class="menu_item"><a href="#">notice</a></li>
				<li class="menu_item"><a href="/qna/list">Q&A</a></li>
				<li class="menu_item"><a href="/contact">contact</a></li>
			</ul>
		</div>
	</div>
	<div class="container single_product_container">
		<div class="row">
			<div class="col">

				<!-- Breadcrumbs -->

				<div class="breadcrumbs d-flex flex-row align-items-center">
					<ul>
						<li><a href="/main">Elesco</a></li>
						<li class="active"><a href="#"><i class="fa fa-angle-right" aria-hidden="true"></i>Single Product</a></li>
					</ul>
				</div>

			</div>
		</div>

		<div class="row">
			<div class="col-lg-7">
				<div class="single_product_pics">
					<div class="row">
						<div class="col-lg-3 thumbnails_col order-lg-1 order-2">
							<!--<div class="single_product_thumbnails">
								<ul>
									<li><img src="images/single_1_thumb.jpg" alt="" data-image="images/single_1.jpg"></li>
									<li class="active"><img src="images/single_2_thumb.jpg" alt="" data-image="images/single_2.jpg"></li>
									<li><img src="images/single_3_thumb.jpg" alt="" data-image="images/single_3.jpg"></li>
								</ul>
							</div>-->
						</div>
						<div class="col-lg-9 image_col order-lg-2 order-1">
							<div class="single_product_image">
								<div class="single_product_image_background" style="background-image:url(resources/elesco/images/pd1.jpg)"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-5">
				<div class="product_details">
					<div class="product_details_title">
						<h2>${read.title}</h2>
						<p>${read.content}</p>
					</div>
					<div class="free_delivery d-flex flex-row align-items-center justify-content-center">
						<span class="ti-truck"></span><span>free delivery</span>
					</div>
					<div class="product_price">${read.price}</div>
					<div class="red_button add_to_cart_button"><a href="#">add to cart</a></div>
					<div class="product_color">
						
					<div class="quantity d-flex flex-column flex-sm-row align-items-sm-center">
					</div>
				</div>
			</div>
		</div>

	</div>

	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="footer_nav_container d-flex flex-sm-row flex-column align-items-center justify-content-lg-start justify-content-center text-center">
						<ul class="footer_nav">
							<li><a href="#">Blog</a></li>
							<li><a href="/board/faq">FAQs</a></li>
							<li><a href="contact.html">Contact us</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="footer_social d-flex flex-row align-items-center justify-content-lg-end justify-content-center">
						<ul>
							<li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
							<li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
							<li><a href="#"><i class="fa fa-skype" aria-hidden="true"></i></a></li>
							<li><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="footer_nav_container">
						<div class="cr">©2022 All Rights Reserverd. Made with Elesco</div>
					</div>
				</div>
			</div>
		</div>
	</footer>

</div>

<script src="/resources/elesco/js/jquery-3.2.1.min.js"></script>
<script src="/resources/elesco/styles/bootstrap4/popper.js"></script>
<script src="/resources/elesco/styles/bootstrap4/bootstrap.min.js"></script>
<script src="/resources/elesco/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="/resources/elesco/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="/resources/elesco/plugins/easing/easing.js"></script>
<script src="/resources/elesco/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<script src="/resources/elesco/js/single_custom.js"></script>
</body>

</html>
