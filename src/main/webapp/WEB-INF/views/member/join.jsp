<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<!-- jquery-3.6.0 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(function() {
	
	// 아이디 중복 체크
	$('#userId').keyup(function() {
		var userId = $('#userId').val();
		
		if(userId.length >= 5) {
			// csrf사용시 ajax 호출을 위한 작업
			$(document).ajaxSend(function(e, xhr, options) {
				xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
			}); 
			
			$.ajax({
			    url:'${pageContext.request.contextPath}/member/duplicateCheck',
			    type:'post', 
			    data:{'userId':userId}, 
			    success: function(data) {
					
			    	var result = "사용가능한 아이디 입니다.";
			       $('#duplicateResult').css('color','blue');
					
			       if(data != 0) {
			    	   result = "이미 존재하는 아이디 입니다.";
			    	   $('#duplicateResult').css('color','red');
			        }
			       
			       $('#duplicateResult').text(result);
			       
			    },
			    error: function(err) {
			    	console.log(err);
			    }
			});
		} else {
			$('#duplicateResult').text('');
		}
	});
	
	// 전화번호 폼체크
	$('#userPh').keyup(function() { 
		var regNumber =  /^[0-9]*$/; // 정규식 숫자만 
		var userPh = $('#userPh').val();
		if(!regNumber.test(userPh)){
			alert('숫자만 입력하세요');
			$('#userPh').val(userPh.replace(/[^0-9]/g,'')); // 숫자만 남기고 지움
		}
		
	});
});

function formCheck() {
	var duplicateResult = $('#duplicateResult').css('color');
	
	if(duplicateResult != 'rgb(0, 0, 255)'){
		alert('아이디를 확인하세요!');
		$('#userId').focus();
		return false;
	}
	
	var userPw = $('#userPw').val();
	// 비밀번호 5자리이상으로 간단하게..
	if(userPw.length < 5) {
		alert('비밀번호를 5자리 이상 적어주세요');
		$('#userPw').focus();
		return false;
	}
	
	var userPwCk = $('#userPwCk').val();
	// 비밀번호, 비밀번호 확인 
	if(userPw.length >= 5 && userPwCk.length == userPw.length) {
		if(userPwCk != userPw) {
			alert('비밀번호를 확인해주세요');
			$('#userPw').focus();
			return false;
		}
	}else {
		alert('비밀번호를 확인해주세요');
		$('#userPw').focus();
		return false;
	}
	
	var userNm = $('#userNm').val();
	var regName = /^[가-힣]{2,4}$/;

	if(!regName.test(userNm)){
		alert('이름을 확인해주세요');
		$('#userNm').focus();
		return false;
	}
	
	// 전화번호 체크
	var userPh = $('#userPh').val();
	if(userPh.length < 6){
		alert('핸드폰번호를 입력하세요');
		return false;
	}
	
	var zipCode = $('#zipCode').val();
	var addr1 = $('#addr1').val();
	if(zipCode == null || addr == null || zipCode.length < 1 || addr1.length < 1){
		alert('우편변호를 입력하세요');
		return false;
	}
	
	
}
</script>

</head>
<body>
	<div class="text-center" >
		<h1>회원가입</h1>
	</div>
	<form class="form-horizontal" action="${pageContext.request.contextPath }/member/joinSubmit" method="post" onsubmit="return formCheck()">
		<div class="form-group">
			<label for="userId" class="col-sm-2 control-label">아이디</label> 
			<div class="col-sm-2">
				<input type="text" class="form-control" id="userId" name="userId" placeholder="아이디를 입력하세요">
				<span id="duplicateResult"></span>
			</div>
		</div>
		<div class="form-group">
			<label for="userPw" class="col-sm-2 control-label">비밀번호</label> 
			<div class="col-sm-2">
				<input type="password" class="form-control" id="userPw" name="userPw" placeholder="비밀번호">
				<input type="password" class="form-control" id="userPwCk" placeholder="비밀번호 확인">
			</div>
		</div>
		<div class="form-group">
			<label for="userNm" class="col-sm-2 control-label">이름</label> 
			<div class="col-sm-2">
				<input type="text" class="form-control" id="userNm" name="userNm" placeholder="이름">
			</div>
		</div>
		<div class="form-group">
			<label for="userPh" class="col-sm-2 control-label">전화번호</label> 
			<div class="col-sm-2">
				<input type="text" class="form-control" id="userPh" name="userPh" placeholder="핸드폰번호 ex) 01012345678">
			</div>
		</div>
		<div class="form-group">
			<label for="zipCode" class="col-sm-2 control-label">주소</label>
			<div class="col-sm-3">
				<input type="button" class="btn btn-default" onclick="postcode()" value="우편번호 찾기">
				<input type="text" class="form-control" id="zipCode" name="zipCode" placeholder="우편번호" readonly="readonly">
				<input type="text" class="form-control" id="addr1" name="addr1" placeholder="주소" readonly="readonly">
				<input type="text" class="form-control" id="addr2" name="addr2" placeholder="상세주소">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-default">회원가입</button>
			</div>
		</div>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	// 카카오 우편번호 api
    function postcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipCode').value = data.zonecode;
                document.getElementById("addr1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr2").focus();
            }
        }).open();
    }
</script>
</body>
</html>