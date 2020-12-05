<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test = "${flush != null}" >
            <div id = "flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <h2>Welcome to Marketing Checker</h2>
        <h3>【Your Strategy】</h3>
        <table id="strategy_list">
            <tbody>
                <tr>
                    <th class="strategy_name">Name</th>
                    <th class="strategy_date">Date</th>
                    <th class="strategy_frame">Framework</th>
                    <th class="strategy_title">Title</th>
                    <th class="strategy_action">Action</th>
                </tr>
                <c:forEach var="fourp" items="${fourps}" varStatus="status">
                    <tr class="row${status.count % 2}">
                       <c:choose>
                             <c:when test="${fourp.delete_flag == 0}">
                                 <td class="fourp_name"><c:out value="${fourp.user.name}" /></td>
                                 <td class="fourp_date"><fmt:formatDate value='${fourp.fourp_date}' pattern='yyyy-MM-dd' /></td>
                                 <td class="fourp_frame">${fourp.frame}</td>
                                 <td class="fourp_title">${fourp.title}</td>
                                 <td class="fourp_action"><a href="<c:url value='/fourps/show?id=${fourp.id}' />">Detail</a></td>
                             </c:when>
                       </c:choose>
                    </tr>
                </c:forEach>
                <c:forEach var="swot" items="${swots}" varStatus="status">
                    <tr class="row${status.count % 2}">
                       <c:choose>
                             <c:when test="${swot.delete_flag == 0}">
                                 <td class="swot_name"><c:out value="${swot.user.name}" /></td>
                                 <td class="swot_date"><fmt:formatDate value='${swot.swot_date}' pattern='yyyy-MM-dd' /></td>
                                 <td class="swot_frame">${swot.frame}</td>
                                 <td class="swot_title">${swot.title}</td>
                                 <td class="swot_action"><a href="<c:url value='/swots/show?id=${swot.id}' />">Detail</a></td>
                             </c:when>
                         </c:choose>
                    </tr>
                </c:forEach>
                <c:forEach var="threec" items="${threecs}" varStatus="status">
                    <tr class="row${status.count % 2}">
                       <c:choose>
                             <c:when test="${threec.delete_flag == 0}">
                                 <td class="threec_name"><c:out value="${threec.user.name}" /></td>
                                 <td class="threec_date"><fmt:formatDate value='${threec.threec_date}' pattern='yyyy-MM-dd' /></td>
                                 <td class="threec_frame">${threec.frame}</td>
                                 <td class="threec_title">${threec.title}</td>
                                 <td class="threec_action"><a href="<c:url value='/threecs/show?id=${threec.id}' />">Detail</a></td>
                             </c:when>
                         </c:choose>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div id="pagination">
            （全 ${fourp_count + swots_count} 件）<br />
            <c:forEach var="i" begin="1" end="${((fourps_count + swots_count - 1) / 15) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
        <h3><a href="<c:url value='/select' />">新規フレームワーク登録</a></h3>
    </c:param>
</c:import>