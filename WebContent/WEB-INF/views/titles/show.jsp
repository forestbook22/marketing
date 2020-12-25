<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${users_title != null}">
                <h2>${users_title.title}　詳細ページ</h2>
                <table>
                    <tbody>
                        <tr>
                            <th>4P</th>
                            <c:choose>
                                <c:when test="${fourp != null}">
                                    <td><a href="<c:url value='/fourps/show?id=${fourp.id}' />">詳細を表示</a></td>
                                </c:when>
                                <c:otherwise>
                                    <td><a href="<c:url value="/fourps/new"/>">新規登録</a></td>
                                </c:otherwise>
                            </c:choose>
                        </tr>
                        <tr>
                            <th>SWOT</th>
                            <c:choose>
                                <c:when test="${swot != null}">
                                    <td><a href="<c:url value='/swots/show?id=${swot.id}' />">詳細を表示</a></td>
                                </c:when>
                                <c:otherwise>
                                    <td><a href="<c:url value="/swots/new"/>">新規登録</a></td>
                                </c:otherwise>
                            </c:choose>
                        </tr>
                        <tr>
                            <th>3C</th>
                            <c:choose>
                                <c:when test="${threec != null}">
                                    <td><a href="<c:url value='/threecs/show?id=${threec.id}' />">詳細を表示</a></td>
                                </c:when>
                                <c:otherwise>
                                    <td><a href="<c:url value="/threecs/new"/>">新規登録</a></td>
                                </c:otherwise>
                            </c:choose>
                        </tr>
                        <tr>
                            <th>PEST</th>
                            <c:choose>
                                <c:when test="${pest != null}">
                                    <td><a href="<c:url value='/pests/show?id=${pest.id}' />">詳細を表示</a></td>
                                </c:when>
                                <c:otherwise>
                                    <td><a href="<c:url value="/pests/new"/>">新規登録</a></td>
                                </c:otherwise>
                            </c:choose>
                        </tr>
                        <tr>
                            <th>Segmentation</th>
                            <c:choose>
                                <c:when test="${seg != null}">
                                    <td><a href="<c:url value='/segs/show?id=${seg.id}' />">詳細を表示</a></td>
                                </c:when>
                                <c:otherwise>
                                    <td><a href="<c:url value="/segs/new"/>">新規登録</a></td>
                                </c:otherwise>
                            </c:choose>
                        </tr>
                        <tr>
                            <th>Targeting</th>
                            <c:choose>
                                <c:when test="${target != null}">
                                    <td><a href="<c:url value='/targets/show?id=${target.id}' />">詳細を表示</a></td>
                                </c:when>
                                <c:otherwise>
                                    <td><a href="<c:url value="/targets/new"/>">新規登録</a></td>
                                </c:otherwise>
                            </c:choose>
                        </tr>
                    </tbody>
                </table>
                <br>
                <c:if test="${sessionScope.login_user.id == users_title.user.id}">
                    <p><a href="<c:url value='/titles/edit?id=${users_title.id}' />">タイトル名を編集する</a></p>
                </c:if>
            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>
        <p><a href="<c:url value="/" />">タイトル一覧に戻る</a></p>
    </c:param>
</c:import>