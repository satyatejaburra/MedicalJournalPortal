<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div class="panel panel-green panel-default small">
  <div class="panel-heading ">
    <spring:message code="categories" />
  </div>
  <div class="list-group">
    <c:forEach var="category" items="${categoryList}">
      <a href="${ctx}/categories/${category.id}" class="list-group-item"><span class="badge">${category.productNumber}</span>${category.name}</a>
    </c:forEach>
  </div>
</div>


