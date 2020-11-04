<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<head>
<meta charset="UTF-8">
<title>커뮤니티 게시글</title>
<style>
#atag {
	margin-left: 2px;
	text-decoration: none;
	font-size: 12px;
	color: grey;
}

#atag:hover {
	color: white;
	background-color: #1abc9c;
}

.boardViewTable {
	right: 300px;
	border-left: 1px solid red;
}

.article1 {
	border: 1px solid blue;
}

.article1Container {
	border: 1px solid red;
}

#btitle {
	font-size: 25px;
}

#uphoto {
	float: left;
	margin-top: 5px;
}

#uname {
	margin-left: 40px;
	left: 50px;
	bottom: 35px;
}

#edeitdel {
	float: left;
}

#table-board-profile {
	width: 4em;
	border-radius: 100%;
}

input[type=checkbox] {
	display: hidden;
	display: none;
}

#view-btn-group {
	color: grey;
}

#loginFormLogo {
	margin-top: 10px;
	margin-bottom: 0;
		font-family: 'Montserrat Alternates', sans-serif;	
	
	float: left;
}

a {
	text-decoration: none;
}

#viewFormLogo{

	font-family: 'Montserrat Alternates', sans-serif;	
}

#myCarousel {
	margin-right: auto;
	margin-left: auto;
	width: 80%;
}

#board-view-container {
	width: 60%;
	padding-left: 20px;
}

#editdel {
	width: 40%;
	float: right;
}

#contents-box {
	border: 1px solid lightgrey;
	border-radius: 10px;
	margin-left: 10px;
	margin-right: 10px;
	padding: 15px;
}

#like-icon-p {
	display: inline-block;
	float: right;
	margin-top: 5px;
}

#board-view-title {
	display: inline-block;
	margin-top: 11px;
	padding-left: 10px;
	color: dimgray;
	font-size: 15px;
	font-weight: bold;
}

#view-board-regdate {
	font-size: 9px;
	color: lightgrey;
	margin-left: 20px;
}

#boardListHeadTitle {
	margin-left: 12px;
	color: #1abc9c;
}

#comments-view-btn-div{
	margin-bottom: 10px;
}

#comments-view-btn{
	width: 60%;
	border: none;
	font-weight : bold;
	font-size: 14px;
	background-color: white; 
	color: #1abc9c;
}

#comment-container, #comments-view-box{
	margin-left: auto; 
	margin-right: auto;
}

#comments-view-box{
	width: 70%;
	text-align: center;
}

#span-cmsg { 
}

#span-cdate { 
	font-size: 10px;
	font-color: grey;
	margin-left:15px;
	
}
#span-uname {
	font-size: 13px;
	margin-left: 10px;
	margin-right: 10px;
}
#span-cicons{
}

#boardView-card{
}

#boardView-ptitle{
	background-color: #83d4c2;
    font-size: 18px;
    padding: 5px 10px 5px 20px;
    margin-bottom: 5px;
    color: white;
	
}
/*기간  */
#boardView-date{
	background-color: #83d4c2;
    margin-bottom: 8px;
    padding-left: 20px;
    color: white;

}

/*  */
#boardView-ddate{
    padding-left: 30px;
	color: dimgrey;
	background-color: white;
	
}

#boardView-dloc{
    padding-left: 30px;
    padding-top: 5px;
    padding-bottom: 5px;
    margin-bottom: 10px;
    margin-top: 10px;
    background-color: whitesmoke;
}
	
}
#title-span{
	font-weight: 600;
}


