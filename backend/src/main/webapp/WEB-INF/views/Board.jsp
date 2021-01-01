<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ page import="com.ssafy.happyhouse.model.*, java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
   UserDto userDto = (UserDto) session.getAttribute("userDto");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>HAPPY HOUSE</title>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<script
   src="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/alertify.min.js"></script>
<link rel="stylesheet"
   href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/alertify.min.css" />
<link rel="stylesheet"
   href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/themes/default.min.css" />

<!-- New for FileUpload, CKEditor -->
<link rel="stylesheet" href="css/common.css">
<script
   src="https://cdn.ckeditor.com/ckeditor5/19.0.0/classic/ckeditor.js"></script>
<!-- / New for FileUpload, CKEditor -->
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
            <li class="nav-item"><a class="nav-link">공지사항</a></li>
            <li class="nav-item"><a class="nav-link" id="board" href="#">자유게시판</a></li>
            <li class="nav-item"><a class="nav-link">관심 지역 설정</a></li>
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

   <div class="container">
      <br> <br> <br>
      <h4 class="text-center">자유게시판</h4>

      <div class="input-group mb-3">
         <input id="inputSearchWord" type="text" class="form-control"
            placeholder="Search">
         <div class="input-group-append">
            <button id="btnSearchWord" class="btn btn-success">Go</button>
         </div>
      </div>

      <table class="table table-hover">
         <thead>
            <tr>
               <th>#</th>
               <th>제목</th>
               <th>작성자</th>
               <th>작성일시</th>
               <th>조회수</th>
            </tr>
         </thead>
         <tbody id="boardTbody">
         </tbody>
      </table>

      <div id="paginationWrapper"></div>

      <button class="btn btn-sm btn-primary" id="btnInsertPage">글쓰기</button>
   </div>

   <!-- modal begin ------------------------------------------------------------------------->
   <!-- Modal insert-->
   <div class="modal fade" id="boardInsertModal">
      <div class="modal-dialog modal-simple">
         <form class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
               <h4 class="modal-title">글쓰기</h4>
               <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
               <div class="row">
                  <div class="col-xl-12 form-group">
                     <input id="titleInsert" type="text" class="form-control"
                        name="title" placeholder="제목">
                  </div>
                  <div class="col-xl-12 form-group">

                     <!-- New for FileUpload, CKEditor -->
                     <div id=divEditorInsert></div>

                     <!--                               <textarea id="contentInsert" class="form-control" rows="5" placeholder="내용"></textarea> -->
                     <!-- / New for FileUpload, CKEditor -->
                  </div>
                  <!-- New for FileUpload -->
                  <div class="col-xl-12 form-group">
                     <div class="checkbox-custom checkbox-primary">
                        <input type="checkbox" id="chkFileUploadInsert" /> <label
                           for="chkFileUploadInsert">파일 추가</label>
                     </div>
                  </div>
                  <div class="col-xl-12 form-group" style="display: none;"
                     id="imgFileUploadInsertWrapper">
                     <input type="file" id="inputFileUploadInsert">
                     <div class="thumbnail-wrapper">
                        <img id="imgFileUploadInsert">
                     </div>
                  </div>
                  <!-- / New for FileUpload -->
                  <div class="col-md-12 float-right">
                     <button id="btnBoardInsert"
                        class="btn btn-sm btn-primary btn-outline" data-dismiss="modal"
                        type="button">등록</button>
                  </div>
               </div>
            </div>
         </form>
      </div>
   </div>
   <!-- End Modal -->

   <!-- Modal detail-->
   <div class="modal fade" id="boardDetailModal">
      <div class="modal-dialog modal-simple">
         <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
               <h4 class="modal-title">글 상세</h4>
               <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <div class="modal-body">

               <div class="example table-responsive">
                  <table class="table table-hover">
                     <tbody>
                        <tr>
                           <td>글번호</td>
                           <td id="boardIdDetail">#</td>
                        </tr>
                        <tr>
                           <td>제목</td>
                           <td id="titleDetail">#</td>
                        </tr>
                        <tr>
                           <td>내용</td>
                           <td id="contentDetail">#</td>
                        </tr>
                        <tr>
                           <td>작성자</td>
                           <td id="boardUserNameDetail">#</td>
                        </tr>
                        <tr>
                           <td>작성일시</td>
                           <td id="regDtDetail">#</td>
                        </tr>
                        <tr>
                           <td>조회수</td>
                           <td id="readCountDetail">#</td>
                        </tr>
                        <!-- New for FileUpload -->
                        <tr>
                           <td>첨부파일</td>
                           <td id="fileListDetail">#</td>
                        </tr>
                        <!-- / New for FileUpload -->
                     </tbody>
                  </table>
               </div>
               <button id="btnBoardUpdateForm"
                  class="btn btn-sm btn-primary btn-outline" data-dismiss="modal"
                  type="button">글 수정하기</button>
               <button id="btnBoardDeleteConfirm"
                  class="btn btn-sm btn-warning btn-outline" data-dismiss="modal"
                  type="button">글 삭제하기</button>

            </div>
         </div>
      </div>
   </div>
   <!-- End Modal -->

   <!-- Modal update-->
   <div class="modal fade" id="boardUpdateModal">
      <div class="modal-dialog modal-simple">
         <form class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
               <h4 class="modal-title">글수정</h4>
               <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
               <div class="row">
                  <div class="col-xl-12 form-group">
                     <input id="titleUpdate" type="text" class="form-control"
                        name="title" placeholder="제목">
                  </div>
                  <div class="col-xl-12 form-group">

                     <!-- New for FileUpload, CKEditor -->
                     <div id=divEditorUpdate></div>

                     <!--                               <textarea id="contentUpdate" class="form-control" rows="5" placeholder="내용"></textarea> -->
                     <!-- / New for FileUpload, CKEditor -->
                  </div>
                  <!-- New for FileUpload -->
                  <div class="col-xl-12 form-group">
                     첨부파일 : <span id="fileListUpdate"></span>
                  </div>
                  <div class="col-xl-12 form-group">
                     <div class="checkbox-custom checkbox-primary">
                        <input type="checkbox" id="chkFileUploadUpdate" /> <label
                           for="chkFileUploadUpdate">파일 변경</label>
                     </div>
                  </div>
                  <div class="col-xl-12 form-group" style="display: none;"
                     id="imgFileUploadUpdateWrapper">
                     <input type="file" id="inputFileUploadUpdate">
                     <div class="thumbnail-wrapper">
                        <img id="imgFileUploadUpdate">
                     </div>
                  </div>
                  <!-- / New for FileUpload -->
                  <div class="col-md-12 float-right">
                     <button id="btnBoardUpdate"
                        class="btn btn-sm btn-primary btn-outline" data-dismiss="modal"
                        type="button">수정</button>
                  </div>
               </div>
            </div>
         </form>
      </div>
   </div>
   <!-- End Modal -->
   <!-- modal end --------------------------------------------------------------------------->

 
	<script src="js/util.js"></script>
	<script>

