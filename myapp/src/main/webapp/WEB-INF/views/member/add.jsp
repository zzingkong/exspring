<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/css/bootstrap-icons-1.9.1/bootstrap-icons.css" rel="stylesheet" >
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<title>회원관리</title>
<script type="text/javascript">
	$(function() { //문서 로드가 완료된 후 실행
		var idChecked = false; //아이디중복확인여부
		
		$('#memForm').on('submit', function(e){ //id=memForm 인 폼 엘리먼트 제출(submit)시 실행
			if (!idChecked) {
				alert('아이디 중복확인이 필요합니다.');
				return false;
			} 
			if ( $('#memPass').val() != $('#memPassCheck').val() ) {
				alert('비밀번호 입력이 서로 다릅니다.');
				return false; //e.preventDefault(); 
			}
		});
		$('#dupBtn').on('click', function() {
			$.ajax({
				url: "${pageContext.request.contextPath}/member/check.do",
				method: "post",
				data: { memId: $('#memId').val() },
				dataTypes: 'json'
			}).done(function(resp) {
				console.log( resp );
				idChecked = resp.result;
				if (resp.result){ //사용가능한 아이디
					alert('사용가능한 아이디입니다.');
// 					$('#saveBtn').prop('disabled', false);
// 					$('#dupBtn').prop('disabled', true);
				}else { //이미 존재하는 아이디
					alert('이미 존재하는 아이디입니다.');
// 					$('#saveBtn').prop('disabled', true);
// 					$('#dupBtn').prop('disabled', false);
				}
				
			}).fail(function(jqXHR,textStatus) {
				alert('아이디 중복 확인 요청 실패!');
			});
		});
		
		$('#memId').on('change', function() {
			idChecked = false;
// 			$('#saveBtn').prop('disabled', true);
// 			$('#dupBtn').prop('disabled', false);
		});
	
	});


</script>
</head>
<body>
<div class="container">
<div class="row">
    <div class="col">
	<h1>회원등록</h1>
	<form:form modelAttribute="memberVo" id="memForm" action="${pageContext.request.contextPath}/member/add.do" method="post" >
	  <div class="mb-3">
	    <form:label path="memId" class="form-label">아이디</form:label>
	    <div class="input-group">
		    <form:input path="memId" class="form-control" cssErrorClass="form-control is-invalid"   />
		    <button type="button" id="dupBtn" class="btn btn-primary">중복확인</button>
			<!-- 컨트롤러에서 검증 결과,  -->
			<!-- 모델 객체의 memId 속성값과 관련된 오류가 있는 경우, 오류 메시지 출력   -->
		    <form:errors path="memId" cssClass="invalid-feedback" />
	    </div>
	  </div>
	  <div class="mb-3">
	    <form:label path="memPass" class="form-label">비밀번호</form:label>
	    <form:password path="memPass" class="form-control" cssErrorClass="form-control is-invalid" />
	    <form:errors path="memPass" cssClass="invalid-feedback" />
	  </div>
	  <div class="mb-3">
	    <label for="memPassCheck" class="form-label">비밀번호확인</label>
	    <input type="password" class="form-control" id="memPassCheck">
	  </div>
	  <div class="mb-3">
	    <form:label path="memName" class="form-label">이름</form:label>
	    <form:input path="memName" class="form-control" cssErrorClass="form-control is-invalid" />
	    <form:errors path="memName" cssClass="invalid-feedback"/>
	  </div>
	  <div class="mb-3">
	    <form:label path="memPoint" class="form-label">포인트</form:label>
	    <form:input type="number" path="memPoint" class="form-control"  cssErrorClass="form-control is-invalid" />
	    <form:errors path="memPoint" cssClass="invalid-feedback" />
	  </div>
	  <button type="submit" id="saveBtn" class="btn btn-primary"><i class="bi-file-arrow-up"></i> 저장</button>
		<a href="${pageContext.request.contextPath}/member/list.do">
			<button type="button" class="btn btn-primary" ><i class="bi-list"></i> 회원목록</button>
		</a>
	</form:form>
	</div>
</div>	
</div>
<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js" ></script>	
</body>
</html>







