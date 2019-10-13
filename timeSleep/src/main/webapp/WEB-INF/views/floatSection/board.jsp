<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../fixSection/header.jsp"%>
<h1>영화 커뮤니티 게시판 입니다.</h1>
<div class="container">
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th>글번호</th>
				<th>글제목</th>
				<th>날짜</th>
				<th>글쓴이</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>1</td>
				<td>2</td>
				<td>3</td>
				<td>4</td>
				<td>5</td>
			</tr>
		</tbody>
	</table>
	<hr />
	<a href="/move/board/register" class="btn btn-info">글쓰기</a>
	<!-- 페이징 처리 -->
	<nav aria-label="Page navigation example">
		<ul class="pagination pg-blue justify-content-center">
			<li class="page-item"><a class="page-link">Previous</a></li>
			<li class="page-item"><a class="page-link">1</a></li>
			<li class="page-item"><a class="page-link">2</a></li>
			<li class="page-item"><a class="page-link">3</a></li>
			<li class="page-item"><a class="page-link">Next</a></li>
		</ul>
	</nav>

</div>
<%@ include file="../fixSection/footer.jsp"%>
