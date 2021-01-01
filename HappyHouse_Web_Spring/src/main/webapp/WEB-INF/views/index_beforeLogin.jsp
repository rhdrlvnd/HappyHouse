<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>HAPPY HOUSE </title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script
	src="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/alertify.min.js"></script>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/alertify.min.css" />
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/themes/default.min.css" />
<style>
#map {
	height: 100%;
}

#option {
	text-align: center;
	margin-top: 10px;
	margin-bottom: 10px;
}

.modal-login {
	color: #636363;
	width: 350px;
}

.modal-login .modal-content {
	padding: 20px;
	border-radius: 5px;
	border: none;
}

.modal-login .modal-header {
	border-bottom: none;
	position: relative;
	justify-content: center;
}

.modal-login h4 {
	text-align: center;
	font-size: 26px;
	margin: 30px 0 -15px;
}

.modal-login .form-control:focus {
	border-color: #70c5c0;
}

.modal-login .form-control, .modal-login .btn {
	min-height: 40px;
	border-radius: 3px;
}

.modal-login .close {
	position: absolute;
	top: -5px;
	right: -5px;
}

.modal-login .modal-footer {
	background: #ecf0f1;
	border-color: #dee4e7;
	text-align: center;
	justify-content: center;
	margin: 0 -20px -20px;
	border-radius: 5px;
	font-size: 13px;
}

.modal-login .modal-footer a {
	color: #999;
}

.modal-login .avatar {
	position: absolute;
	margin: 0 auto;
	left: 0;
	right: 0;
	top: -70px;
	width: 95px;
	height: 95px;
	border-radius: 50%;
	z-index: 9;
	background: #60c7c1;
	padding: 15px;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.1);
}

.modal-login .avatar img {
	width: 100%;
}

.modal-login.modal-dialog {
	margin-top: 80px;
}

.modal-login .btn, .modal-login .btn:active {
	color: #fff;
	border-radius: 4px;
	background: #60c7c1 !important;
	text-decoration: none;
	transition: all 0.4s;
	line-height: normal;
	border: none;
}

.modal-login .btn:hover, .modal-login .btn:focus {
	background: #45aba6 !important;
	outline: none;
}

.inputcondition {
	font-size: 13px;
	color: #999;
}
</style>
</head>

<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top">
		<div
			class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
			<!-- Brand/logo -->
			<a class="navbar-brand" href="#"> <img src="../img/logo.png"
				alt="logo" style="width: 50px" />
			</a>

			<!-- Links -->
			<ul class="navbar-nav navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="#">공지사항</a></li>
				<li class="nav-item"><a class="nav-link" href="#">자유게시판</a></li>
			</ul>
		</div>
		<div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item">
					<form class="form-inline">
						<input class="form-control mr-sm-2" type="text"
							placeholder="검색어를 입력하세요" />
						<button class="btn btn-success" type="submit">검색</button>
					</form>
				</li>
			</ul>
			<div class="col-md-2 mr-2">
				<button type="button" class="btn btn-light" id="SignBtn">
					Sign up</button>
			</div>
			<div class="col-md-1 mr-3">
				<button type="button" class="btn btn-light" id="LoginBtn">
					Login</button>
			</div>
		</div>
	</nav>
	
	<br><br><br>

	<div class="container">
		<center>
			<div class="container row col-lg-6">
				<div class="col-3">
					<select class="form-control" id="sido" name="sellist1">
						<option value="0">선택</option>
					</select>
				</div>
				<div class="col-3">
					<select class="form-control" id="gugun" name="sellist2">
						<option value="0">선택</option>
					</select>
				</div>
				<div class="col-3">
					<select class=" form-control" id="dong" name="sellist3">
						<option value="0">선택</option>
					</select>
				</div>
			</div>
			<hr class="col-6" style="border: 0px; height: 2px; background: #ccc;">
		</center>
	</div>

