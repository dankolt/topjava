<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <title>Meals</title>
</head>
<body>
<h3><a href="index.html">Home</a></h3>
<hr>
<h2>Meals</h2>
<table bordercolor="black" rules="all" border="1">
    <jsp:useBean id="mealList" scope="request" type="java.util.List"/>
    <tr>
        <th scope="col">Time</th>
        <th scope="col">Description</th>
        <th scope="col">Calories</th>
        <th scope="col">isExcess</th>
    </tr>
    <c:forEach items="${mealList}" var="meal">
        <fmt:parseDate value="${ meal.dateTime }" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
        <c:set var="rowFontColorDependsOnDayCaloriesExcess" value="green"/>
        <c:if test="${meal.excess}">
            <c:set var="rowFontColorDependsOnDayCaloriesExcess" value="red"/>
        </c:if>
        <tr style="color:${rowFontColorDependsOnDayCaloriesExcess}">
            <td><fmt:formatDate pattern="dd.MM.yyyy HH:mm" value="${ parsedDateTime }" /></td>
            <td><c:out value="${meal.description}" /></td>
            <td><c:out value="${meal.calories}" /></td>
            <td><c:out value="${meal.excess}" /></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>