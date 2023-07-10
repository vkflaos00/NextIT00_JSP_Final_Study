<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>마이페이지</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/favicon.ico" />
        
    </head>
    <body id="page-top">
        
        <!-- 모든 페이지 상단에 포함되는 부분 -->
        <%@include file="/WEB-INF/inc/top.jsp" %>
        
        <!-- 마이페이지 폼-->
        <section class="page-section mt-5" id="contact">
            <div class="container">
                <!-- Contact Section Heading-->
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">마이페이지</h2>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Contact Section Form-->
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-xl-7">
                        <form id="contactForm" action="<c:url value="/memberEditDo" />" method="POST" >
                            <!-- Id input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="id" name="memId" type="text" value="${sessionScope.login.memId }" readOnly="readonly"/>
                                <label for="id">아이디</label>
                            </div>
                            <!-- Pw input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="pw" name="memPw" type="password" />
                                <label for="pw">비밀번호</label>
                            </div>
                            <!-- Name input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="name" name="memName" type="text" value="${sessionScope.login.memName }"/>
                                <label for="name">닉네임</label>
                            </div>
                            <!-- Submit Button-->
                            <button class="btn btn-primary btn-xl" id="submitButton" type="submit">수정하기</button>
                        </form>
                    </div>
                     <div class="col-lg-8 col-xl-7 d-flex mt-1">
                     		<form id="contactForm" action="<c:url value="/memberDelDo" />" method="POST" >
                     				<button class="btn btn-danger btn-xl" id="submitButton" type="submit">회원탈퇴</button>
                     		</form>
                     </div>
                </div>
            </div>
        </section>
        
        <!-- 모든 페이지 하단에 들어가는 부분 -->
        <%@include file="/WEB-INF/inc/bottom.jsp" %>
        
    </body>
</html>