<section id="index_section">
			<div class="card col-sm-12 mt-1" style="min-height: 850px;">
				<div class="card-body">
				<script>
				
				$(document).ready(function(){
					$.get("${pageContext.request.contextPath}/map"
						,{act:"sido"}
						,function(data, status){
							$.each(data, function(index, vo) {
								$("#sido").append("<option value='"+vo.sido_code+"'>"+vo.sido_name+"</option>");
							});//each
						}//function
						, "json"
					);//get
				});//ready
				$(document).ready(function(){
					$("#sido").change(function() {
						$.get("${pageContext.request.contextPath}/map"
								,{act:"gugun", sido:$("#sido").val()}
								,function(data, status){
									$("#gugun").empty();
									$("#gugun").append('<option value="0">선택</option>');
									$.each(data, function(index, vo) {
										$("#gugun").append("<option value='"+vo.gugun_code+"'>"+vo.gugun_name+"</option>");
									});//each
								}//function
								, "json"
						);//get
					});//change
					$("#gugun").change(function() {
						$.get("${pageContext.request.contextPath}/map"
								,{act:"dong", gugun:$("#gugun").val()}
								,function(data, status){
									$("#dong").empty();
									$("#dong").append('<option value="0">선택</option>');
									$.each(data, function(index, vo) {
										$("#dong").append("<option value='"+vo.dong+"'>"+vo.dong+"</option>");
									});//each
								}//function
								, "json"
						);//get
					});//change
					$("#dong").change(function() {
						$.get("${pageContext.request.contextPath}/map"
								,{act:"apt", dong:$("#dong").val()}
								,function(data, status){
									$("#searchResult").empty();
									$.each(data, function(index, vo) {
										let str = "<tr class="+[index%3]+">"
										+ "<td>" + vo.no + "</td>"
										+ "<td>" + vo.dong + "</td>"
										+ "<td>" + vo.aptName + "</td>"
										+ "<td>" + vo.jibun + "</td>"
										+ "<td>" + vo.code + "</td>"
										+ "<td>" + vo.dealAmount + "</td></tr>";
										$("tbody").append(str);
									//	$("#searchResult").append(vo.dong+" "+vo.aptName+" "+vo.jibun+"<br>");
									});//each
									geocode(data);
								}//function
								, "json"
						);//get
					});//change
				});//ready
			
				
				
				function geocode(jsonData) {
					let idx = 0;
					$.each(jsonData, function(index, vo) {
						let tmpLat;
						let tmpLng;
						$.get("https://maps.googleapis.com/maps/api/geocode/json"
								,{	key:'AIzaSyAfLan0NDK1vGzFCPgbN3QeVNIaMEKKmiE'
									, address:vo.dong+"+"+vo.aptName+"+"+vo.jibun
								}
								, function(data, status) {
									//alert(data.results[0].geometry.location.lat);
									tmpLat = data.results[0].geometry.location.lat;
									tmpLng = data.results[0].geometry.location.lng;
									$("#lat_"+index).text(tmpLat);
									$("#lng_"+index).text(tmpLng);
									addMarker(tmpLat, tmpLng, vo.aptName);
								}
								, "json"
						);//get
					});//each
				}
				</script>
				<table class="table mt-2">
					<thead>
						<tr>
							<th>번호</th>
							<th>법정동</th>
							<th>아파트이름</th>
							<th>지번</th>
							<th>지역코드</th>
							<th>실거래가</th>
						</tr>
					</thead>
					<tbody id = "searchResult">
					</tbody>
				</table>

				<div id="map" style="width: 100%; height: 500px; margin: auto;"></div>
				<script src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
				<script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAfLan0NDK1vGzFCPgbN3QeVNIaMEKKmiE&callback=initMap"></script>
				<script>
					var multi = {lat: 37.5665734, lng: 126.978179};
					var map;
					function initMap() {
						map = new google.maps.Map(document.getElementById('map'), {
							center: multi, zoom: 12
						});
						var marker = new google.maps.Marker({position: multi, map: map});
					}
					function addMarker(tmpLat, tmpLng, aptName) {
						var marker = new google.maps.Marker({
							position: new google.maps.LatLng(parseFloat(tmpLat),parseFloat(tmpLng)),
							label: aptName,
							title: aptName
						});
						marker.addListener('click', function() {
							map.setZoom(17);
							map.setCenter(marker.getPosition());
							callHouseDealInfo();
						});
						marker.setMap(map);
					}
					function callHouseDealInfo() {
						alert("you can call HouseDealInfo");
					}
				</script>
				</div>
			</div>
		</section>


	<br />
	<br />
	<br />

	<!-- login modal -->
	<div id="loginModal" class="modal fade">
		<div class="modal-dialog modal-login">
			<div class="modal-content">
				<div class="modal-header">
					<div class="avatar">
						<img
							src="https://www.tutorialrepublic.com/examples/images/avatar.png"
							alt="Avatar" />
					</div>
					<h4 class="modal-title">Member Login</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<form name="loginForm" action="">
						<div class="form-group">
							<input type="text" class="form-control" id="Lusername"
								name="Lusername" placeholder="Email"
								required="required" />
						</div>
						<div class="form-group">
							<input type="password" class="form-control" id="Lpassword"
								name="Lpassword" placeholder="Password"
								required="required" />
						</div>
						<div class="form-group">
							<button type="button"
								class="btn btn-primary btn-lg btn-block login-btn"
								id="ModalLoginbutton">Login</button>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<a href="#">비밀번호 찾기</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Signin Modal -->
	<div id="SignModal" class="modal fade">
		<div class="modal-dialog modal-login">
			<div class="modal-content">
				<div class="modal-header">
					<div class="avatar">
						<img
							src="https://www.tutorialrepublic.com/examples/images/avatar.png"
							alt="Avatar" />
					</div>
					<h4 class="modal-title">Member Sign up</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<form name="SignForm" action="">
						<div class="form-group">
							<input type="text" class="form-control" id="Susername"
								name="Susername" placeholder="Username" required="required" />
							<div class="inputcondition" id="UserCondition">8글자 이상의
								영대소문자</div>
							<div class="valid-feedback">Valid.</div>
							<div class="invalid-feedback">Please fill out this field.</div>
						</div>
						<div class="form-group">
							<input type="password" class="form-control" id="Spassword"
								name="Spassword" placeholder="Password" required="required" />
							<div class="inputcondition" id="PWCondition">4글자 이상</div>
							<div class="valid-feedback">Valid.</div>
							<div class="invalid-feedback">Please fill out this field.</div>
						</div>
						<div class="form-group">
							<input type="password" class="form-control" id="Spassword2"
								name="Spassword2" placeholder="Password confirm"
								required="required" />
							<div class="valid-feedback">Valid.</div>
							<div class="invalid-feedback">비밀번호가 같지 않습니다.</div>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" id="Sphone" name="Sphone"
								placeholder="Phone number" required="required" />
							<div class="inputcondition" id="PhoneCondition">
								010-000-0000</div>
							<div class="valid-feedback">Valid.</div>
							<div class="invalid-feedback">Please fill out this field.</div>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" id="Semail" name="Semail"
								placeholder="Email" required="required" />
							<div class="valid-feedback">Valid.</div>
							<div class="invalid-feedback">Please fill out this field.</div>
						</div>
						<div class="form-group">
							<button type="button"
								class="btn btn-primary btn-lg btn-block login-btn"
								id="ModalSignbutton">Sign up</button>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<div id="signTologin">
						<a href="#">이미 회원이십니까?</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
      $(document).ready(function() {
         // login modal
         $("#LoginBtn").click(function() {
            $("#loginModal").modal();
         });

         $("#ModalLoginbutton").click(function() {
            if(loginValidate()){
               login();
            }
         });

         // signin modal
         $("#SignBtn").click(function() {
            $("#SignModal").modal();
         });

         $("#ModalSignbutton").click(function() {
            if ($("form").find(".is-invalid").length > 0) {
               alert("입력이 올바르지 않습니다.");
            } else {
               // 성공
               register();
               
               $("#SignModal").modal("hide");
               $("form").each(function() {
                  this.reset();
               });
               $("#Susername").removeClass("is-valid");
               $("#Spassword").removeClass("is-valid");
               $("#Spassword2").removeClass("is-valid");
               $("#Sphone").removeClass("is-valid");
               $("#Semail").removeClass("is-valid");
            }
         });

         $("#signTologin").click(function() {
            $("#SignModal").modal("hide");
            $("#loginModal").modal();
         });

         $("#Susername").focus();

         // manually check
         $("#Susername").blur(function() {
            if (validateUserName($(this))) {
               $("#UserCondition").hide();
               $(this).removeClass("is-invalid").addClass("is-valid");
            } else {
               $("#UserCondition").show();
               $(this).removeClass("is-valid").addClass("is-invalid");
            }
         });

         $("#Spassword").blur(function() {
            if (validatePassword($(this))) {
               $("#PWCondition").hide();
               $(this).removeClass("is-invalid").addClass("is-valid");
            } else {
               $("#PWCondition").show();
               $(this).removeClass("is-valid").addClass("is-invalid");
            }
         });

         $("#Spassword2").blur(function() {
            if (validatePassword2($(this))) {
               $(this).removeClass("is-invalid").addClass("is-valid");
            } else {
               $(this).removeClass("is-valid").addClass("is-invalid");
            }
         });

         $("#Sphone").blur(function() {
            if (validatePhone($(this))) {
               $("#PhoneCondition").hide();
               $(this).removeClass("is-invalid").addClass("is-valid");
            } else {
               $("#PhoneCondition").show();

               $(this).removeClass("is-valid").addClass("is-invalid");
            }
         });

         $("#Semail").blur(function() {
            if (validateEmail($(this))) {
               $(this).removeClass("is-invalid").addClass("is-valid");
            } else {
               $(this).removeClass("is-valid").addClass("is-invalid");
            }
         });

         $(":input").focus(function() {
            $(this).removeClass("is-valid is-invalid");
         });
      });
      
      // login 
      function loginValidate(){
         var isUserNameValid = false;
          var isUserPasswordValid = false;

          var userNameValue = $("#Lusername").val();
          var userNameLength = userNameValue.length;

          if( userNameLength > 0 ){
             isUserNameValid = true;
          }

          var userPasswordValue = $("#Lpassword").val();
          var userPasswordLength = userPasswordValue.length;

          if( userPasswordLength > 0 ){
              isUserPasswordValid = true;
          }

          if(    isUserNameValid && isUserPasswordValid ){
              return true;
          }else{
              return false;
          }
      }
      
      var httpRequest;

      function login() {

    	    let jsonData = JSON.stringify({
    	        userEmail : $("#Lusername").val(),
    	        userPassword : $("#Lpassword").val()
    	    });

    	    console.log(jsonData);
    	    $.ajax({
    	        type : 'post',
    	        url: '<%=contextPath%>/login',
    	        dataType: 'json',
    	        data : jsonData,
    	        contentType:"application/json;",
    	        success : function(data, status, xhr){
    	            console.log(data);
    	            window.location.href="<%=contextPath%>/main";
    	        },
    	        error : function(jqXHR, textStatus, errorThrown) {
    	            alertify.notify('Oops!! 서버에 문제가 발생했습니다.', 'error', 3,
    	                    function() {
    	                        console.log(jqXHR.responseText)
    	                    });
    	        }
    	    });

    	}
      
      function loginResult(){
          if (httpRequest.readyState === XMLHttpRequest.DONE) {
             console.log("done1");
              if (httpRequest.status === 200) {

                  // Before Learn JSON
                  // var result = httpRequest.responseText;

                  // After Learn JSON
                  var data = JSON.parse(httpRequest.responseText);
                  if( data.result == "success" ){
                     window.location.href = "index_afterLogin.jsp";
               } else if (data.result == "fail") {
                  alert("아이디 또는 비밀번호가 올바르지 않습니다.");
               }
            } else {
               alert("서버에 문제가 발생했습니다.");
            }
         }
      }

      // sign up
      function validateUserName(userName) {
         if (userName.val().length >= 8)
            return true;
         else
            return false;
      }

      function validatePassword(password) {
         if (password.val().length >= 4)
            return true;
         else
            return false;
      }

      function validatePassword2(password2) {
         if (password2.val() == $("#Spassword").val())
            return true;
         else
            return false;
      }

      function validatePhone(phone) {
         // \d 숫자
         // {3,4} 3개 ~ 4개
         let regexp = /^\d{3}-\d{3,4}-\d{4}$/;
         if (regexp.test(phone.val()))
            return true;
         else
            return false;
      }

      function validateEmail(email) {
         // ^ 시작일치, $ 끝 일치
         // {2, 3} 2개 ~ 3개
         // * 0회 이상, + 1회 이상
         // [-_.] - 또는 _ 또는 .
         // ? 없거나 1회
         let regexp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
         if (regexp.test(email.val()))
            return true;
         else
            return false;
      }
      
      function register() {
         console.log($("#Susername").val());
         
	         let jsonData = JSON.stringify({
	        	 userName : $("#Susername").val(),
					userPassword : $("#Spassword").val(),
					userEmail : $("#Semail").val()
	 	    });
            $.ajax({
                type: 'post',
                url: '<%=contextPath%>/register',
				dataType : 'text',
				data : jsonData,
				contentType : 'application/json;',
				success : function(data, status, xhr) {
					console.log(data);
					if (data == "success") {
						alertify.alert('Welcome!', '회원가입을 축하합니다.', function() {
							window.location.href = "login";
						});
					} else {
						alertify.notify(
								'Opps!! 회원가입에 문제가 생겼습니다. data result문제',
								'error', 3, function() {
									console.log(xhr.responseText);
								});
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alertify.notify('Opps!! 회원가입에 문제가 생겼습니다.', 'error', 3,
							function() {
								console.log(jqXHR.responseText);
							});
				}
			});
		}
	</script>
</body>
</html>