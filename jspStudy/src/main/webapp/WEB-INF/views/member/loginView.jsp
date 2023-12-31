<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>로그인</title>
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
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">로그인</h2>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Contact Section Form-->
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-xl-7">
                        <form id="contactForm" action="<c:url value="/loginDo" />" method="POST" >
                            <!-- Id input-->
                            <div class="form-floating mb-3">
                            	<!-- 쿠키에 rememberId 키값이 존재하면 input 태그 value에 해당 아이디 적어주기 -->
                                <input class="form-control" id="id" name="memId" type="text" value="${cookie.rememberId.value }" />
                                <label for="id">아이디</label>
                            </div>
                            <!-- Pw input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="pw" name="memPw" type="password" />
                                <label for="pw">비밀번호</label>
                            </div>
                            <div class="mb-3">
                                <label class="form-check-label" for="rememberCheck">아이디 기억하기</label>
                                <!-- 쿠키에 rememberId 키값이 존재하면 checked 상태 -->
                                <input class="form-check-input" id="rememberCheck" name="rememberId" type="checkbox" ${cookie.rememberId == null ? "" : "checked"} />
                            </div>
                            <!-- 로그인 이전 페이지 링크 기억용 -->
                            <input name="fromUrl" value="${fromUrl }" type="hidden">
                            <!-- Submit Button-->
                            <button class="btn btn-primary btn-xl" id="submitButton" type="submit">로그인</button>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        
        <!-- 모든 페이지 하단에 들어가는 부분 -->
        <%@include file="/WEB-INF/inc/bottom.jsp" %>
        
    </body>
</html>
