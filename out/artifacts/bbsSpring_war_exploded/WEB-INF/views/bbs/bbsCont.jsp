<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판</title>

    <!-- include libraries(jQuery, bootstrap) -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

    <script>
        $(document).ready(function(){
            showCommentList();  // 댓글 목록 바로 조회
        });

        //목록으로 이동
        $(document).on('click', '#btnList', function(){
            location.href = "${pageContext.request.contextPath}/bbs/getBbsList";
        });

        //수정 버튼
        $(document).on('click', '#btnUpdate', function(){
            var url = "${pageContext.request.contextPath}/bbs/bbsUpdate";
            url = url + "?bbsSeq="+${bbsCont.bbsSeq};
            // bbsWrite.jsp 입력폼을 신규등록 이외에 수정에서도 사용하기 위해 필요한 인자값(구분값)
            url = url + "&mode=edit";
            location.href = url;
        });

        //삭제 버튼
        $(document).on('click', '#btnDelete', function(){
            var url = "${pageContext.request.contextPath}/bbs/bbsDelete";
            url = url + "?bbsSeq="+${bbsCont.bbsSeq};
            location.href = url;
        });

        //댓글 목록 조회
        function showCommentList(){
            var url = "${pageContext.request.contextPath}/comment/getCommentList";
            var paramData = {"bbsSeq" : "${bbsCont.bbsSeq}"};
            $.ajax({
                type: 'POST',
                url: url,
                data: paramData,
                dataType: 'json',
                success: function(result) {
                    var htmls = "";
                    if(result.length < 1){
                        htmls ="등록된 댓글이 없습니다.";
                    } else {
                        $(result).each(function(){
                            console.log(result);
                            htmls += '<div class="media text-muted pt-3" id="commentSeq' + this.commentSeq + '">';
                            htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
                            htmls += '<title>Placeholder</title>';
                            htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
                            htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
                            htmls += '</svg>';
                            htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
                            htmls += '<span class="d-block">';
                            htmls += '<strong class="text-gray-dark">' + this.memberId + '</strong>';
                            htmls += '<span style="padding-left: 7px; font-size: 9pt">';
                            htmls += '<a href="javascript:void(0)" onclick="fn_updateComment(' + this.commentSeq + ', \'' + this.memberId + '\', \'' + this.commentConts + '\' )" style="padding-right:5px">수정</a>';
                            htmls += '<a href="javascript:void(0)" onclick="fn_deleteComment(' + this.commentSeq + ')" >삭제</a>';
                            htmls += '</span>';
                            htmls += '</span>';
                            htmls += this.commentConts;
                            htmls += '</p>';
                            htmls += '</div>';
                        });	//each end
                    }
                    $("#commentList").html(htmls);
                }	   // Ajax success end
            });	// Ajax end
        }

        //댓글 저장 버튼
        $(document).on('click', '#btnCommentSave', function(){
            var commentConts = $('#commentConts').val();
            var paramData = JSON.stringify({
                "commentConts": commentConts
                , "bbsSeq":'${bbsCont.bbsSeq}'
            });
            var headers = {"Content-Type" : "application/json"
                , "X-HTTP-Method-Override" : "POST"};
            var url = "${pageContext.request.contextPath}/comment/insertComment";
            $.ajax({
                <%--url: "${saveReplyURL}"--%>
                  url: url
                , headers : headers
                , data : paramData
                , type : 'POST'
                , dataType : 'text'
                , success: function(result){
                    showCommentList();
                    $('#commentConts').val('');
                }
                , error: function(error){
                    console.log("에러 : " + error);
                }
            });
        });

        // 댓글 수정 버튼
        function fn_updateComment( commentSeq, memberId, commentConts){

            var htmls = "";
            htmls += '<div class="media text-muted pt-3" id="commentSeq' + commentSeq + '">';
            htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
            htmls += '<title>Placeholder</title>';
            htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
            htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
            htmls += '</svg>';
            htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
            htmls += '<span class="d-block">';
            htmls += '<strong class="text-gray-dark">' + memberId + '</strong>';
            htmls += '<span style="padding-left: 7px; font-size: 9pt">';
            htmls += '<a href="javascript:void(0)" onclick="fn_updateSaveComment(' + commentSeq + ', \'' + memberId + '\')" style="padding-right:5px">저장</a>';
            htmls += '<a href="javascript:void(0)" onClick="showCommentList()">취소<a>';
            htmls += '</span>';
            htmls += '</span>';
            htmls += '<textarea name="editContent" id="editContent" class="form-control" rows="3">';
            htmls += commentConts;
            htmls += '</textarea>';
            htmls += '</p>';
            htmls += '</div>';

            $('#commentSeq' + commentSeq).replaceWith(htmls);
            $('#commentSeq' + commentSeq + ' #editContent').focus();
        }

        // 댓글 수정 후 저장 버튼
        function fn_updateSaveComment( commentSeq ){
            var replyEditContent = $('#editContent').val();
            var paramData = JSON.stringify({
                "commentConts": replyEditContent
                , "commentSeq": commentSeq
            });
            var headers = {"Content-Type" : "application/json"
                , "X-HTTP-Method-Override" : "POST"};
            var url = "${pageContext.request.contextPath}/comment/updateComment";

            $.ajax({
                url: url
                , headers : headers
                , data : paramData
                , type : 'POST'
                , dataType : 'text'
                , success: function(result){
                    console.log(result);
                    showCommentList();
                }
                , error: function(error){
                    console.log("에러 : " + error);
                }
            });
        }

        // 댓글 삭제
        function fn_deleteComment(commentSeq){
            var paramData = {"commentSeq": commentSeq};
            var url = "${pageContext.request.contextPath}/comment/deleteComment";
            $.ajax({
                url: url
                , data : paramData
                , type : 'POST'
                , dataType : 'text'
                , success: function(result){
                    showCommentList();
                }
                , error: function(error){
                    console.log("에러 : " + error);
                }
            });
        }
    </script>
