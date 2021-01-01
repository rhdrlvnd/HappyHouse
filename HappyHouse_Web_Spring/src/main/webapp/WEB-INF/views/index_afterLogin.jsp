<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.ssafy.happyhouse.model.*, java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
   String contextPath = request.getContextPath();
UserDto userDto = (UserDto) session.getAttribute("userDto");
%>
<!DOCTYPE html>
<html>
<head>
<title>HAPPY HOUSE</title>
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
            <li class="nav-item"><a class="nav-link" >공지사항</a></li>
            <li class="nav-item"><a class="nav-link" id="board" href="#">자유게시판</a></li>
            <li class="nav-item"><a class="nav-link" >관심 지역 설정</a>
            </li>
            <li class="nav-item"><a class="nav-link" href="#">관심 지역
                  둘러보기</a></li>
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
         <div class="col-md-2">
            <button type="button" class="btn btn-light" id="userInfo">회원관리</button>
         </div>
         <div class="col-md-1 mr-4">
            <button type="button" class="btn btn-light" id="LogoutBtn">
               Logout</button>
         </div>
      </div>
   </nav>
   <!-- Modal detail-->
   <div class="modal fade" id="userInfoDetailModal">
      <div class="modal-dialog modal-simple">
         <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
               <h4 class="modal-title">회원정보</h4>
               <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <div class="modal-body">

               <div class="example table-responsive">
                  <table class="table table-hover">
                     <tbody>
                        <tr>
                           <td>아이디</td>
                           <td id="userNameDetail">#</td>
                        </tr>
                        <tr>
                           <td>비밀번호</td>
                           <td id="passwordDetail">#</td>
                        </tr>
                        <tr>
                           <td>이메일</td>
                           <td id="emailDetail">#</td>
                        </tr>
                     </tbody>
                  </table>
               </div>
               <button id="btnUserInfoUpdateForm"
                  class="btn btn-sm btn-primary btn-outline" data-dismiss="modal"
                  type="button">회원정보 수정하기</button>
               <button id="btnUserInfoDeleteConfirm"
                  class="btn btn-sm btn-warning btn-outline" data-dismiss="modal"
                  type="button">탈퇴하기</button>

            </div>
         </div>
      </div>
   </div>
   <!-- End Modal -->

   <!-- Modal update-->
   <div class="modal fade" id="UserInfoUpdateModal">
      <div class="modal-dialog modal-simple">
         <form class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
               <h4 class="modal-title">회원정보 변경</h4>
               <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
               <div class="row">
                  <div class="col-xl-12 form-group">
                     <input id="passwordUpdate" type="text" class="form-control"
                        name="passwordupdate" placeholder="비밀번호">
                  </div>
                  <div class="col-xl-12 form-group">
                     <textarea id="emailUpdate" class="form-control" rows="5"
                        placeholder="이메일"></textarea>
                  </div>
                  <div class="col-md-12 float-right">
                     <button id="btnUserInfoUpdate"
                        class="btn btn-sm btn-primary btn-outline" data-dismiss="modal"
                        type="button">수정</button>
                  </div>
               </div>
            </div>
         </form>
      </div>
   </div>
   <!-- End Modal -->

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
					$.get("${pageContext.request.contextPath}/map/sido"
						,function(data, status){
							$.each(data.list, function(index, vo) {
								$("#sido").append("<option value='"+vo.sidoCode+"'>"+vo.sidoName+"</option>");
							});//each
						}//function
						, "json"
					);//get
				});//ready
				$(document).ready(function(){
					$("#sido").change(function() {
						$.get("${pageContext.request.contextPath}/map/gugun"
								,{sidoCode:$("#sido").val()}
								,function(data, status){
									$("#gugun").empty();
									$("#gugun").append('<option value="0">선택</option>');
									$.each(data.list, function(index, vo) {
										$("#gugun").append("<option value='"+vo.gugunCode+"'>"+vo.gugunName+"</option>");
									});//each
								}//function
								, "json"
						);//get
					});//change
					$("#gugun").change(function() {
						$.get("${pageContext.request.contextPath}/map/dong"
								,{gugunCode:$("#gugun").val()}
								,function(data, status){
									$("#dong").empty();
									$("#dong").append('<option value="0">선택</option>');
									$.each(data.list, function(index, vo) {
										$("#dong").append("<option value='"+vo.dong+"'>"+vo.dong+"</option>");
									});//each
								}//function
								, "json"
						);//get
					});//change
					$("#dong").change(function() {
						$.get("${pageContext.request.contextPath}/map/apt"
								,{dong:$("#dong").val()}
								,function(data, status){
									$("#searchResult").empty();
									$.each(data.list, function(index, vo) {
										let str = "<tr class="+[index%3]+">"
										+ "<td>" + vo.no + "</td>"
										+ "<td>" + vo.dong + "</td>"
										+ "<td>" + vo.aptName + "</td>"
										+ "<td>" + vo.jibun + "</td>"
										+ "<td>" + vo.code + "</td>"
										+ "<td>" + vo.dealAmount + "</td></tr>";
										$("#searchResult").append(str);
									//	$("#searchResult").append(vo.dong+" "+vo.aptName+" "+vo.jibun+"<br>");
									});//each
									geocode(data.list);
								}//function
								, "json"
						);//get
					});//change
				});//ready
			
				
				
				function geocode(jsonData) {
					let idx = 0;
					initMap();
					//setMapOnAll(null);
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

   <script>
   
        //    user
      $(document).ready(function() {
         // board
         $("#board").click(function() {
        	 window.location.href="<%=contextPath%>/board";
           });
         // detail
         $("#userInfo").click(function() {
            var userName = '<%=userDto.getUser_name()%>';
            userInfoDetail(userName);
         });

         // update
         $("#btnUserInfoUpdateForm").click(function(){
            $("#passwordUpdate").val( $("#passwordDetail").html() );
            $("#emailUpdate").val( $("#emailDetail").html() );
            
            $("#userInfoDetailModal").modal("hide");
            $("#UserInfoUpdateModal").modal("show");
         });
         
         $("#btnUserInfoUpdate").click(function(){
            if( validateUpdate() ){
               var userName = '<%=userDto.getUser_name()%>';
               userInfoUpdate(userName);
            }
         });
         
         // delete
         $("#btnUserInfoDeleteConfirm").click(function(){
             alertify.confirm('삭제 확인', '정~말로 탈퇴하시겠습니까?',
                function() {
                   var userName = '<%=userDto.getUser_name()%>';
                  userInfoDelete(userName);
                },
               function(){
                   console.log('cancel');
               }
            );
         });
         
         $("#LogoutBtn").click(function() {
        	 window.location.href="<%=contextPath%>/login";
         });
      });
      
      // detail
      function userInfoDetail(userName){
         console.log("success");
         
         $.ajax(
         {
              type : 'get',
              url : '<%=contextPath%>/UserInfo/UserInfoDetail',
              dataType : 'json',
              data : 
            {
                 userName: userName
            },
              success : function(data, status, xhr) { 
               console.log(data);
                 makeDetailHtml(data);
              }, 
              error: function(jqXHR, textStatus, errorThrown) 
              {
                alertify.notify(
                      'Opps!! 회원 정보 조회 과정에 문제가 생겼습니다.', 
                      'error', //'error','warning','message'
                      3, //-1
                      function(){
                         console.log(jqXHR.responseText); 
                      }
                   );
              }
          });
      }

      function makeDetailHtml(detail){
         
         var userSeq = detail.user_no;
         var userName = detail.user_name;
         var userPassword = detail.user_password;
         var userEmail = detail.user_email;
         var regDt = detail.regDt;

         console.log(userName);
         
         
         $("#userNameDetail").html(userName);
         $("#passwordDetail").html(userPassword);
         $("#emailDetail").html(userEmail);

         if( userSeq != '<%=userDto.getUser_no()%>'){
            $("#btnUserInfoUpdateForm").hide();
            $("#btnUserInfoDeleteConfirm").hide();
         }else{
            $("#btnUserInfoUpdateForm").show();
            $("#btnUserInfoDeleteConfirm").show();
         }

         $("#userInfoDetailModal").modal("show");
      }

//       // update
      function validateUpdate(){
         var isPasswordUpdateValid = false;
         var isEmailUpdateValid = false;

         var passwordUpdate = $("#passwordUpdate").val();
         var passwordUpdateLength = passwordUpdate.length;
         
         if( passwordUpdateLength > 0 ){
            isPasswordUpdateValid = true;
         }
         
         var emailUpdate = $("#emailUpdate").val();
         var emailUpdateLength = emailUpdate.length;
         
         if( emailUpdateLength > 0 ){
            isEmailUpdateValid = true;
         }

         if(   isPasswordUpdateValid && isEmailUpdateValid ){
            return true;
         }else{
            return false;
         }
      }

      function userInfoUpdate(userName){
         console.log($("#passwordUpdate").val());
         
         let jsonData = JSON.stringify({
        	 userName: userName,
             userPassword : $("#passwordUpdate").val(),
             userEmail: $("#emailUpdate").val()
 	    });
         
         $.ajax(
         {
              type : 'post',
              url : '<%=contextPath%>/UserInfo/UserInfoUpdate',
              dataType : 'text',
              data : jsonData,
            contentType : 'application/json;',
              success : function(data, status, xhr) { 
                 if(data == "success"){
                    alertify.success('회원정보가 수정되었습니다.');
                 }
                 else{
                    alertify.success('성공은 했으나, 무언가 잘못되었습니다.');
                 }
              }, 
              error: function(jqXHR, textStatus, errorThrown) 
              {
                 alertify.notify(
                      'Opps!! 회원정보 수정 과정에 문제가 생겼습니다.', 
                      'error', //'error','warning','message'
                      3, //-1
                      function(){
                         console.log(jqXHR.responseText); 
                      }
                   );
              }
          });
      }

//       // delete
      function userInfoDelete(userName){
    	  let jsonData = JSON.stringify({
         	 userName: userName
  	    });
         $.ajax(
         {
              type : 'post',
              url : '<%=contextPath%>/UserInfo/UserInfoDelete',
            dataType : 'text',
            data : jsonData,
            contentType : 'application/json;',
            success : function(data, status, xhr) {
               if (data == "success") {
                  alertify.success('회원 정보가 삭제되었습니다.');
                  window.location.href = "login";
               }
            },
            error : function(jqXHR, textStatus, errorThrown) {
               alertify.notify('Opps!! 탈퇴 과정에 문제가 생겼습니다.', 'error', //'error','warning','message'
               3, //-1
               function() {
                  console.log(jqXHR.responseText);
               });
            }
         });
      }
    
   </script>
</body>

</html>