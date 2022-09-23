


<jsp:include page="header.jsp"></jsp:include>


<div class="container contact_container">
	<div class="row">
		<div class="col">

			<!-- Breadcrumbs -->

			<div class="breadcrumbs d-flex flex-row align-items-center">
				<ul>
					<li><a href="/main">Home</a></li>
					<li class="active"><i class="fa fa-angle-right"
						aria-hidden="true"></i>Contact</a></li>
				</ul>
			</div>

		</div>
	</div>

	<!-- Map Container -->

	<div class="row">
		<div class="col">
			<div class="map_container">
				<div id="map" style="width: 100%; height: 600px;"></div>
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cef989f3a7776ee7b40c53b31db405fa"></script>
				<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					mapOption = {
						center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
						level : 3
					// 지도의 확대 레벨
					};

					var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

					var marker = new kakao.maps.Marker();

					// 타일 로드가 완료되면 지도 중심에 마커를 표시합니다
					kakao.maps.event.addListener(map, 'tilesloaded',
							displayMarker);

					function displayMarker() {

						// 마커의 위치를 지도중심으로 설정합니다 
						marker.setPosition(map.getCenter());
						marker.setMap(map);

						// 아래 코드는 최초 한번만 타일로드 이벤트가 발생했을 때 어떤 처리를 하고 
						// 지도에 등록된 타일로드 이벤트를 제거하는 코드입니다 
						// kakao.maps.event.removeListener(map, 'tilesloaded', displayMarker);
					}
					
				</script>
			</div>
		</div>
	</div>




	<!-- Contact Us -->

	<div class="row">

		<div class="col-lg-6 contact_col">
			<div class="contact_contents">
				<h1>Contact Us</h1>
				<p>There are many ways to contact us. You may drop us a line,
					give us a call or send an email, choose what suits you the most.</p>
				<div>
					<p>(070) 8974-1112</p>
					<p>elesco@gmail.com</p>
				</div>
				
				
				<div>
					<p>Open hours: 8.00-18.00 Mon-Fri</p>
					<p>Sunday: Closed</p>
				</div>
			</div>

			<!-- Follow Us -->

			<div class="follow_us_contents">
				<h1>Follow Us</h1>
				<ul class="social d-flex flex-row">
					<li><a href="#" style="background-color: #3a61c9"><i
							class="fa fa-facebook" aria-hidden="true"></i></a></li>
					<li><a href="#" style="background-color: #41a1f6"><i
							class="fa fa-twitter" aria-hidden="true"></i></a></li>
					<li><a href="#" style="background-color: #fb4343"><i
							class="fa fa-google-plus" aria-hidden="true"></i></a></li>
					<li><a href="#" style="background-color: #8f6247"><i
							class="fa fa-instagram" aria-hidden="true"></i></a></li>
				</ul>
			</div>

		</div>

		<!-- <div class="col-lg-6 get_in_touch_col">
				<div class="get_in_touch_contents">
					<h1>Get In Touch With Us!</h1>
					<p>Fill out the form below to recieve a free and confidential.</p>
					<form action="post">
						<div>
							<input id="input_name" class="form_input input_name input_ph" type="text" name="name" placeholder="Name" required="required" data-error="Name is required.">
							<input id="input_email" class="form_input input_email input_ph" type="email" name="email" placeholder="Email" required="required" data-error="Valid email is required.">
							<input id="input_website" class="form_input input_website input_ph" type="url" name="name" placeholder="Website" required="required" data-error="Name is required.">
							<textarea id="input_message" class="input_ph input_message" name="message"  placeholder="Message" rows="3" required data-error="Please, write us a message."></textarea>
						</div>
						<div>
							<button id="review_submit" type="submit" class="red_button message_submit_btn trans_300" value="Submit">send message</button>
						</div>
					</form>
				</div>
			</div> -->

	</div>
</div>


<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>

