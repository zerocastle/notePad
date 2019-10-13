<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../fixSection/header.jsp"%>

<script src="/resources/js/dropzone.js"></script>
<link href="/resources/css/dropzone.css" rel="stylesheet">

<script>
Dropzone.autoDiscover = false;
var formData = new FormData();
var file_name;

$(document).ready(function() {
	
	var myDropzone = new Dropzone("div#dZUpload", 
			
		{ 	url: "/board/board_file",
			addRemoveLinks :true,
			success: function(file){
				formData.append(file.name, dataURLtoBlob(file.dataURL), file.name);
				console.log(formData.get(file.name));
			},
			removedfile: function(file) {
				formData.delete(file.name);
				file.previewElement.remove(); 
			}
		});
	
	//글쓰기
	$(document).on("click", "#write", function(e){
		alert("퍼큐");
		e.preventDefault();
		$.ajax({
			url: "/board/fileUpload",
			type: "POST",
			contentType : false,
	        processData : false,
			data: formData,
			success : function(data){
				file_name = data;
				
				var str = '<input type="hidden" name="file_name" id="file_name" value="'+file_name+'"/>';
				
				$("#board_form").append(str);
				$("#board_form").append('<input type="submit" id="submit"/>');
				$("#submit").trigger("click");
			}
		});
	});
});

//**dataURL to blob**
function dataURLtoBlob(dataurl) {
    var arr = dataurl.split(','), mime = arr[0].match(/:(.*?);/)[1],
        bstr = atob(arr[1]), n = bstr.length, u8arr = new Uint8Array(n);
    while(n--){
        u8arr[n] = bstr.charCodeAt(n);
    }
    return new Blob([u8arr], {type:mime});
}

</script>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">작성하기</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">

				<div class="panel-heading">작성하기</div>
				<!-- /.panel-heading -->
				<div class="panel-body">

					<form id="board_form" role="form"
						action="http://localhost:8181/board/fileUpload"
						enctype="multipart/form-data" method="post">
						<div class="form-group">
							<label>제목</label> <input class="form-control" name='title'
								id='title'>
						</div>


						<div class="form-group">
							<label>content</label>
							<textarea class="form-control" rows="3" name='content'
								id='content'></textarea>
						</div>

						<!-- 이미지 드래그엔 드랍 -->
						<div class="outerDorpzone">
							<br />
							<div id="dZUpload" class="dropzone">
								<div class="dz-default dz-message">Drop files here or
									click to upload.</div>
							</div>
						</div>

						<button id="write">파일업로드 테스트</button>



						<div class="form-group">
							<label>작성자</label> <input type="hidden" class="form-control"
								name='id' value="${sessionScope.member.id }" /> <input
								value="${sessionScope.member.name}" readonly />

						</div>
					</form>
					<a href="#" class="btn btn-info">저장하기</a> <a href="/move/board"
						class="btn btn-info">목록으로</a>
				</div>
				<!--  end panel-body -->

			</div>
			<!--  end panel-body -->
		</div>
		<!-- end panel -->
	</div>
</div>

<%-- <%@ include file="../fixSection/footer.jsp"%> --%>