var LIST_ROW_COUNT = 10;	//limit
var OFFSET = 0;
var SEARCH_WORD = "";

/* New for FileUpload, CKEditor */
var CKEditorInsert;
var CKEditorUpdate;
/* / New for FileUpload, CKEditor */

var PAGE_LINK_COUNT = 10;	// pagination link 갯수
var TOTAL_LIST_ITEM_COUNT = 0;
var CURRENT_PAGE_INDEX = 1;


const SUCCESS = 1;
const FAIL = -1;

$(document).ready(function(){
    
	/* New for FileUpload, CKEditor */
	ClassicEditor
		.create( document.querySelector( '#divEditorInsert' ) ) // .create( $('#divEditorInsert')[0] )
		.then( editor => {
			CKEditorInsert = editor;
	    } )
		.catch( err => {
	    	console.error( err.stack );
		} );

	ClassicEditor
		.create( document.querySelector( '#divEditorUpdate' ) ) // .create( $('#divEditorUpdate')[0] )
		.then( editor => {
			CKEditorUpdate = editor;
	    } )
		.catch( err => {
	    	console.error( err.stack );
		} );
	
	/* / New for FileUpload, CKEditor */
	
	boardList();
	
	$("#btnSearchWord").click(function(){

		var searchWord = $("#inputSearchWord").val();
		
		if( searchWord != "" ){
			SEARCH_WORD = searchWord;
		}else{
			SEARCH_WORD = "";
		}
		
		boardList();
		
	});
	
	// insert Page
	$("#btnInsertPage").click(function(){
		
		$("#titleInsert").val("");
		//$("#contentInsert").val("");
		CKEditorInsert.setData("")
		
		// New for FileUpload
		$("#chkFileUploadInsert").prop("checked", false);
		$("#inputFileUploadInsert").val("");
		$("#imgFileUploadInsert").removeAttr("src");
		$("#imgFileUploadInsertWrapper").hide();
		
		$("#boardInsertModal").modal("show");
	});
	
	// insert
	$("#btnBoardInsert").click(function(){
		
		if( validateInsert() ){
			boardInsert();
		}
	});
	
	// New for FileUpload
	// insert file upload change
	$("#chkFileUploadInsert").change(function(){
		if( $(this).prop("checked")){
			$("#imgFileUploadInsertWrapper").show();
		}else{
			$("#inputFileUploadInsert").val("");
			$("#imgFileUploadInsert").attr("src", "");
			$("#imgFileUploadInsertWrapper").hide();
		}
	});
	
	// New for FileUpload
	// insert file upload change image load
	$("#inputFileUploadInsert").change(function(e){

		if( this.files && this.files[0] ){
			var reader = new FileReader();
			reader.readAsDataURL(this.files[0]);
			reader.onload = function(e){
				$("#imgFileUploadInsert").attr("src", e.target.result);
			}
		}
	});
	
	// update
	$("#btnBoardUpdateForm").click(function(){
		
		var boardId = $("#boardDetailModal").attr("data-boardId");
		$("#boardUpdateModal").attr("data-boardId", boardId);
		
		$("#titleUpdate").val( $("#titleDetail").html() );
		
		// changes CKEditor
		// $("#contentUpdate").val( $("#contentDetail").html() );
		CKEditorUpdate.setData($("#contentDetail").html());
		
		
		if( $("#fileListDetail").find(".fileName").length > 0 ){
			var fileName = $("#fileListDetail").find(".fileName").html();
			$("#fileListUpdate").html( '<span class="fileName">' + fileName + '</span>');
		}

		$("#chkFileUploadUpdate").prop("checked", false);
		$("#inputFileUploadUpdate").val("");
		$("#imgFileUploadUpdate").attr("src", "");
		$("#imgFileUploadUpdateWrapper").hide();
		
		$("#boardDetailModal").modal("hide");
		$("#boardUpdateModal").modal("show");
	});
	
	$("#btnBoardUpdate").click(function(){
		
		if( validateUpdate() ){
			boardUpdate();
		}
	});
	
	// New for FileUpload
	// update file upload change image load
	$("#chkFileUploadUpdate").change(function(){
		if( $(this).prop("checked")){
			$("#imgFileUploadUpdateWrapper").show();
		}else{
			$("#inputFileUploadUpdate").val("");
			$("#imgFileUploadUpdate").attr("src", "");
			$("#imgFileUploadUpdateWrapper").hide();
		}
	});
	
	$("#inputFileUploadUpdate").change(function(e){

		if( this.files && this.files[0] ){
			var reader = new FileReader();
			reader.readAsDataURL(this.files[0]);
			reader.onload = function(e){
				$("#imgFileUploadUpdate").attr("src", e.target.result);
			}
		}
	});
	
	// delete
	$("#btnBoardDeleteConfirm").click(function(){
		 alertify.confirm('삭제 확인', '이 글을 삭제하시겠습니까?',
 			function() {
				boardDelete();
 			},
			function(){
 				console.log('cancel');
			}
		);
	});
});

