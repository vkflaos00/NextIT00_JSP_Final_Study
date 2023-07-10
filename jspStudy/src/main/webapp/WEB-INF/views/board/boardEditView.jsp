<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>글수정</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/favicon.ico" />
        
    </head>
    <body id="page-top">
        
        <!-- 모든 페이지 상단에 포함되는 부분 -->
        <%@include file="/WEB-INF/inc/top.jsp" %>
        
        <!-- 게시글 폼-->
        <section class="page-section mt-5" id="contact">
            <div class="container">
                <!-- Contact Section Heading-->
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">글 수정</h2>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Contact Section Form-->
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-xl-7">
                        <form id="contactForm" action="<c:url value="/boardEditDo" />" method="POST" >
                            <!-- title input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="title" name="boardTitle" type="text" value="${board.boardTitle }" />
                                <label for="title">제목</label>
                            </div>
                            <!-- 단순 데이터 전달용 input 태그(boardNo) -->
                            <input name="boardNo" type="hidden" value="${board.boardNo }" />
                            <!-- content input-->
                            <div class="form-floating mb-3">
                                <textarea class="form-control" id="message" name="boardContent" type="text" style="height: 20rem" >${board.boardContent }</textarea>
                            </div>
                            <!-- Submit Button-->
                            <button class="btn btn-primary btn-xl" id="submitButton" type="submit">수정완료</button>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        
        <!-- 모든 페이지 하단에 들어가는 부분 -->
        <%@include file="/WEB-INF/inc/bottom.jsp" %>
        
    </body>
</html>
