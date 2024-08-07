<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="/css/style.main.css">
<link rel="stylesheet" href="/css/wit.css">
<script defer src="/js/hsh.js"></script>
<script defer src="/js/wit.js"></script>
</head>

<body>
	<!-- 공통영역 -->
	<div class="container">
		<%@ include file="/WEB-INF/views/Includes/sideBar.jsp" %>	
		<!-- 공통역역 끝 -->

		<div class="main-content">
			<div class="header">
				<span class="alert"><a href=""><i class='bx bxs-bell'></i></a></span>
				<!--마이페이지로 이동-->
				<span class="myName"> <img src="/img/푸바오.png"><a
					href=" #">백민주 사원</a></span> <span class="logOut"><a href="#">LogOut</a></span>
			</div>
			<div class="contents">
				<div class="sideAbout">
					<div class="sideTxt">
						<a href="/eApproval/home">
							<h2 class="sideTit">전자 결재</h2>
						</a>
					</div>
					<div class="sideBtnBox">
						<button class="plusBtn sideBtn" id="startApprBtn">새 결재 진행</button>
						<%@ include file="/WEB-INF/views/eApproval/newWriteModal.jsp" %>
					</div>
					<div class="addressListPrivate">
						<ul class="privateList">
							<li class="toggleItem">
								<h3 class="toggleTit">결재하기</h3>
								<ul class="subList">
									<li><a href="/eApproval/apprList?type=todo">결재 대기 문서</a></li>
									<li><a href="/eApproval/apprList?type=upcoming">결재 예정 문서</a></li>
								</ul>
							</li>
						</ul>
					</div>
					<div class="addressListGroup">
						<ul class="GroupList">
							<li class="toggleItem">
								<h3 class="toggleTit">개인 문서함</h3>
								<ul class="subList">
									<li><a href="/eApproval/privateList?type=write">기안 문서함</a></li>
									<li><a href="/eApproval/privateList?type=save">임시 저장 문서함</a></li>
									<li><a href="/eApproval/privateList?type=approved">결재 문서함</a></li>
									<li><a href="/eApproval/privateList?type=return">반려 문서함</a></li>
									<li><a href="/eApproval/privateList?type=view">참조 문서함</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
				<div class="sideContents eApproval">
					<div class="mainTitle">전자 결재 홈</div>

					<div class="docuList">
						<div class="subTitle">
							기안 진행 문서 <input type="checkbox" id="progInfo" hidden> <label
								class="titleIcon" for="progInfo"> <i
								class='bx bx-info-circle'></i>
							</label>
							<div class="infoBox">현재 진행중인 기안문서 5개를, 최근 등록 순서대로 표시합니다.</div>
						</div>

						<div class="listBox progList">
							<div class="rows listHeader">
								<div class="cols">
									<span>기안일</span>
								</div>
								<div class="cols">
									<span>문서 양식</span>
								</div>
								<div class="cols">
									<span>긴급</span>
								</div>
								<div class="cols">
									<span>제목</span>
								</div>
								<div class="cols">
									<span>결재 상태</span>
								</div>
							</div>
							<c:choose>
								<c:when test="${empty currentDocuList}">
									<div class="rows emptyDocuList">
										<p>진행중인 문서가 없습니다.</p>
									</div>
								</c:when>
								<c:otherwise>
									<c:forEach items="${currentDocuList}" var="i">
										<div class="rows">
											<div class="cols">
												<span> <fmt:formatDate value="${i.write_date}"
														pattern="yyyy-MM-dd" /></span>
											</div>
											<div class="cols">
												<span>${i.name}</span>
											</div>
											<div class="cols">
												<span> <c:if test="${i.emer_yn eq 'Y'}">
														<img src="/img/icon/siren.png" class="emer">
													</c:if>
												</span>
											</div>
											<div class="cols">
												<span>${i.title}</span>
											</div>
											<div class="cols">
												<span>${i.status}</span>
											</div>
										</div>
									</c:forEach>
								</c:otherwise>
							</c:choose>

						</div>
					</div>
					<div class="docuList">
						<div class="subTitle">
							완료 문서 <input type="checkbox" id="doneInfo" hidden> <label
								class="titleIcon" for="doneInfo"> <i
								class='bx bx-info-circle'></i>
							</label>
							<div class="infoBox">최근에 결재 완료된 순서대로, 최대 5개의 목록을 표시합니다.</div>
						</div>
						<div class="listBox doneList">
							<div class="rows listHeader">
								<div class="cols">
									<span>기안일</span>
								</div>
								<div class="cols">
									<span>문서 양식</span>
								</div>
								<div class="cols">
									<span>긴급</span>
								</div>
								<div class="cols">
									<span>제목</span>
								</div>
								<div class="cols">
									<span>결재 상태</span>
								</div>
							</div>
							<c:choose>
								<c:when test="${empty doneDocuList}">
									<div class="rows emptyDocuList">
										<p>진행중인 문서가 없습니다.</p>
									</div>
								</c:when>
								<c:otherwise>
									<c:forEach items="${doneDocuList}" var="i">
										<div class="rows">
											<div class="cols">
												<span> <fmt:formatDate value="${i.write_date}"
														pattern="yyyy-MM-dd" /></span>
											</div>
											<div class="cols">
												<span>${i.name}</span>
											</div>
											<div class="cols">
												<span> <c:if test="${i.emer_yn eq 'Y'}">
														<img src="/img/icon/siren.png" class="emer">
													</c:if>
												</span>
											</div>
											<div class="cols">
												<span>${i.title}</span>
											</div>
											<div class="cols">
												<span>${i.status}</span>
											</div>
										</div>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>