</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
	
	<c:url value="${initParam['memberUploadPath']}" var="imagePath" />


	<!--전체 보드 컨테이너  -->
	<div class="container" id="board-view-container">
		<div id="boardListHeadTitle">
			<h3 id="loginFormLogo" class="card-title text-center">
				<span id="viewFormLogo"><a 
				id="viewFormLogo" href="../board/boardList" style="color: #1abc9c;">community</a></span>
			</h3>
			<br> <br>
		</div>

		<br>

		<div class="media" id="contents-box">
			<!-- 게시물 정보(작성자/ 이름/ 일시 / 좋아요)  -->
			<div class="media-left">
				<img id="table-board-profile" src="${imagePath}/${viewBoard.uphoto}"
					class="media-object" style="width: 45px"> <span
					style="color: grey; font-size: 11px;">${viewBoard.uname}</span>
			</div>

			<div class="media-body">
				<h4 class="media-heading" id="board-view-title"
					style="padding-left: 10px;">
					${viewBoard.btitle} <small> <i id="view-board-regdate">${viewBoard.bregdate}</i></small>
				</h4>
				<p id="like-icon-p" style="text-align: right;">
					<label for="btnLike" onclick="checkLike();"> <span
						class="glyphicon glyphicon-heart" id="like-icon"
						style="font-size: 30px;"></span></label> 
						<input type="checkbox"
						id="btnLike">
						<span id="like_result" style="display:inline-block;"></span>
						
				</p>
				<hr style="margin-bottom: 2px;">

				<div class="w3-bar" id="view-btn-group">
					<button class="w3-bar-item w3-button"
						onclick="openBoardView('viewBoard')">내용보기</button>
					<button class="w3-bar-item w3-button"
						onclick="openBoardView('viewPlan')">플랜보기</button>
				</div>

				<br>
				
				<!-- 이미지 패스 -->
				<c:url value="${initParam['boardUploadPath']}" var="bimagePath" />
				<div id="viewBoard" class="w3-container viewBoardPlan">

					<!-- 게시글 내용의 DIV(사진/게시글) -->
					<div class="media">
						<!--게시글의 사진이 들어갈 DIV -->


						<!-- c if 사진 있다면  -->
						
						<!-- 사진 슬라이드를 들어가게 할 예정 -->
						<div id="myCarousel" class="carousel slide" data-ride="carousel">
							<!-- Indicators 압축-->
							<ol class="carousel-indicators">
								<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
								<li data-target="#myCarousel" data-slide-to="1"></li>
							</ol>

							<!-- Wrapper for slides (실제 사진이 들어가는 곳)-->
							<div class="carousel-inner">
								<div class="item active">
									<img src="${bimagePath}/${viewBoard.bphoto1}"
										style="width: 100%;">
										<c:if test="${empty viewBoard.bphoto1}">
										 <span class = "fa fa-image" style="color:#1ABC9C"><br>no image</span>
										 </c:if>
								</div>

								<div class="item">
									<img src="${bimagePath}/${viewBoard.bphoto2}"
										style="width: 100%;">
										<c:if test="${empty viewBoard.bphoto2}">
										 <span class = "fa fa-image" style="color:#1ABC9C"><br>no image</span>
										 </c:if>
								</div>
							</div>
<c:if test="${not empty viewBoard.bphoto2}">
							<!-- Left and right controls (슬라이드 아이콘)-->
							<a class="left carousel-control" href="#myCarousel"
								data-slide="prev"> <span
								class="glyphicon glyphicon-chevron-left"></span> <span
								class="sr-only">Previous</span>
							</a> <a class="right carousel-control" href="#myCarousel"
								data-slide="next"> <span
								class="glyphicon glyphicon-chevron-right"></span> <span
								class="sr-only">Next</span>
							</a>
								</c:if>
						</div>
					

	
						<br>

						<!-- 게시글 내용이 들어갈 DIV -->
						<div class="media-body">
							<p>${viewBoard.bmsg}</p>
						</div>
					</div>
				</div>

				<div id="viewPlan" class="w3-container viewBoardPlan">
					
					<div id="boardplanner"></div>
					
				</div>
			</div>
			
					<!--게시글 수정/삭제/목록이 들어가는 곳  -->
		<div id="editdel"></div>


		<!-- 댓글 작성 시작  -->
		<div id = "comment-container">
	
			<%@ include file="/WEB-INF/views/comment/commentForm.jsp"%>
	
		<div>
			
		</div>


		<hr>
			<div id = "comments-view-box">
			<div id = "comments-view-btn-div" > 
			<button type="button" id ="comments-view-btn" 
			class="btn btn-info" data-toggle="collapse" data-target="#view-comments">+ 댓글</button>
			</div>	
			<div id = "view-comments" class="collapse">
			   		<c:if test="${not empty commentistView}">
			         <c:if test="${not empty commentistView.commentList }">
			            <c:forEach items="${commentistView.commentList}" var="comment">
			       			
			       			<div id = "view-comments-box" style = "text-align: left;">
				       			 <p style = "width: 90%;">
				       			 <span id ="span-cmsg"> ${comment.cmsg} </span>
				       			 <span id ="span-cdate"> ${comment.cregdate}</span>
				       				
				       			 <span id ="span-uname">${comment.uname}</span> 	
				       		     <span id = "span-cicons" style = "width: 22px; ">
				                  <a id="atag" href="javascript:commentDel(${comment.cidx})">
				                  	<span class = "glyphicon glyphicon-trash"></span>
				                  </a>
				                  <a id="atag" href="../comment/commentEdit?cidx=${comment.cidx}">
				                 	 <span class = "glyphicon glyphicon-pencil"></span>
				                  </a>
				                </span>
				       			
				       			 </p>
				       			 
				       			 
				       			  
			                </div>
			            </c:forEach>
			         </c:if>
			
			         <c:if test="${empty commentistView}">
			           	<div>
			               <p>첫번째 댓글을 남겨주세요~♡</p>
			            </div>
			         </c:if>
			        </c:if>
			     </div>
		</div>
	</div>
	</div>

	<hr>
	<div id="comment-form-container">

	</div>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</div>