// list
function boardList(){
	
	$.ajax(
	{
        type : 'get',
        url : '/boards',
        dataType : 'json',
        data : { limit: LIST_ROW_COUNT, offset: OFFSET, searchWord: SEARCH_WORD },
        success : function(data, status, xhr) { 
        	if( data.result == SUCCESS ){
        		makeListHtml(data.list);
            	TOTAL_LIST_ITEM_COUNT = data.count;
            	addPagination();
        	}else if ( data.result == FAIL ){
        		alertify.notify(
              			'Oops!! 글 조회 과정에 문제가 생겼습니다.', 
              			'error', //'error','warning','message'
              			3, //-1
              			function(){
              				console.log(jqXHR.responseText); 
              			}
              		);
        	}
        }, 
        error: function(jqXHR, textStatus, errorThrown) 
        { 
        	console.log(textStatus);
        	
        	alertify.notify(
       			'Oops!! 글 조회 과정에 문제가 생겼습니다.', 
       			'error', //'error','warning','message'
       			3, //-1
       			function(){
       				console.log(jqXHR.responseText); 
       			}
       		);
        }
    });
}

function makeListHtml(list){

	$("#boardTbody").html("");

	for( var i=0; i<list.length; i++){
		
		var boardId = list[i].boardId;
		var userName = list[i].userName;
		var title = list[i].title;
		var content = list[i].content;
		var regDt = list[i].regDt;	// javascript of parsed from LocalDateTime
		console.log(regDt)
		//if use Jackson, checkout console.log of regDt!!
		//var regDtStr = regDt;
		var regDtStr = makeDateStr(regDt.date.year, regDt.date.month, regDt.date.day, '.'); // for Gson Format Of LocalDateTime
		
		
		var readCount = list[i].readCount;
		
		var listHtml =
			'<tr style="cursor:pointer" data-boardId=' + boardId +'><td>' + boardId + '</td><td>' + title + '</td><td>' + userName + '</td><td>' + regDtStr + '</td><td>' + readCount + '</td></tr>';

		$("#boardTbody").append(listHtml);
	}
	
	makeListHtmlEventHandler();
	
	//boardListTotalCnt();
}

