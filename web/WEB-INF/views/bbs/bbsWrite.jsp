<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri = "http://www.springframework.org/tags/form" %>

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

    <script type="text/javascript">

        $(document).ready(function () {

            var mode = '<c:out value="${mode}"/>';

            if ( mode == 'edit'){
                //입력 폼 셋팅
                $("input:hidden[name='bbsSeq']").val(<c:out value="${bbsCont.bbsSeq}"/>);
                $("input:hidden[name='mode']").val('<c:out value="${mode}"/>');
                $("#bbsTitle").val('<c:out value="${bbsCont.bbsTitle}"/>');
                $("#bbsConts").val('<c:out value="${bbsCont.bbsConts}"/>');
            }

            // 내용 에디터 사용
            $('#bbsConts').summernote({
                height: 500,
                minHeight: 500,
                maxHeight: 500,
                focus: true,
                lang: "ko-KR",
                placeholder: '내용을 입력해주세요.',
                toolbar: [
                    ['fontname', ['fontname']],
                    ['fontsize', ['fontsize']],
                    ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
                    ['color', ['forecolor', 'color']],
                    ['table', ['table']],
                    ['para', ['ul', 'ol', 'paragraph']],
                    ['height', ['height']],
                    ['insert', ['picture', 'link', 'video']],
                    ['view', ['fullscreen', 'help']]
                ],
                fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체',
                    '굴림', '돋음체', '바탕체'],
                fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36',
                    '50', '72']
            });
        });

        $(document).on('click', '#btnSave', function(e){
            e.preventDefault();
            $("#form").submit();
        });

        $(document).on('click', '#btnList', function(e){
            e.preventDefault();
            location.href="${pageContext.request.contextPath}/bbs/getBbsList";
        });
    </script>

    <style>
        body {
            padding-top: 70px;
            padding-bottom: 30px;
        }

        textarea {
            resize: none;
        }
    </style>
</head>
<body>
<article>
    <div class="container" role="main">
        <h2>게시글 작성</h2>
       <form:form name="form" id="form" role="form" modelAttribute="bbsVo" method="post" action="${pageContext.request.contextPath}/bbs/saveBbs">
           <form:hidden path="bbsSeq"/>
           <input type="hidden" name="mode">
           <table>
               <tr>
                   <td>제목</td>
                   <td><form:input path="bbsTitle" type="text" id="bbsTitle" name="bbsTitle" style="width: 900px; height: 30px" autocomplete="off"></form:input></td>
               </tr>
               <tr>
                   <td>내용</td>
                   <td><form:textarea path="bbsConts" id="bbsConts" name="bbsConts"></form:textarea></td>
               </tr>
               <tr>
                   <td>첨부파일</td>
                   <td><input type="file" name="fileNm" ></td>
               </tr>
           </table>
        </form:form>
        <div>
            <button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>
            <button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
        </div>
    </div>
</article>
</body>
</html>