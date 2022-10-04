<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

   <jsp:include page="../header.jsp"></jsp:include>
   <!-- Slider -->

   <div class="main_slider" style="background-image:url(../resources/elesco/images/test1.jpg)">
      <div class="container fill_height">
         <div class="row align-items-center fill_height">
            <div class="col">
               <div class="main_slider_content">
                  <h6>Spring / Summer Collection 2022</h6>
                  <h1>Get up to 30% Off</h1>
                  
               </div>
            </div>
         </div>
      </div>
   </div>

   <!-- Banner -->

   <!-- Best Sellers -->

   <div class="best_sellers">
      <div class="container">
         <div class="row">
            <div class="col text-center">
               <div class="section_title new_arrivals_title">
                  <h2>Best Sellers</h2>
               </div>
            </div>
         </div>
         <div class="row">
            <div class="col">
               <div class="product_slider_container">
                  <div class="owl-carousel owl-theme product_slider">

                      <!-- Slide 1 -->
					<c:forEach items="${list}" var="PdVo" begin="0" end="9">
                     <div class="owl-item product_slider_item">
                        <div class="product-item women">
                           <div class="product">
                              <div class="product_image">
                                 <img src="..\resources\img\image.png" alt="" style="height: 220px">
                              </div>
                              <div class="favorite"></div>
                              <div class="product_info">
                                 <h6 class="product_name"><a href='detail?pd_code=${PdVo.pd_code}'>${PdVo.pd_title}</a></h6>
                                 <div class="product_price">$ ${PdVo.price} 원</div>
                              </div>
                           </div>
                        </div>
                     </div>
					</c:forEach>   
					
					<div class="owl-item product_slider_item">
                        <div class="product-item women">
                           <div class="product">
                              <div class="product_image">
                                 <img src="/resources/elesco/images/pd2.jpg" alt="" style="height: 220px">
                              </div>
                              <div class="favorite"></div>
                              <div class="product_info">
                                 <h6 class="product_name"><a href="single.html">Samsung CF591 Series Curved 27-Inch FHD Monitor</a></h6>
                                 <div class="product_price">$610.00</div>
                              </div>
                           </div>
                        </div>
                     </div>

                     <!-- Slide 3 -->

                     <div class="owl-item product_slider_item">
                        <div class="product-item women">
                           <div class="product">
                              <div class="product_image">
                                 <img src="/resources/elesco/images/pd3.png" alt="" style="height: 220px">
                              </div>
                              <div class="favorite"></div>
                              <div class="product_info">
                                 <h6 class="product_name"><a href="single.html">Blue Yeti USB Microphone Blackout Edition</a></h6>
                                 <div class="product_price">$120.00</div>
                              </div>
                           </div>
                        </div>
                     </div>

                     <!-- Slide 4 -->

                     <div class="owl-item product_slider_item">
                        <div class="product-item accessories">
                           <div class="product">
                              <div class="product_image">
                                 <img src="/resources/elesco/images/pd4.png" alt="" style="height: 220px">
                              </div>
                              <div class="favorite favorite_left"></div>
                              <div class="product_info">
                                 <h6 class="product_name"><a href="single.html">DYMO LabelWriter 450 Turbo Thermal Label Printer</a></h6>
                                 <div class="product_price">$410.00</div>
                              </div>
                           </div>
                        </div>
                     </div>

                     <!-- Slide 5 -->

                     <div class="owl-item product_slider_item">
                        <div class="product-item women men">
                           <div class="product">
                              <div class="product_image">
                                 <img src="/resources/elesco/images/pd5.png" alt="" style="height: 220px">
                              </div>
                              <div class="favorite"></div>
                              <div class="product_info">
                                 <h6 class="product_name"><a href="single.html">Pryma Headphones, Rose Gold & Grey</a></h6>
                                 <div class="product_price">$180.00</div>
                              </div>
                           </div>
                        </div>
                     </div>

                     <!-- Slide 6 -->

                     <div class="owl-item product_slider_item">
                        <div class="product-item accessories">
                           <div class="product discount">
                              <div class="product_image">
                                 <img src="/resources/elesco/images/pd6.png" alt="" style="height: 220px">
                              </div>
                              <div class="favorite favorite_left"></div>
                              <div class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center"></div>
                              <div class="product_info">
                                 <h6 class="product_name"><a href="single.html">Fujifilm X100T 16 MP Digital Camera (Silver)</a></h6>
                                 <div class="product_price">$520.00<span>$590.00</span></div>
                              </div>
                           </div>
                        </div>
                     </div>

                     <!-- Slide 7 -->

                     <div class="owl-item product_slider_item">
                        <div class="product-item women">
                           <div class="product">
                              <div class="product_image">
                                 <img src="/resources/elesco/images/pd7.png" alt="" style="height: 220px">
                              </div>
                              <div class="favorite"></div>
                              <div class="product_info">
                                 <h6 class="product_name"><a href="single.html">Samsung CF591 Series Curved 27-Inch FHD Monitor</a></h6>
                                 <div class="product_price">$610.00</div>
                              </div>
                           </div>
                        </div>
                     </div>

                     <!-- Slide 8 -->

                     <div class="owl-item product_slider_item">
                        <div class="product-item accessories">
                           <div class="product">
                              <div class="product_image">
                                 <img src="/resources/elesco/images/pd8.jpg" alt="">
                              </div>
                              <div class="favorite"></div>
                              <div class="product_info">
                                 <h6 class="product_name"><a href="single.html">Blue Yeti USB Microphone Blackout Edition</a></h6>
                                 <div class="product_price">$120.00</div>
                              </div>
                           </div>
                        </div>
                     </div>

                     <!-- Slide 9 -->

                     <div class="owl-item product_slider_item">
                        <div class="product-item men">
                           <div class="product">
                              <div class="product_image">
                                 <img src="/resources/elesco/images/pd1.jpg" alt="">
                              </div>
                              <div class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center"><span>sale</span></div>
                              <div class="favorite favorite_left"></div>
                              <div class="product_info">
                                 <h6 class="product_name"><a href="single.html">DYMO LabelWriter 450 Turbo Thermal Label Printer</a></h6>
                                 <div class="product_price">$410.00</div>
                              </div>
                           </div>
                        </div>
                     </div>

                     <!-- Slide 10 -->

                     <div class="owl-item product_slider_item">
                        <div class="product-item men">
                           <div class="product">
                              <div class="product_image">
                                 <img src="/resources/elesco/images/pd2.jpg" alt="">
                              </div>
                              <div class="favorite"></div>
                              <div class="product_info">
                                 <h6 class="product_name"><a href="single.html">Pryma Headphones, Rose Gold & Grey</a></h6>
                                 <div class="product_price">$180.00</div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
					               
                  </div>
                  <!-- Slider Navigation -->

                  <div class="product_slider_nav_left product_slider_nav d-flex align-items-center justify-content-center flex-column">
                     <i class="fa fa-chevron-left" aria-hidden="true"></i>
                  </div>
                  <div class="product_slider_nav_right product_slider_nav d-flex align-items-center justify-content-center flex-column">
                     <i class="fa fa-chevron-right" aria-hidden="true"></i>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>


   <!-- New Arrivals -->

   <div class="new_arrivals">
      <div class="container">
         <div class="row">
            <div class="col text-center">
                <div class="section_title new_arrivals_title">
                  <h2>New Arrivals</h2>
               </div>
            </div>
         </div>
         <div class="row align-items-center">
            <div class="col text-center">
               <div class="new_arrivals_sorting">
                  <ul class="arrivals_grid_sorting clearfix button-group filters-button-group">
                     <li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center active is-checked" data-filter="*">all</li>
                    <!--  <li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center" data-filter=".women">women's</li>
                     <li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center" data-filter=".accessories">accessories</li>
                     <li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center" data-filter=".men">men's</li> -->
                  </ul>
               </div>
            </div>
         </div>
         <div class="row">
            <div class="col">
               <div class="product-grid" data-isotope='{ "itemSelector": ".product-item", "layoutMode": "fitRows" }'>

                  <!-- Product 1 -->

                  <div class="product-item men">
                     <div class="product discount product_filter">
                        <div class="product_image">
                           <img src="../resources/elesco/images/pd1.jpg" alt="">
                        </div>
                        <div class="favorite favorite_left"></div>
                        
                        <div class="product_info">
                           <h6 class="product_name"><a href="single.html">Fujifilm X100T 16 MP Digital Camera (Silver)</a></h6>
                           <div class="product_price">$520.00<span>$590.00</span></div>
                        </div>
                     </div>
                     <div class="red_button add_to_cart_button"><a href="#">add to cart</a></div>
                  </div>

                  <!-- Product 2 -->

                  <div class="product-item women">
                     <div class="product product_filter">
                        <div class="product_image">
                           <img src="../resources/elesco/images/pd2.jpg" alt="">
                        </div>
                        <div class="favorite"></div>
                        <div class="product_info">
                           <h6 class="product_name"><a href="single.html">Samsung CF591 Series Curved 27-Inch FHD Monitor</a></h6>
                           <div class="product_price">$610.00</div>
                        </div>
                     </div>
                     <div class="red_button add_to_cart_button"><a href="#">add to cart</a></div>
                  </div>

                  <!-- Product 3 -->

                  <div class="product-item women">
                     <div class="product product_filter">
                        <div class="product_image">
                           <img src="../resources/elesco/images/pd3.png" alt="">
                        </div>
                        <div class="favorite"></div>
                        <div class="product_info">
                           <h6 class="product_name"><a href="single.html">Blue Yeti USB Microphone Blackout Edition</a></h6>
                           <div class="product_price">$120.00</div>
                        </div>
                     </div>
                     <div class="red_button add_to_cart_button"><a href="#">add to cart</a></div>
                  </div>

                  <!-- Product 4 -->

                  <div class="product-item accessories">
                     <div class="product product_filter">
                        <div class="product_image">
                           <img src="../resources/elesco/images/pd4.png" alt="">
                        </div>
                        <div class="favorite favorite_left"></div>
                        <div class="product_info">
                           <h6 class="product_name"><a href="single.html">DYMO LabelWriter 450 Turbo Thermal Label Printer</a></h6>
                           <div class="product_price">$410.00</div>
                        </div>
                     </div>
                     <div class="red_button add_to_cart_button"><a href="#">add to cart</a></div>
                  </div>

                  <!-- Product 5 -->

                  <div class="product-item women men">
                     <div class="product product_filter">
                        <div class="product_image">
                           <img src="../resources/elesco/images/pd5.png" alt="">
                        </div>
                        <div class="favorite"></div>
                        <div class="product_info">
                           <h6 class="product_name"><a href="single.html">Pryma Headphones, Rose Gold & Grey</a></h6>
                           <div class="product_price">$180.00</div>
                        </div>
                     </div>
                     <div class="red_button add_to_cart_button"><a href="#">add to cart</a></div>
                  </div>

                  <!-- Product 6 -->

                  <div class="product-item accessories">
                     <div class="product discount product_filter">
                        <div class="product_image">
                           <img src="../resources/elesco/images/pd6.png" alt="">
                        </div>
                        <div class="favorite favorite_left"></div>
                        <div class="product_info">
                           <h6 class="product_name"><a href="#single.html">Fujifilm X100T 16 MP Digital Camera (Silver)</a></h6>
                           <div class="product_price">$520.00<span>$590.00</span></div>
                        </div>
                     </div>
                     <div class="red_button add_to_cart_button"><a href="#">add to cart</a></div>
                  </div>

                  <!-- Product 7 -->

                  <div class="product-item women">
                     <div class="product product_filter">
                        <div class="product_image">
                           <img src="../resources/elesco/images/pd7.png" alt="">
                        </div>
                        <div class="favorite"></div>
                        <div class="product_info">
                           <h6 class="product_name"><a href="single.html">Samsung CF591 Series Curved 27-Inch FHD Monitor</a></h6>
                           <div class="product_price">$610.00</div>
                        </div>
                     </div>
                     <div class="red_button add_to_cart_button"><a href="#">add to cart</a></div>
                  </div>

                  <!-- Product 8 -->

                  <div class="product-item accessories">
                     <div class="product product_filter">
                        <div class="product_image">
                           <img src="../resources/elesco/images/pd8.jpg" alt="">
                        </div>
                        <div class="favorite"></div>
                        <div class="product_info">
                           <h6 class="product_name"><a href="single.html">Blue Yeti USB Microphone Blackout Edition</a></h6>
                           <div class="product_price">$120.00</div>
                        </div>
                     </div>
                     <div class="red_button add_to_cart_button"><a href="#">add to cart</a></div>
                  </div>

                  <!-- Product 9 -->

                  <div class="product-item men">
                     <div class="product product_filter">
                        <div class="product_image">
                           <img src="../resources/elesco/images/pd1.jpg" alt="">
                        </div>
                        <div class="favorite favorite_left"></div>
                        <div class="product_info">
                           <h6 class="product_name"><a href="single.html">DYMO LabelWriter 450 Turbo Thermal Label Printer</a></h6>
                           <div class="product_price">$410.00</div>
                        </div>
                     </div>
                     <div class="red_button add_to_cart_button"><a href="#">add to cart</a></div>
                  </div>

                  <!-- Product 10 -->

                   <div class="product-item men">
                     <div class="product product_filter">
                        <div class="product_image">
                           <img src="../resources/elesco/images/pd2.jpg" alt="">
                        </div>
                        <div class="favorite"></div>
                        <div class="product_info">
                           <h6 class="product_name"><a href="single.html">Pryma Headphones, Rose Gold & Grey</a></h6>
                           <div class="product_price">$180.00</div>
                        </div>
                     </div>
                     <div class="red_button add_to_cart_button"><a href="#">add to cart</a></div>
                  </div> 
               </div>
            </div>
         </div>
      </div>
   </div>

   <!-- Deal of the week -->



   

   <!-- Benefit -->

   <div class="benefit">
      <div class="container">
         <div class="row benefit_row">
            <div class="col-lg-3 benefit_col">
               <div class="benefit_item d-flex flex-row align-items-center">
                  <div class="benefit_icon"><i class="fa fa-truck" aria-hidden="true"></i></div>
                  <div class="benefit_content">
                     <h6>free shipping</h6>
                     <p>Suffered Alteration in Some Form</p>
                  </div>
               </div>
            </div>
            <div class="col-lg-3 benefit_col">
               <div class="benefit_item d-flex flex-row align-items-center">
                  <div class="benefit_icon"><i class="fa fa-money" aria-hidden="true"></i></div>
                  <div class="benefit_content">
                     <h6>cach on delivery</h6>
                     <p>The Internet Tend To Repeat</p>
                  </div>
               </div>
            </div>
            <div class="col-lg-3 benefit_col">
               <div class="benefit_item d-flex flex-row align-items-center">
                  <div class="benefit_icon"><i class="fa fa-undo" aria-hidden="true"></i></div>
                  <div class="benefit_content">
                     <h6>45 days return</h6>
                     <p>Making it Look Like Readable</p>
                  </div>
               </div>
            </div>
            <div class="col-lg-3 benefit_col">
               <div class="benefit_item d-flex flex-row align-items-center">
                  <div class="benefit_icon"><i class="fa fa-clock-o" aria-hidden="true"></i></div>
                  <div class="benefit_content">
                     <h6>opening all week</h6>
                     <p>8AM - 09PM</p>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>

   <!-- Blogs -->

   

   <!-- Newsletter -->

   <script>
   
   </script>

   <!-- Footer -->
<<jsp:include page="../footer.jsp"></jsp:include>

   