</head>

<body>
<article>
    <div class="container" role="main">
        <h2>게시글 조회</h2>
        <table>
            <tr>
                <td>작성자 : <c:out value="${bbsCont.memberName}"/></td>
                <td>조회수  <c:out value="${bbsCont.bbsHits}"/></td>
            </tr>
            <tr>
                <td>제목 : <c:out value="${bbsCont.bbsTitle}"/></td>
                <td>작성일자 : <c:out value="${bbsCont.regDate}"/></td>
            </tr>
            <tr>
                <td><textarea id="bbsConts" name="bbsConts"><c:out value="${bbsCont.bbsConts}"/></textarea></td>
            </tr>
            <tr>
                <td>첨부파일</td>
                <td><input type="file" name="fileNm" >첨부파일 다운로드행함</td>
            </tr>
        </table>
        <div style="margin-top : 20px">
            <button type="button" class="btn btn-sm btn-primary" id="btnUpdate">수정</button>
            <button type="button" class="btn btn-sm btn-primary" id="btnDelete">삭제</button>
            <button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
        </div>

        <!-- 댓글 Start -->
        <div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
            <form:form name="form" id="form" role="form" modelAttribute="commentVo" method="post">
                <form:hidden path="bbsSeq" id="bbsSeq"/>
                <div class="row">
                    <div class="col-sm-10">
                        <form:textarea path="commentConts" id="commentConts" class="form-control" rows="3" placeholder="댓글을 입력해 주세요"></form:textarea>
                    </div>
                    <div class="col-sm-2">
<%--                        <form:input path="memberId" class="form-control" id="memberId" placeholder="댓글 작성자"></form:input>--%>
                        <button type="button" class="btn btn-sm btn-primary" id="btnCommentSave" style="width: 100%; margin-top: 10px">저장</button>
                    </div>
                </div>
            </form:form>
        </div>
        <!-- 댓글 목록 -->
        <div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
            <h3 class="border-bottom pb-2 mb-0">댓글 목록</h3>
            <div id="commentList"></div>
        </div>
        <!-- 댓글 End -->
    </div>
</article>
</body>
</html>

