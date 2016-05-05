<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<c:if test="${not empty message}">
  <p class="bg-success message">
    <spring:message code="${message}" text="Default message place holder. Pelase check your configuration"
      arguments="${messageArg}" />
  </p>
</c:if>
<c:if test="${not empty warningMessage}">
  <p class="bg-danger message">
    <spring:message code="${warningMessage}" text="" />
  </p>
</c:if>
