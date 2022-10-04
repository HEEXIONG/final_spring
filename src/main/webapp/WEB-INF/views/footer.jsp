<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="footer_nav_container d-flex flex-sm-row flex-column align-items-center justify-content-lg-start justify-content-center text-center">
						<ul class="footer_nav">
							<li><a href="#">Blog</a></li>
							<li><a href="/board/faq">FAQs</a></li>
							<li><a href="/contact">Contact us</a></li>
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
<script src="/resources/elesco/js/custom.js"></script>
<!-- <SCRIPT SRC="HTTPS://MAPS.GOOGLEAPIS.COM/MAPS/API/JS?V=3.EXP&KEY=AIZASYCIWF204LFZG1Y4KPSIHKAHEXMLYXXUMHA"></SCRIPT> -->
<script src="/resources/elesco/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<script src="/resources/elesco/js/contact_custom.js"></script>
<!-- Channel Plugin Scripts -->
<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "2b7df929-35a8-43dc-9292-2312922bf727"
  });
</script>
<!-- End Channel Plugin -->
</body>

</html>