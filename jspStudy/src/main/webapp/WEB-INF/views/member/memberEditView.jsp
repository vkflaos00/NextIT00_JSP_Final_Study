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
        
        <style>
        	.my-right-arange{
        		display: flex;  /* d-flex */
        		justify-content: end;  /* justify-content-end */
        	}
        
        </style>
        
    </head>
    <body id="page-top">
        
        <!-- 모든 페이지 상단에 포함되는 부분 -->
        <%@include file="/WEB-INF/inc/top.jsp" %>
        
        <!-- 게시글 폼-->
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
                          <!-- Id input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="id" name="memId" type="text" readonly="readonly"/>
                                <label for="id">${member.memId }</label>
                            </div>
                            <!-- Pw input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="pw" name="memPw" type="password"/>
                                <label for="pw">${member.memPw }</label>
                            </div>
                            <!-- Name input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="name" name="memName" type="text"/>
                                <label for="name">새로운비밀번호</label>
                            </div>
                        
	                        <div class="my-right-arange">
	                        	<form action="${pageContext.request.contextPath }/memberEditView" method="POST">
		                        	<button type="submit" class="btn btn-warning me-1" >수정</button>
	                        	</form>
		                        	
	                        	<form id="delForm" action="${pageContext.request.contextPath }/memberDelDo" method="POST">
		                        	<button type="button" class="btn btn-danger" onclick="f_del()">삭제</button>
	                        	</form>
	                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <!-- 모든 페이지 하단에 들어가는 부분 -->
        <%@include file="/WEB-INF/inc/bottom.jsp" %>
        
        <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
        <script type="text/javascript">
        	function f_del(){
        		if(confirm("정말로 삭제하시겠습니까?")){
        			// form태그의 action을 실행(submit)
        			document.getElementById("delForm").submit();
        		}
        	}
        
        </script>
        
    </body>
</html>