function makeListHtmlEventHandler(){
	$("#boardTbody tr").click(function(){
		var boardId = $(this).attr("data-boardId");
		var userSeq = '<%=userDto.getUser_no()%>';
		boardDetail(boardId, userSeq);
	});
}



// list total
// function boardListTotalCnt(){

// 	$.ajax(
// 	{
//         type : 'get',
<%--         url : '<%=contextPath%>/boards/count', --%>
//         dataType : 'json',
//         data : { searchWord: SEARCH_WORD },
//         success : function(data, status, xhr) {
//         	TOTAL_LIST_ITEM_COUNT = data;
//         	addPagination();
//         }, 
//         error: function(jqXHR, textStatus, errorThrown) 
//         { 
//         	alertify.notify(
//        			'Oops!! 글 전체 갯수 조회 과정에 문제가 생겼습니다.', 
//        			'error', //'error','warning','message'
//        			3, //-1
//        			function(){
//        				console.log(jqXHR.responseText); 
//        			}
//        		);
//         }
//     });
// }

function addPagination(){

	makePaginationHtml(LIST_ROW_COUNT, PAGE_LINK_COUNT, CURRENT_PAGE_INDEX, TOTAL_LIST_ITEM_COUNT, "paginationWrapper" );
}

function movePage(pageIndex){
	OFFSET = (pageIndex - 1) * LIST_ROW_COUNT;
	CURRENT_PAGE_INDEX = pageIndex;
	boardList();
}



