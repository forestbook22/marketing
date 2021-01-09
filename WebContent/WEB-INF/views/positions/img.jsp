<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${position != null}">
                <h2>PositioningMap　アップロードページ</h2>
                <p>タイトル:${sessionScope.users_title.title}</p>
                <p>STEP1:設定した${position.x}(${position.x1},${position.x2})と${position.y}(${position.y1},${position.y2})
                の軸をもとに<a href="<c:url value='https://www.positioning-map.com/' />">ポジショニングマップ</a>を作成</p>
                <p>STEP2:スクリーンショットを取り、アップロード</p>
                <form method="POST" enctype="multipart/form-data" action="<c:url value='/positions/upload' />">
                    <input type="file" name="file"/><br /><br />
                    <button type="submit">アップロード</button>
                </form>
            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>
        <p><a href="<c:url value='/positions/index' />">一覧に戻る</a></p>
    </c:param>
</c:import>