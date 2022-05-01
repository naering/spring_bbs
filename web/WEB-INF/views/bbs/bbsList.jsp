<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판</title>
    <!-- include libraries(jQuery, bootstrap) -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<style>
    table,th,td {
        border: 1px solid ;
        text-align: center;
    }
</style>

<%--<c:url var="getBbsList" value="/bbs/getBbsList">--%>
<%--    <c:param name="page" value="${pagination.page}"/>--%>
<%--    <c:param name="range" value="${pagination.range}"/>--%>
<%--    <c:param name="searchType" value="${pagination.searchType}"/>--%>
<%--    <c:param name="keyword" value="${pagination.keyword}"/>--%>
<%--</c:url>--%>

<script>
    // 이전 버튼(페이징)
    function fn_prev(page, range, rangeSize, searchType, keyword) {
        var page = ((range - 2) * rangeSize) + 1;
        var range = range - 1;

        var url = "${pageContext.request.contextPath}/bbs/getBbsList";
        url = url + "?page=" + page;
        url = url + "&range=" + range;
        url = url + "&searchType=" + $('#searchType').val();
        url = url + "&keyword=" + keyword;
        <%--var url = "${getBbsList}";--%>
        location.href = url;
    }

    // 페이지 번호 클릭(페이징)
    function fn_pagination(page, range, rangeSize, searchType, keyword) {
        var url = "${pageContext.request.contextPath}/bbs/getBbsList";
        url = url + "?page=" + page;
        url = url + "&range=" + range;
        url = url + "&searchType=" + $('#searchType').val();
        url = url + "&keyword=" + keyword;
        <%--var url= "${getBbsList}";--%>
        location.href = url;
    }

    // 다음 버튼(페이징)
    function fn_next(page, range, rangeSize, searchType, keyword) {
        var page = parseInt((range * rangeSize)) + 1;
        var range = parseInt(range) + 1;

        var url = "${pageContext.request.contextPath}/bbs/getBbsList";
        url = url + "?page=" + page;
        url = url + "&range=" + range;
        url = url + "&searchType=" + $('#searchType').val();
        url = url + "&keyword=" + keyword;
        <%--var url= "${getBbsList}";--%>
        location.href = url;
    }

    // 글쓰기 버튼
    $(document).on('click', '#btnWrite', function(e){
        e.preventDefault();
        location.href = "${pageContext.request.contextPath}/bbs/bbsWrite";
    });

    // 게시글 조회 버튼
    function fn_contentView(bbsSeq){
        var url = "${pageContext.request.contextPath}/bbs/getBbsCont";
        url = url + "?bbsSeq="+bbsSeq;
        location.href = url;
    }

    // 검색 버튼
    $(document).on('click', '#btnSearch', function (e){
        e.preventDefault();

        var url = "${pageContext.request.contextPath}/bbs/getBbsList";
        url = url + "?searchType=" + $('#searchType').val();
        url = url + "&keyword=" + $('#keyword').val();

        <%--var url = "${getBbsList}";--%>
        location.href = encodeURI(url);  // 한글 검색
    });

</script>
<body>
<h2>게시판 목록</h2>
<div>
    <button type="button" id="btnWrite">글쓰기</button>
</div>
<table>
    <colgroup>
        <col style="width:5%;" />
        <col style="width:auto;" />
        <col style="width:15%;" />
        <col style="width:10%;" />
        <col style="width:10%;" />
    </colgroup>
    <thead>
    <tr>
        <th>순번</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회수</th>
    </tr>
    </thead>
    <tbody>
    <c:choose>
        <c:when test="${empty bbsList }" >
            <tr><td colspan="5" align="center">작성한 게시글이 없습니다.</td></tr>
        </c:when>
        <c:when test="${!empty bbsList}">
            <c:forEach var="list" items="${bbsList}">
                <tr>
                    <td><c:out value="${list.bbsSeq}"/></td>
                    <td>
                        <a href="#" onClick="fn_contentView(<c:out value="${list.bbsSeq}"/>)">
                            <c:out value="${list.bbsTitle}"/>
                        </a>
                    </td>
                    <td><c:out value="${list.memberName}"/></td>
                    <td><c:out value="${list.regDate}"/></td>
                    <td><c:out value="${list.bbsHits}"/></td>
                </tr>
            </c:forEach>
        </c:when>
    </c:choose>
    </tbody>
</table>
<%--페이징 start--%>
<div id="paginationBox">
    <ul class="pagination">
        <c:if test="${pagination.prev}">
            <li class="page-item"><a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.searchType}', '${pagination.keyword}')">Previous</a></li>
        </c:if>
        <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
            <li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.searchType}', '${pagination.keyword}')"> ${idx} </a></li>
        </c:forEach>
        <c:if test="${pagination.next}">
            <li class="page-item"><a class="page-link" href="#" onClick="fn_next('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.searchType}', '${pagination.keyword}')" >Next</a></li>
        </c:if>
    </ul>
</div>
<%--페이징 end--%>
<%--검색 start--%>
<div class="form-group row justify-content-center">
    <div class="w100" style="padding-right:10px">
        <select class="form-control form-control-sm" name="searchType" id="searchType">
            <option value="bbsTitle" <c:if test="${pagination.searchType eq 'bbsTitle'}">selected</c:if>>제목</option>
            <option value="bbsConts" <c:if test="${pagination.searchType eq 'bbsConts'}">selected</c:if>>내용</option>
            <option value="memberName" <c:if test="${pagination.searchType eq 'memberName'}">selected</c:if>>작성자</option>
        </select>
    </div>
    <div class="w300" style="padding-right:10px">
        <input type="text" class="form-control form-control-sm" name="keyword" id="keyword" value="${pagination.keyword}">
    </div>
    <div>
        <button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
    </div>
</div>
<%--검색 end--%>
</body>
</html>