</body>
</html>

<script>

	/* like count  */
	function likeAllSelect() {
	   $.ajax({      
	      url: 'http://localhost:8080/it/board/boardView/'+${viewBoard.bidx},
	      type: "get",
	      /* data: {uidx:'${loginInfo.uidx}', 
	            bidx: '${viewBoard.bidx}'}, */
	      success:
	      function(data){ //ajax통신 성공시 넘어오는 데이터 통째 이름 =data
	         
	         $("#like_result").text(data);   
	      }
	      });
	};

	/* like체크시 색상변경 */
	function likeSelect() {
			$.ajax({
				url: 'http://localhost:8080/it/board/boardView/'+${loginInfo.uidx}+'/'+${viewBoard.bidx},
				type: "get",
				/* data: {uidx:'${loginInfo.uidx}', 
					   bidx: '${viewBoard.bidx}'}, */
				success:
				function(data){ //ajax통신 성공시 넘어오는 데이터 통째 이름 =data
					console.log(data);
					if(data == 1){
							$('#btnLike').prop('checked', true);
				            $('.glyphicon-heart').css('color', '#1abc9c');   
							
	
					}else if(data == 0){
							$('#btnLike').prop('checked', false);
				            $('.glyphicon-heart').css('color', 'lightgrey'); 
	
					}
				// data중 put한 것의 이름 like
				}
				});
		}



	function checkLike(){

		if(!$('#btnLike').prop('checked')){
		
		$.ajax({
		url: 'http://localhost:8080/it/board/boardView',
		type: "POST",
		data: {uidx:'${loginInfo.uidx}', 
			   bidx: '${viewBoard.bidx}'},
		success:
			
		function(data){ //ajax통신 성공시 넘어오는 데이터 통째 이름 =data
			likeAllSelect();
			likeSelect();
		},
		error:
		function (request, status, error){
		alert("ajax실패")
		}
		});
		
		}else if($('#btnLike').prop('checked')){
			
			console.log("delete");
			$.ajax({
				url: 'http://localhost:8080/it/board/boardView/'+${loginInfo.uidx}+'/'+${viewBoard.bidx},
				type: "delete",
				/* data: {uidx:'${loginInfo.uidx}', 
					   bidx: '${viewBoard.bidx}'}, */
				success:
				function(data){ //ajax통신 성공시 넘어오는 데이터 통째 이름 =data
				// $('img#like_img').attr('src', '/it/resources/images/unlike.png');// data중 put한 것의 이름 like
					likeAllSelect();
					likeSelect();
				}
					   ,
				error:
				function (request, status, error){
				alert("ajax실패")
				}
				});
		}		
	}	


	
	
	
	
	
	/*  */

	/* 게시글을 볼 때 내가쓴글이면 수정삭제가보임. 내가쓴글이 아니면 안보임.
플래너가 있으면 플래너 리스트를 보여줌. 플래너 리스트가 없으면 안보여줌.*/
function regComment(){
      var formData = $('#fmt').serialize();
         $.ajax({
         type:'post',
         url:'/it/comment/comment/comment',
         data:formData,
         success:function(result){
         //console.log(result['res']);
            if(result['result'] > 0){
               
                 alert('댓글이 등록되었습니다.');
              location.reload(true);
            }
          }
      });
}
//댓글수정폼변경
function editLoc(){
   $('#edit-comm').show();
   $('#edit-td').hide();
   $('#edt-form').hide();
   $('#edt-proc').show();
   
}

