<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="UTF-8">
        <title>フレームワークチェッカ―</title>
        <link rel="stylesheet" href="<c:url value='/css/reset.css' />">
        <link rel="stylesheet" href="<c:url value='/css/style.css' />">
    </head>
    <body>
        <div id="wrapper">
            <div id="header">
                <div id="header_menu">
                    <h1><a href="<c:url value='/' />">Framework Checker</a></h1>&nbsp;&nbsp;&nbsp;
                    <c:if test="${sessionScope.login_user != null}">
                        <c:if test="${sessionScope.login_user.admin_flag == 1}">
                            <a href="<c:url value='/users/index' />">User</a>&nbsp;
                        </c:if>
                        <select name="select" onChange="location.href=value;" id = "menu">
                          <option value="#">戦略立案フレームワーク</option>
                          <option value="/marketing/pests/index">PEST分析</option>
                          <option value="/marketing/threecs/index">3C分析</option>
                          <option value="/marketing/swots/index">SWOT分析</option>
                          <option value="/marketing/segs/index">Segmentation</option>
                          <option value="/marketing/targets/index">Targeting</option>
                          <option value="marketing/positions/index">Positioning</option>
                          <option value="marketing/fourps/index">4P分析</option>
                        </select>&nbsp;
                        <a href="<c:url value='/' />">使い方</a>&nbsp;
                        <a href="<c:url value='/' />">FAQ</a>&nbsp;
                    </c:if>
                </div>
                <c:if test="${sessionScope.login_user != null}">
                    <div id="user_name">
                        <c:out value="${sessionScope.login_user.name}" />&nbsp;さん&nbsp;&nbsp;&nbsp;
                        <a href="<c:url value='/logout' />">Logout</a>
                    </div>
                </c:if>
            </div>
            <div id="content">
                ${param.content}
            </div>
            <div id="footer">
                by Ryosuke Morimoto.
            </div>
        </div>
    </body>
</html>