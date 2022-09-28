<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    .faqHeader {
        font-size: 27px;
        margin: 20px;
    }

    .panel-heading [data-toggle="collapse"]:after {
        font-family: 'Glyphicons Halflings';
        content: "\e072"; /* "play" icon */
        float: right;
        color: #F58723;
        font-size: 18px;
        line-height: 22px;
        /* rotate "play" icon from > (right arrow) to down arrow */
        -webkit-transform: rotate(-90deg);
        -moz-transform: rotate(-90deg);
        -ms-transform: rotate(-90deg);
        -o-transform: rotate(-90deg);
        transform: rotate(-90deg);
    }

    .panel-heading [data-toggle="collapse"].collapsed:after {
        /* rotate "play" icon from > (right arrow) to ^ (up arrow) */
        -webkit-transform: rotate(90deg);
        -moz-transform: rotate(90deg);
        -ms-transform: rotate(90deg);
        -o-transform: rotate(90deg);
        transform: rotate(90deg);
        color: #454444;
    }
    
    .h1title {
    	margin-top: 2rem;
    }
    
    a {
    	color: black !important;
    }
</style>
<body>
<jsp:include page="../header.jsp"></jsp:include>

<div class="row" align="center">
	<div class="col-lg-12">
		<h1 class="page-header" onclick="location.href='list'">FAQ</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<div class="container">

<div class="page-header">
    <h1 class="h1title">자주 묻는 질문</h1>
</div>