function validateInsert(){
	var isTitleInsertValid = false;
	var isContentInsertValid = false;

	var titleInsert = $("#titleInsert").val();
	var titleInsertLength = titleInsert.length;
	
	if( titleInsertLength > 0 ){
		isTitleInsertValid = true;
	}
	
	// changes CKEditor
	// var contentInsertValue = $("#contentInsert").val();
	var contentInsertValue = CKEditorInsert.getData();
	
	var contentInsertLength = contentInsertValue.length;
	
	if( contentInsertLength > 0 ){
		isContentInsertValid = true;
	}

	if(	isTitleInsertValid && isContentInsertValid ){
		return true;
	}else{
		return false;
	}
}

// insert
function boardInsert(){

	var formData = new FormData();
	formData.append("userSeq", '<%=userDto.getUser_no()%>');
	formData.append("title", $("#titleInsert").val());
	// changes CKEditor
	// formData.append("content", $("#contentInsert").val());
	formData.append("content", CKEditorInsert.getData());
	
	formData.append("file", $("#inputFileUploadInsert")[0].files[0]);
	
	$.ajax(
	{
        type : 'post',
        url : '/boards',
        dataType : 'json',
        data : formData,
        contentType: false,
        processData: false,
        success : function(data, status, xhr) { 
        	if(data.result == SUCCESS){
        		alertify.success('글이 등록되었습니다.');
        		boardList();
        	}else{
        		alertify.notify(
           			'Oops!! 글 등록 과정에 문제가 생겼습니다.', 
           			'error', //'error','warning','message'
           			3, //-1
           			function(){
           				console.log(jqXHR.responseText); 
           			}
           		);
        	}
        }, 
        error: function(jqXHR, textStatus, errorThrown) 
        { 
        	alertify.notify(
      			'Oops!! 글 등록 과정에 문제가 생겼습니다.', 
      			'error', //'error','warning','message'
      			3, //-1
      			function(){
      				console.log(jqXHR.responseText); 
      			}
      		);
        	
        }
    });
}

