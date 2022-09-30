<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Elesco</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Elesco">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/resources/elesco/styles/bootstrap4/bootstrap.min.css">
<link href="/resources/elesco/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/resources/elesco/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="/resources/elesco/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="/resources/elesco/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" href="/resources/elesco/plugins/themify-icons/themify-icons.css">
<link rel="stylesheet" type="text/css" href="/resources/elesco/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="/resources/elesco/styles/contact_styles.css">
<link rel="stylesheet" type="text/css" href="/resources/elesco/styles/contact_responsive.css">
<link rel="stylesheet" type="text/css" href="/resources/elesco/styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="/resources/elesco/styles/responsive.css">
</head>

<body>

<div class="super_container">

	<!-- Header -->

	<header class="header trans_300">

		<!-- Top Navigation -->

		

		<!-- Main Navigation -->

		<div class="main_nav_container">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-right">
						<div class="logo_container">
							<a href="/main">Eles<span>co</span></a>
						</div>
						<nav class="navbar">
							<ul class="navbar_menu">
								<li><a href="/main">home</a></li>
								<li><a href="#">shop</a></li>
								<li><a href="#">notice</a></li>
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
