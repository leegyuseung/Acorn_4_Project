<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/staff/adminOrderDetail.jsp</title>
<style>
	h2 {text-align: center; padding-top: 1em; padding-bottom: 1em;}
	
	#center{
	text-align: center;
	}
</style>
</head>
<body>
<jsp:include page="../../../resources/include/resource.jsp"></jsp:include>
    
<header class="sticky-top ">
<jsp:include page="../../../resources/include/navbar.jsp">
	<jsp:param value="userlist" name="thisPage"/>
</jsp:include>
</header>

<div class="container-fluid">
  <div class="row">
    
	<jsp:include page="../../../resources/include/sidebar.jsp"></jsp:include>
	
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<h2>주문 내역 디테일</h2>
				<table class="table table-striped table-sm ">
					<thead>
				   		<tr>
				   			<th>수령인</th>
				   			<th>주소</th>
				   			<th>종합 가격</th>
				   			<th>배송 상태</th>
				   		</tr>
				  	</thead>
				  	<tbody>
				  		<c:forEach items="${list}" var="tmp" varStatus="status">
							<tr>
							   	<c:if test="${status.first}">
								    <td>${tmp.receiver}</td>
								    <td>(${tmp.userPostal}) ${tmp.userAddr} ${tmp.userAddrDetail}</td>
								    <td><fmt:formatNumber pattern="###,###,###" value="${tmp.totalPrice}" /> 원</td>
								    <td>${tmp.delivery}</td>
							   	</c:if>
					   		</tr>
					  	</c:forEach>
				  	
					    <tr>
						    <td colspan="4">
						    	<table class="table">
						    		<caption class="text-end">
						    			<c:forEach items="${list}" var="tmp" varStatus="status">
						    			<form action="delivered.do" method="post">
						    				<input type="hidden" name="orderId" value="${param.orderId }"/>
						    				<input type="hidden" name="delivery" value="배송 완료"/>
						    				<c:choose>
						    					<c:when test="${tmp.delivery eq '주문 반품'}">
						    					
						    					</c:when>
						    					<c:when test="${tmp.delivery eq '주문 취소'}">
						    						
						    					</c:when>
						    					<c:when test="${tmp.delivery eq '배송 완료'}">
						    						
						    					</c:when>
						    					<c:otherwise>
						    						<c:if test="${status.first}">
						    							<button class="btn btn-outline-secondary" id="delivery">배송 완료</button>
						    						</c:if>
						    					</c:otherwise>
						    				</c:choose>
						    			</form>
						    			</c:forEach>
						    			
						    		</caption>
						    		<thead>
						    			<tr>
						    				<th>이미지</th>
						    				<th>상품명</th>
						    				<th>개당 가격</th>
						    				<th>구입 수량</th>
						    				<th>최종 가격</th>
						    			</tr>
						    		</thead>
						    		<tbody>
						    			<c:forEach items="${list}" var="tmp">     
											<tr>
											   	<td><img src="${pageContext.request.contextPath }${tmp.imagePath}" style="width:50px; height: 50px;"/></td>
											   	<td>${tmp.productName}</td>
												<td><fmt:formatNumber pattern="###,###,###" value="${tmp.price}" /> 원</td>
												<td>${tmp.amount_detail} </td>
												<input type="hidden" name="amount_detail" id="amount_detail" value="${tmp.amount_detail }"/>
												<input type="hidden" name="productId" id="productId" value="${tmp.productId }"/>
												<td><fmt:formatNumber pattern="###,###,###" value="${tmp.price * tmp.amount_detail}" /> 원</td>
								            </tr>     
									  	</c:forEach>
						    		</tbody>
						        </table>
						    </td>
					    </tr>
					</tbody>
				</table>
    </main>
  </div>
</div>

<jsp:include page="../../../resources/include/footer.jsp">
	<jsp:param value="home" name="thisPage"/>
</jsp:include>
<script>
	document.querySelector("#delivery").addEventListener("click",function(){
		alert("주문의 배송이 완료되었습니다.");
	});
</script>
</body>
</html>