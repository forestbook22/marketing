<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${fourp != null}">
                <h2>4P　詳細ページ</h2>

                <table>
                    <tbody>
                        <tr>
                            <th>氏名</th>
                            <td><c:out value="${fourp.user.name}" /></td>
                        </tr>
                        <tr>
                            <th>日付</th>
                            <td><fmt:formatDate value="${fourp.fourp_date}" pattern="yyyy-MM-dd" /></td>
                        </tr>
                        <tr>
                            <th>タイトル</th>
                            <td><c:out value="${fourp.title}" /></td>
                        </tr>
                        <tr>
                            <th>登録日時</th>
                            <td>
                                <fmt:formatDate value="${fourp.created_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                            </td>
                        </tr>
                        <tr>
                            <th>更新日時</th>
                            <td>
                                <fmt:formatDate value="${fourp.updated_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div>
                <p>Product</p>
                <c:out value="${fourp.product}"></c:out>
                </div>
                <div>
                <p>Price</p>
                <c:out value="${fourp.price}"></c:out>
                </div>
                <div>
                <p>Place</p>
                <c:out value="${fourp.place}"></c:out>
                </div>
                <div>
                <p>Promotion</p>
                <c:out value="${fourp.promotion}"></c:out>
                </div>
                <c:if test="${sessionScope.login_user.id == fourp.user.id}">
                    <p><a href="<c:url value="/fourps/edit?id=${fourp.id}" />">このフレームワークを編集する</a></p>
                </c:if>
            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>

        <p><a href="<c:url value="/fourps/index" />">一覧に戻る</a></p>
    </c:param>
</c:import>