// detail
function boardDetail(boardId, userSeq){

	$.ajax(
	{
        type : 'get',
        url : '/boards/' + boardId,
        dataType : 'json',
        data : {
		},
        success : function(data, status, xhr) { 
        	console.log(data)
			if( data.result == SUCCESS ){
				makeDetailHtml(data.dto);
			}else if( data.result == FAIL ){
				alertify.notify(
		       			'Oops!! 글 상세 조회 과정에 문제가 생겼습니다.', 
		       			'error', //'error','warning','message'
		       			3, //-1
		       			function(){
		       				console.log(jqXHR.responseText); 
		       			}
		       		);
			}
        	
        }, 
        error: function(jqXHR, textStatus, errorThrown) 
        {
    		alertify.notify(
       			'Oops!! 글 상세 조회 과정에 문제가 생겼습니다.', 
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

	var boardId = detail.boardId;
	var userSeq = detail.userSeq;
	var userName = detail.userName;
	var title = detail.title;
	var content = detail.content;
	var regDt = detail.regDt;

	//var regDtStr = makeDateStr(regDt.date.year, regDt.date.month, regDt.date.day, '.') + ' ' + makeTimeStr(regDt.time.hour, regDt.time.minute, regDt.time.second, ':'); // for Gson Format Of LocalDateTime
	regDtStr = regDt; // refactorig later
	
	
	var readCount = detail.readCount;
	var fileList = detail.fileList;
	
	$("#boardDetailModal").attr("data-boardId", boardId);
	$("#boardIdDetail").html("#" + boardId);
	$("#titleDetail").html(title);
	$("#contentDetail").html(content);
	$("#userNameDetail").html(userName);
	$("#regDtDetail").html(regDtStr);
	$("#readCountDetail").html(readCount);
	
	//FileList
	$("#fileListDetail").html("");
	
	if( fileList.length > 0 ){
		for(var i=0; i<fileList.length; i++){
			var fileId = fileList[i].fileId;
			var fileName = fileList[i].fileName;
			var fileUrl = fileList[i].fileUrl;
			
			$("#fileListDetail").append(
					'<span class="fileName">' + fileName + '</span>');
			$("#fileListDetail").append(
					'&nbsp;&nbsp;<a type="button" class="btn btn-outline btn-default btn-xs" ' +
					'data-fileId="' + fileId + '" ' +
					'href="static/' + fileUrl + '" ' +
					'download="' + fileName + '">내려받기</a>');
		}
	}
	
	
	if( userSeq != '<%=userDto.getUser_no()%>' ){
		$("#btnBoardUpdateForm").hide();
		$("#btnBoardDeleteConfirm").hide();
	}else{
		$("#btnBoardUpdateForm").show();
		$("#btnBoardDeleteConfirm").show();
	}
	
	$("#boardDetailModal").modal("show");
}

// update
function validateUpdate(){
	var isTitleUpdateValid = false;
	var isContentUpdateValid = false;

	var titleUpdate = $("#titleUpdate").val();
	var titleUpdateLength = titleUpdate.length;
	
	if( titleUpdateLength > 0 ){
		isTitleUpdateValid = true;
	}
	
	// changes CKEditor
	// var contentUpdateValue = $("#contentUpdate").val();
	var contentUpdateValue = CKEditorUpdate.getData();
	
	var contentUpdateLength = contentUpdateValue.length;
	
	if( contentUpdateLength > 0 ){
		isContentUpdateValid = true;
	}

	if(	isTitleUpdateValid && isContentUpdateValid ){
		return true;
	}else{
		return false;
	}
}

function boardUpdate(){

	var formData = new FormData();
	//formData.append("_method", "PUT");
	formData.append("boardId", $("#boardUpdateModal").attr("data-boardId"));
	formData.append("userSeq", '<%=userDto.getUser_no()%>');
	formData.append("title", $("#titleUpdate").val());
	
	// changes CKEditor
	// formData.append("content", $("#contentUpdate").val());
	formData.append("content", CKEditorUpdate.getData());

	formData.append("file", $("#inputFileUploadUpdate")[0].files[0]);
	
	$.ajax(
	{
		type : 'POST',
        url : '/boards/' + $("#boardUpdateModal").attr("data-boardId"),
        dataType : 'json',
        data : formData,
        contentType: false,
        processData: false,
        success : function(data, status, xhr) { 

        	if(data.result == SUCCESS){
        		alertify.success('글이 수정되었습니다.');
        		boardList();
        	}else{
        		alertify.notify(
               			'Oops!! 글 수정 과정에 문제가 생겼습니다.', 
               			'error', //'error','warning','message'
               			3, //-1
               			function(){
               				console.log(jqXHR.responseText); 
               			}
               		);
        	}
        }, 
        error: function(jqXHR, textStatus, errorThrown) 
        {
        	alertify.notify(
       			'Oops!! 글 수정 과정에 문제가 생겼습니다.', 
       			'error', //'error','warning','message'
       			3, //-1
       			function(){
       				console.log(jqXHR.responseText); 
       			}
       		);
        }
    });
}

// delete
function boardDelete(){
	$.ajax(
	{
        type : 'POST',
        url : '/boards/' + $("#boardDetailModal").attr("data-boardId"),
        dataType : 'json',
        data : 
		{
        	_method : 'DELETE',
        	boardId : $("#boardDetailModal").attr("data-boardId")
        	
		},
        success : function(data, status, xhr) { 
		
        	if(data.result == SUCCESS){
        		alertify.success('글이 삭제되었습니다.');
        		boardList();
        	}else{
        		alertify.notify(
               			'Oops!! 글 삭제 과정에 문제가 생겼습니다.', 
               			'error', //'error','warning','message'
               			3, //-1
               			function(){
               				console.log(jqXHR.responseText); 
               			}
               		);
        	}
        }, 
        error: function(jqXHR, textStatus, errorThrown) 
        {
        	alertify.notify(
       			'Oops!! 글 삭제 과정에 문제가 생겼습니다.', 
       			'error', //'error','warning','message'
       			3, //-1
       			function(){
       				console.log(jqXHR.responseText); 
       			}
       		);
        }
    });
}
</script>

</body>
</html>