//댓글수정수행
function editComm(cidx){
   
   var cmsg = $('#edit-comm').val();
   var formData = {
      cidx:cidx,
      cmsg:cmsg
   };
   
   $.ajax({
      type:'post',
      url:'/it/comment/commentEdit',
      data: formData,
      success:function(result){
      //console.log(result['res']);
         if(result['result'] > 0){
            alert('댓글이 수정 되었습니다.');
            location.reload(true);
         } else{
            alert('실패');
         }
       }
   });
   
}


//댓글삭제
function commentDel(cidx) {
   if (confirm('선택하신 댓글을 삭제하시겠습니까?')) {
      
      $.ajax({
         type:'get',
         url:'/it/comment/commentDelete?cidx=' + cidx,
         success:function(result){
         //console.log(result['res']);
            if(result['result'] > 0){
               
               alert('댓글이 삭제 되었습니다.');
               location.reload(true);
            }
          }
      });
   }
}   
	
	/*  */
	function boardDel(bidx) {
		if (confirm('선택하신 회원 정보를 삭제하시겠습니까?')) {
			location.href = 'boardDelete?bidx=' + bidx;
		}
	}
	
	function boardList() {
		location.href = 'boardList';
	}
	


/*게시판 탭(게시글 내용, 사진 보기 or 사용자가 올린 플래너 보기)  */
	function openBoardView(viewName) {
		  var i;
		  var x = document.getElementsByClassName("viewBoardPlan");
		  for (i = 0; i < x.length; i++) {
		    x[i].style.display = "none";  
		  }
		  document.getElementById(viewName).style.display = "block";  
		}

	/* 게시글을 볼 때 내가쓴글이면 수정삭제가보임. 내가쓴글이 아니면 안보임.
	      플래너가 있으면 플래너 리스트를 보여줌. 플래너 리스트가 없으면 안보여줌.*/
$(document).ready(function(){
	
	likeAllSelect();
	likeSelect();
	
	var uidx = ${viewBoard.uidx};
		var loginuidx = ${loginInfo.uidx};
	
		var likebidx=${viewBoard.bidx};

		/* 다른 부분 찾기 */
		if(uidx == loginuidx){
			
			var html = '';
			
			html +='<ul class = "pager">';
			html +='<li><a id="atag" href="boardEdit?bidx=${viewBoard.bidx}">수정</a></li>';
			html +='<li><a id="atag" href="javascript:boardDel(${viewBoard.bidx})">삭제</a></li>';
			html +='<li><a id="atag" href="<c:url value="/board/boardList"/>">목록</a></li>';
			
			html += '</ul>';
			
			$('#editdel').html(html);
		} else { 
			html += '<ul class = "pager">';
			html += '<li><a id="atag" href="<c:url value="/board/boardList"/>"> 게시글 목록 </a></li>';
			html += '</ul>';
		}
		

	$.ajax({
		url : 'checkPidx',
		data : {pidx:('${viewBoard.pidx}')},
		
		success : function(data) {
			if (data == 'Y') {
				plannerJoinDailyList();
			}
		}
	});//pidx를 체크하는 ajax시작의 마감
	
	});

	function plannerJoinDailyList() {
		$.ajax({
			url :  'http://localhost:8080/it/planner/dailyRest',
			type :  'GET',
			data : {uidx : '${viewBoard.uidx}',
					pidx : '${viewBoard.pidx}'	},
			success : function(data) {
				var html = '';
				if(typeof(data[0]) != 'undefined'){
				html +='<hr>';	
				html += '		<div id= "boardView-ptitle"><span id ="title-span">플랜　　</span>  ' + data[0].ptitle + '</div>';
				html += '		<div id= "boardView-date"><span id ="title-span">기간 　　　 </span>  ' + data[0].pstartdate + '~'+data[0].penddate+'</div>';
				 for (var i = 0; i < data.length; i++) {
						html += '<div class="boardView-card">';
						html += '		<div id = "boardView-ddate" ><span id ="title-span">날짜　 　　</span>  ' + data[i].ddate + '</div>';
						html += '		<div id = "boardView-dloc"><span id ="title-span">장소　　 　</span>   ' + data[i].dloc + '</div>';
						
						html += '</div>';
						}
				
						$('#boardplanner').html(html);
						
				 }else {
					// $('#boardplanner').html(html);
				 }
				
			}//success끝
		});
	};
	
</script>