<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/resources/part/bootStrap.jspf" %>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.js"></script>
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/section.css">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		// 처음 로딩시 recommendSubCriteria display none.
		display_none();
		
		// 장르별 추천영화
		$("#genreRecommend").click(function(){
			display_none();
			$("#genreWrap").css("display","block");
			loadMovieRecommend('genre','all');
			$("#genre").change(function(){
				var subCriteria = $("#genre").val();
				loadMovieRecommend('genre',subCriteria);
			});
		});
		// 연도별 추천영화
		$("#yearRecommend").click(function(){
			display_none();
			$("#yearWrap").css("display","block");
			$(".year").click(function(){
				var subCriteria = $(this).attr("id");
				loadMovieRecommend('year',subCriteria);
			});
		});
		// 감독별 추천영화
		$("#direcotrRecommend").click(function(){
			display_none();
			loadMovieRecommend('director');
		});
		// 나이별 추천영화
		$("#ageRecommend").click(function(){
			display_none();
			$("#ageWrap").css("display","block");
			$(".age").click(function(){
				var subCriteria = $(this).attr("id");
				loadMovieRecommend('age',subCriteria);
			});
		});
		// 날씨별 추천영화
		$("#weatherRecommend").click(function(){
			display_none();
			loadMovieRecommend('weather');
		});
		// 그룹별 추천영화
		$("#groupRecommend").click(function(){
			display_none();
			$("#groupWrap").css("display","block");
			$(".group").click(function(){
				var subCriteria = $(this).attr("id");
				loadMovieRecommend('group',subCriteria);
			});
		});
		// 비슷한 추천영화
		$("#myRecommend").click(function(){
			display_none();
			loadMovieRecommend('my');
		});
		// 리뷰 추천영화
		$("#reviewRecommend").click(function(){
			display_none();
			loadMovieRecommend('review');
		});
		// 찜 추천영화
		$("#jjimRecommend").click(function(){
			display_none();
			loadMovieRecommend('jjim');
		});
		// 최근 추천영화
		$("#recentRecommend").click(function(){
			display_none();
			loadMovieRecommend('recent');
		});
		
		// css - display: none
		function display_none(){
			$("#ageWrap").css("display","none");
			$("#yearWrap").css("display","none");
			$("#groupWrap").css("display","none");
			$("#genreWrap").css("display","none");
		}
		
		// list ajax
		function loadMovieRecommend(criteria, subCriteria){
			$.ajax({
				url : "./recommendList",
				type : "GET",
				data : {
					criteria: criteria,
					subCriteria: subCriteria
				},
				success : function(data) {
					$("#recommendResult").html(data);
				}
			});
		}
		
		// 영화 상세 보기
		$("#recommendResult").on('click','.recommendContents',function(){
			var num = $(this).attr("id");
			location.href="../movieView?num="+num;
		});
	});
</script>
<style>
	#recommendResult{
		width: 1200px;
	}
	.recommendContents{
		width: 220px;
		height: 400px;
		float: left;
		margin: 10px 10px;
		border: 1px solid #cccccc;
	}
	.contents-top{
		width: 100%;
		height: 60%;
		border-bottom: 1px solid #cccccc;
	}
	.contents-middle{
		width: 100%;
		height: 40%;
	}
	.rank{
		position: absolute; 
		background-color: red; 
		width: 25px; 
		height: 25px; 
		color: white; 
		font-weight: bolder;
		text-align: center;
	}
	#contentsWrap{
		width: 1400px;
		margin: 0 auto;
	}
	#recommendCriteria{
		height: 40px;
		margin-top: 10px;
		border-bottom: 1px solid #cccccc;
	}
	#recommendSubCriteria{
		height: 40px;
		margin-bottom: 10px;
		border-bottom: 1px solid #cccccc;
	}
	#genre{
		height: 32px;
		margin: 4px 13px;
	}
</style>
</head>
<body>
	<%@ include file="/resources/part/header1.jspf" %>
	<section>
		<section id="contentsWrap">
			<ul class="nav nav-tabs nav-justified">
			    <li><a href="../movieSearchHome">영화검색</a></li>
			    <li class="active"><a href="#">영화추천</a></li>
			</ul>
			<div id="recommendCriteria">
				<span id="genreRecommend" class="btn">장르별 추천영화</span> | 
				<span id="yearRecommend" class="btn">년도별 추천영화</span> | 
				<span id="ageRecommend" class="btn">나이별 추천영화</span> | 
				<span id="weatherRecommend" class="btn">오늘날씨 추천영화</span> | 
				<span id="groupRecommend" class="btn">커플끼리,가족끼리,혼자</span> | 
				<span id="myRecommend" class="btn">내가 본 영화와 비슷한 영화</span> | 
				<span id="reviewRecommend" class="btn">리뷰가 많은 영화</span> | 
				<span id="jjimRecommend" class="btn">찜하기가 많은 영화</span> | 
				<span id="recentRecommend" class="btn">개봉예정작</span>
			</div>
			<div id="recommendSubCriteria">
				<div id="ageWrap">
					<span class="age btn" id="10">10대</span>
					<span class="age btn" id="20">20대</span>
					<span class="age btn" id="30">30대</span>
					<span class="age btn" id="40">40대</span>
					<span class="age btn" id="50">50대 이상</span>
				</div>
				<div id="yearWrap">
					<span class="year btn" id="1950">1960년대 이전</span>
					<span class="year btn" id="1960">1960년대</span>
					<span class="year btn" id="1970">1970년대</span>
					<span class="year btn" id="1980">1980년대</span>
					<span class="year btn" id="1990">1990년대</span>
					<span class="year btn" id="2000">2000년대</span>
					<span class="year btn" id="2010">2010년대</span>
				</div>
				<div id="groupWrap">
					<span class="group btn" id="couple">커플끼리</span>
					<span class="group btn" id="family">가족끼리</span>
					<span class="group btn" id="friend">친구끼리</span>
					<span class="group btn" id="alone">혼자</span>
				</div>
				<div id="genreWrap">
					<select id="genre">
						<option value="all">전체장르</option>
						<option value="판타지">판타지</option>
						<option value="공포">공포</option>
						<option value="로맨스/멜로">로맨스/멜로</option>
						<option value="어드벤처">어드벤처</option>
						<option value="스릴러">스릴러</option>
						<option value="다큐멘터리">다큐멘터리</option>
						<option value="코디미">코디미</option>
						<option value="가족">가족</option>
						<option value="미스터리">미스터리</option>
						<option value="전쟁">전쟁</option>
						<option value="애니메이션">애니메이션</option>
						<option value="범죄">범죄</option>
						<option value="뮤지컬">뮤지컬</option>
						<option value="SF">SF</option>
						<option value="액션">액션</option>
					</select>
				</div>
			</div>
			<div id="recommendResult"></div>
		</section>
	</section>
</body>
</html>