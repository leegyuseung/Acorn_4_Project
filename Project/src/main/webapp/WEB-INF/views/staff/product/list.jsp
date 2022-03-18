<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/staff/product/list.jsp</title>
<jsp:include page="../../../../resources/include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../../../../resources/include/navbar.jsp">
	<jsp:param value="staff" name="thisPage"/>
</jsp:include>
<div class="container">
	<h1>상품 리스트</h1>
	<table class="table">
		<thead>
			<tr>
				<th>상품 ID</th>
				<th>상품 이름</th>
				<th>상품 가격</th>
				<th>남은 수량</th>
				<th>카테고리</th>
				<th>추가 날짜</th>
				<th>수정 날짜</th>
				<th>구매 횟수</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="tmp" items="${list }">
				<tr>
					<td>${tmp.productId }</td>
					<td>${tmp.productName }</td>
					<td>${tmp.price }</td>
					<td>${tmp.stock }</td>
					<td>${tmp.productCate }</td>
					<td>${tmp.regDate }</td>
					<td>${tmp.updateDate }</td>
					<td>${tmp.buyCount }</td>
					<td><a href="updateForm.do?productId=${tmp.productId }">수정</a></td>
					<td><a href="delete.do?productId=${tmp.productId }">삭제</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br />
	<figure class="text-end">
	<button class="btn btn-outline-secondary" type="reset" id="home">관리자 페이지</button>	
	<button class="btn btn-outline-secondary" type="reset" id="insert">상품 추가</button>
	</figure>
</div>
<script>
	document.querySelector("#home").addEventListener("click",function(){
		location.href="../home.do";	
	});
	document.querySelector("#insert").addEventListener("click",function(){
		location.href="insertForm.do";	
	});
</script>	
</body>
</html>