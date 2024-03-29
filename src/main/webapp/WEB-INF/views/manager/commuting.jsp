<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통근관리</title>
<!-- jquery-3.6.0 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.js"></script>
</head>
<body>
	<div id="map" style="width:500px;height:500px;"></div>
	
	<form id="frm" action="${pageContext.request.contextPath }/manager/goToWork" method="post">
		회사명:<input type="text" name="companyNm" value="${companyNm }" readonly="readonly">
		사용자 ID:<input type="text" id="userId" name="userId" value="${userId }" readonly="readonly">
		<input type="button" value="출근하기" onclick="submitBtn();" >
		<input type="hidden" id="lat" name="lat" />
		<input type="hidden" id="lon" name="lon" />
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
	
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f2748c54da0a95d5dd9d67bf64c97ec6"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨 
    }; 

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition, message) {

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition
    }); 
    
    var iwContent = message, // 인포윈도우에 표시할 내용
        iwRemoveable = true;

    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });
    
    // 인포윈도우를 마커위에 표시합니다 
    infowindow.open(map, marker);
    
    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);      
}    
</script>

<script type="text/javascript">
var lat = '';
var lon = '';
//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        lat = position.coords.latitude, // 위도
        lon = position.coords.longitude; // 경도
        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다 +-0.001
            message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
        
        // 마커와 인포윈도우를 표시합니다
        displayMarker(locPosition, message);
            
      });
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocation을 사용할수 없어요..'
        
    displayMarker(locPosition, message);
}

function submitBtn() {
	var userId = $('#userId').val();
	
	if(userId.length == 0) {
		location.href="${pageContext.request.contextPath}/member/login";
	}else {
		var companyX = '${companyVO.companyX }';
		var companyY = '${companyVO.companyY }';
		
		// 출퇴근 입력 가능 범위
		if(companyY > (lat-0.001) && companyY < (lat+0.001) && companyX > (lon-0.001) && companyX < (lon+0.001)) {
			$('#lat').val(lat);
			$('#lon').val(lon);
			
			var frm = $('#frm');
			frm.submit();
			
		}else {
			alert('입력할수없는 위치입니다.');
			return ;
		}

	}
}
	
</script>
</body>
</html>