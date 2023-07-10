<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>회원게시판</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/favicon.ico" />
        
    </head>
    <body id="page-top">
        
        <!-- 모든 페이지 상단에 포함되는 부분 -->
        <%@include file="/WEB-INF/inc/top.jsp" %>
        
        <!-- 회원가입 폼-->
        <section class="page-section mt-5" id="contact">
            <div class="container">
                <!-- Contact Section Heading-->
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">회원 게시판</h2>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Contact Section Form-->
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-xl-7">
                        <table class="table">
                        	<thead>
                        		<tr>
	                        		<th>글 번호</th>
	                        		<th>제목</th>
	                        		<th>작성자</th>
	                        		<th>날짜</th>
                        		</tr>
                        	</thead>
                        
                        	<c:forEach items="${boardList }" var="board">
		                        <tr>
		                        	<td>${board.boardNo }</td>
		                        	<td><a href="${pageContext.request.contextPath }/boardDetailView?boardNo=${board.boardNo }">${board.boardTitle }</a></td>
		                        	<td>${board.memName }</td>
		                        	<td>${board.boardDate }</td>
		                        </tr>
                        	</c:forEach>
                        </table>
                    </div>
                    <div class="col-lg-8 col-xl-7 d-flex justify-content-end">
                    	<a href="<c:url value="/boardWriteView" />">
	                    	<button type="button" class="btn btn-danger">글쓰기</button>
                    	</a>
                    </div>
                    
                </div>
            </div>
        </section>
        
        <!-- 모든 페이지 하단에 들어가는 부분 -->
        <%@include file="/WEB-INF/inc/bottom.jsp" %>
        
    </body>
</html>