<!-- Bootstrap FAQ - START -->
<div class="container">
    <br />

    <div class="alert alert-warning alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        자주 묻는 질문 게시물들을 확인할 수 있습니다.
    </div>


    <div class="panel-group" id="accordion">
        <!-- <div class="faqHeader">General questions</div> -->
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">A/S는 어떻게 받을 수 있나요?</a>
                </h4>
            </div>
            <div id="collapseOne" class="panel-collapse collapse in">
                <div class="panel-body">
			                    설치 상품(TV,냉장고, 세탁기, 에어컨, PC)등은 브랜드(삼성, LG, 대우 등) A/S센터에서 A/S가능하며 소형 상품(선풍기, 밥솥, 청소기 등)은 가까운 전국 ELESCO 매장 및 쇼핑몰 App을 통해서 A/S 받으실 수 있습니다. 
			                    단, 상품별 · 제조사별 A/S가능 센터가 상이할 수 있으므로 고객센터로 문의주시면 안내 도와드리겠습니다.
                </div>
            </div>
        </div>
        <hr>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTen">다른 곳에서 구매한 제품도 A/S가 가능한가요?</a>
                </h4>
            </div>
            <div id="collapseTen" class="panel-collapse collapse">
                <div class="panel-body">
                    	ELESCO에서 취급하는 상품이라면 온/오프라인 구매처에 관계없이 모두 A/S 접수가 가능합니다. 단, 상품의 브랜드에 따라 수리가 지연되거나 불가할 수 있습니다. 
                    	보다 자세한 사항은 고객님께서 가지고 계신 제품의 모델명과 제조사를 확인하신 후, 해당 서비스센터에 문의 부탁드립니다.
                </div>
            </div>
        </div>
        <hr>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseEleven">회원가입은 어떻게 하나요?</a>
                </h4>
            </div>
            <div id="collapseEleven" class="panel-collapse collapse">
                <div class="panel-body">
                    	회원가입은 하이마트쇼핑몰 PC웹사이트 및 모바일 사이트에서 가능합니다.
                </div>
            </div>
        </div>
		<hr>
        <!-- <div class="faqHeader">Sellers</div> -->
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">제품을 구매한지 얼마 되지 않았는데 무상 수리가 가능한가요?</a>
                </h4>
            </div>
            <div id="collapseTwo" class="panel-collapse collapse">
                <div class="panel-body">
                    	무상 수리기간 내에도 제품 제조상의 하자가 아닌 고객님의 과실로 인하여 문제가 발생한 경우에는 수리비가 청구될 수 있습니다.
                </div>
            </div>
        </div>
        <hr>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">수리 비용이 얼마나 나오나요?</a>
                </h4>
            </div>
            <div id="collapseThree" class="panel-collapse collapse">
                <div class="panel-body">
                    	고장 부위에 따라 상이합니다. 서비스센터에서 증상을 확인한 후 고객님께 전화로 안내드립니다.
                </div>
            </div>
        </div>
        <hr>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFive">수리 기간은 얼마나 걸리나요?</a>
                </h4>
            </div>
            <div id="collapseFive" class="panel-collapse collapse">
                <div class="panel-body">
                  		일반적으로 수리 기간은 일주일 정도 소요됩니다. 하지만 수리에 필요한 부품 수급이 어렵거나, 브랜드 서비스센터로 제품을 이관하는 등의 예외 상황에는 수리 기간이 더 길어질 수도 있습니다. 
                  	  	수리 지연 시 고객님께 알림톡이나 문자로 진행 상황을 알려드립니다.
                </div>
            </div>
        </div>
        <hr>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseSix">ELESCO 쇼핑몰의 배송단계는 어떻게 되나요?</a>
                </h4>
            </div>
            <div id="collapseSix" class="panel-collapse collapse">
                <div class="panel-body">
                    	배송단계는 주문접수 > 입금대기 > 결제완료 > 상품준비중 > 발송완료 > 배송완료 로 진행됩니다.
                    <ul>
                        <li>입금대기 : 주문이 완료되었으나 결제가 완료되지 않았습니다. 주문일1일까지 미입금시 주문은 자동취소됩니다.</li>
                        <li>결제완료 : 신용카드 결제승인 또는 상품대금 입금이 확인되었습니다.</li>
                        <li>상품준비중 : 주문을 확인하고 발송 준비중입니다.</li>
                        <li>발송완료 : 상품이 발송되어 고객님께 배송중입니다.</li>
                        <li>배송완료 : 상품이 고객님께 전달되었습니다.</li>
                    </ul>
                </div>
            </div>
        </div>
        <hr>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseEight">설치 비용이 따로 발생하나요?</a>
                </h4>
            </div>
            <div id="collapseEight" class="panel-collapse collapse">
                <div class="panel-body">
                    	하이마트는 무료배송이 원칙이나 배송지역 및 설치환경에 따라 추가 비용이 발생 할 수 있습니다.
						<ul>
							<li>※ 배송지 특성에 따라, 고객님께 추가비용 부담이 발생할 수 있습니다.</li>
							<li>(산간벽지, 섬 지역 배송, 에어컨 설치 시 배관, 타공 추가 등)</li>
						</ul>
                </div>
            </div>
        </div>
        <hr>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseNine">가전제품을 구매하려는데, 설치는 어떻게 받나요?</a>
                </h4>
            </div>
            <div id="collapseNine" class="panel-collapse collapse">
                <div class="panel-body">
                   <ul>
                   		<li>구매하신 제품이 설치 대상 상품이고 하이마트 배송인 경우, 하이마트 전문기사가 무료로 직접 배송부터 설치까지 해드립니다. 삼성전자 및 LG전자에서 직접 배송되는 경우 해당 업체의 기사가 설치해드립니다.</li>
                   		<li>※ 단, 택배상품 및 전자레인지, 밥솥, 청소기 등의 소형 가전은 설치 대상에서 제외되며, 가스레인지는 반드시 자격을 갖춘 가스사업소에서 설치받으셔야하는 상품으로 설치가능 상품에서 제외됩니다.</li>
                   </ul>
                </div>
            </div>
        </div>
		<hr>
        <!-- <div class="faqHeader">Buyers</div> -->
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">섬에도 배송이 되나요?</a>
                </h4>
            </div>
            <div id="collapseFour" class="panel-collapse collapse">
                <div class="panel-body">
                   	배송지가 섬일 경우, 선착장까지만 배송가능합니다.
                </div>
            </div>
        </div>
        <hr>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven">해외 배송지로 배송 가능한가요?</a>
                </h4>
            </div>
            <div id="collapseSeven" class="panel-collapse collapse">
                <div class="panel-body">
                    	죄송합니다. ELESCO는 해외배송은 불가능합니다.
                </div>
            </div>
        </div>
    </div>
</div>



<!-- Bootstrap FAQ - END -->

</div>

</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>