<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="/WEB-INF/custom-functions.tld" prefix="cf"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div class="panel panel-default">
  <div class="panel-body">
    <form:form method="POST" modelAttribute="user" action="${ctx}/admin/users/save" class="form-horizontal">
      <fieldset>
        <form:hidden path="id" />
        <form:hidden path="password"/>
        <form:hidden path="confirmPassword"/>
        <legend>
          <spring:message code="${pageTitle}" arguments="${pageTitleArg}" />
        </legend>
        <div class="form-group">
          <label for="name" class="col-sm-2 control-label"><spring:message code="user.name" /></label>
          <div class="col-sm-10">
            <form:input path="name" class="form-control" />
            <form:errors path="name" cssClass="text-danger" />
          </div>
        </div>
        <div class="form-group">
          <label for="email" class="col-sm-2 control-label"><spring:message code="user.email" /></label>
          <div class="col-sm-10">
            <input id="email" name="email" class="form-control" type="text" value="${user.email}"
              <c:if test="${not empty user.id}">readonly</c:if>>
            <form:errors path="email" cssClass="text-danger" />
          </div>
        </div>
        <div class="form-group">
          <label for="description" class="col-sm-2 control-label"><spring:message code="user.description" /></label>
          <div class="col-sm-10">
            <form:textarea path="description" class="form-control" />
            <form:errors path="description" cssClass="text-danger" />
          </div>
        </div>
        <div class="form-group">
          <label for="name" class="col-sm-2 control-label"><spring:message code="role" /></label>
          <div class="col-sm-10">
            <c:forEach var="role" items="${allRoles}" varStatus="row">
              <div class="checkbox">
                <label> <input name="roles" type="checkbox" value="${role.id}"
                  <c:if test="${ cf:contains(user.roles, role)}">checked</c:if> /> ${role.name}
                </label>
              </div>
            </c:forEach>
            <form:errors path="roles" cssClass="text-danger" />
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default">
              <spring:message code="admin.actions.save" />
            </button>
          </div>
        </div>
      </fieldset>
    </form:form>
  </div>
</div>
<a href="${ctx}/admin/users" class="btn btn-default"><spring:message code="user.list" /></a>
