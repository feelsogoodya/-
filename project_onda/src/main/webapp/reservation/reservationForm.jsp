<%@page import="java.util.List"%>
<%@page import="com.itwillbs.res.db.TableDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Resto - Restaurant Bootstrap 4 Template by GetTemplates.co</title>
    <meta name="description" content="Resto">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- External CSS -->
    <link rel="stylesheet" href="./vendor/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="./vendor/select2/select2.min.css">
    <link rel="stylesheet" href="./vendor/owlcarousel/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdn.rawgit.com/noelboss/featherlight/1.7.13/release/featherlight.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.1/css/brands.css">

    <!-- Fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700|Josefin+Sans:300,400,700">
    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

    <!-- CSS -->
    <link rel="stylesheet" href="./css/style.min.css">

    <!-- Modernizr JS for IE8 support of HTML5 elements and media queries -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="./js/reservation.js"></script>
</head>
<jsp:include page="../inc/headerMenu.jsp"></jsp:include>
<body data-spy="scroll" data-target="#navbar">
<%
List<TableDTO> tableList =  (List<TableDTO>)request.getAttribute("tableList");
%>

<div id="canvas-overlay"></div>
<div class="boxed-page">
<section id="gtco-menu" class="section-padding">
    <div class="container">
        <div class="section-content">
            <div class="row mb-5">
                <div class="col-md-12">
                    <div class="heading-section text-center">
						<h2>RESERVATION</h2><br>						
                    </div>
                    
					<form action="./reservationPro.re" method="post" name="fr" onsubmit="return check()">
                    <div class="row mt-5">
						<div class="col-lg-5 col-md-6 align-self-center py-5">
							<div class="dishes-text">							
								<h5><span>예약 날짜</span></h5>
								<input type="date" class="form-control" name ="res_use_date" id="res_use_date"><br>
							</div>
							
							<div class="dishes-text">
								<h5><span>예약 시간</span></h5>
								<select size="5" class="form-control" id="time" name="time">
									<optgroup label="예약시간">
										<option selected>10:00</option>
										<option>11:00</option>
										<option>12:00</option>
										<option>13:00</option>
										<option>14:00</option>
										<option>15:00</option>
										<option>16:00</option>
										<option>17:00</option>
										<option>18:00</option>
										<option>19:00</option>
										<option>20:00</option>
									</optgroup>
								</select> <br>
							</div>

							<div class="dishes-text">
								<h5><span>예약 인원</span></h5>
								<input type="number" class="form-control" name="person" min="1" max="8" value="1"><br>
							</div>

							<div class="dishes-text">
								<h5><span>예약 테이블</span></h5>
								<input type="number" class="form-control" name="person" min="1" max="8" value="1"><br>
								<select size="5" class="form-control" id="table" name="table">
									<optgroup label="일반" >
									<%
									for(int i=0;i<5;i++){
										TableDTO dto=tableList.get(i);
									%>
									<option><%=dto.getTb_num() %>번 테이블</option>
									<%
									}
									%>
									</optgroup>
									<optgroup label="키즈" >
									<%
									for(int i=5;i<10;i++){
										TableDTO dto=tableList.get(i);
									%>
									<option><%=dto.getTb_num() %>번 테이블</option>
									<%
									}
									%>
									</optgroup>
									
									<optgroup label="야외" >
									<%
									for(int i=10;i<15;i++){
										TableDTO dto=tableList.get(i);
									%>
									<option><%=dto.getTb_num() %>번 테이블</option>
									<%
									}
									%>
									</optgroup>
									
									<optgroup label="단체" >
									<%
									for(int i=15;i<20;i++){
										TableDTO dto=tableList.get(i);
									%>
									<option><%=dto.getTb_num() %>번 테이블</option>
									<%
									}
									%>
									</optgroup>
								</select> <br>
							</div>

							<div class="dishes-text">
								<h6><span class="subheading">단체석의 경우 6인이상 가능합니다.</span></h6>
								<input type="date" class="form-control" name ="res_use_date" id="res_use_date"><br>
								<h5><span>고객성함</span></h5>
								<input type="text" class="form-control" name="name"><br>
								<h5><span>휴대폰 번호</span></h5>
								<input type="text" class="form-control" name="phone" placeholder="ex) 01012345678"><br>
							</div>

							<div class="heading-section text-left">
								<h5 class="special-number">약관동의</h5>
								<input type="checkbox" name="ch" value="이용약관">이용약관 동의(필수)<br><br>
								<div tabindex="0" class="" style="height: 200px; border:1px solid #dfe0df; margin-top: -5px; border-radius: 4px; padding: 12px 14px; overflow-y: auto; background:#fff; color:#000;">
									취소 및 환불 약관<br><br>
									올바른 예약문화 정착을 위하여 예약 취소시 환불 기준을 아래와 같이 운영하고 있으니, 꼭 확인을 하시고 신중하게 예약취속와 변경을 하시기 당부드립니다.<br>
									- 취소 수수료는 예약시점과는 무고나한 이용일 기준입니다. 에약후 바로 환불 요청하셨더라도 취소 환불 규정에 의해 이용일 기준으로 차감되어 환불됩니다.<br>
									- 예약 일자 변경은 기존 예약취소와 동일하므로 전화 변경이 불가하며 홈페이지 예약조회 및 취소 를 통해 기존 예약 취소 후 다시 예약해 주시면 됩니다.<br>
									- 환불정보는 카드결제의 경우 카드사로 확인까지 7~14일정도 소요됩니다.<br>
									- 최종 환불되는 일자는 고객님의 신용카드 결제 일자 및 신용카드사의 환불 규정에 따라 차이가 있을 수 있습니다.<br>
									<pre>
									예약 후 이용일까지 남은 기간   취소수수료<br>
									이용 10일 전까지		없음<br>
									이용 9일 전		총 결제금액의 10% 차감<br>
									이용 8일 전		총 결제금액의 20% 차감<br>
									이용 7일 전		총 결제금액의 30% 차감<br>
									이용 6일 전		총 결제금액의 40% 차감<br>
									이용 5일 전   	총 결제금액의 50% 차감<br>
									이용 4일 전   	총 결제금액의 60% 차감<br>
									이용 3일 전   	총 결제금액의 70% 차감<br>
									이용 2일 전   	총 결제금액의 80% 차감<br>
									이용 1일 전   	총 결제금액의 90% 차감<br>
									이용 당일  	총 결제금액의 100% 차감<br>
									</pre>
								</div>
							</div>  
						</div>	
					</div>

					<input type="submit" class="form-control" name="btn" id="btn"  value="예약하기"> <br>
					</form>
                </div>
            </div>
        </div>
    </div>
</section>
</div>    
</body>
</html>