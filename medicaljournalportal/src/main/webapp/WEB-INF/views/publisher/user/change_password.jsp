<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<c:set var="formLegend" value="user.page.title.change.password" />

<div class="panel panel-default">
  <div class="panel-body">
    <form:form method="POST" modelAttribute="user" class="form-horizontal">
      <fieldset disabled>
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
            <form:input path="email" class="form-control" />
            <form:errors path="email" cssClass="text-danger" />
          </div>
        </div>
        <div class="form-group">
          <label for="description" class="col-sm-2 control-label"><spring:message code="user.description" /></label>
          <div class="col-sm-10">
            <form:input path="description" class="form-control" />
            <form:errors path="description" cssClass="text-danger" />
          </div>
        </div>
      </fieldset>
      <fieldset>
        <form:hidden path="id" />
        <div class="form-group">
          <label for="password" class="col-sm-2 control-label"><spring:message code="user.password" /></label>
          <div class="col-sm-10">
            <form:password path="password" class="form-control" />
            <form:errors path="password" cssClass="text-danger" />
          </div>
        </div>
        <div class="form-group">
          <label for="confirmPassword" class="col-sm-2 control-label"><spring:message
              code="user.confirm.password" /></label>
          <div class="col-sm-10">
            <form:password path="confirmPassword" class="form-control" />
            <form:errors path="confirmPassword" cssClass="text-danger" />
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default">
              <spring:message code="admin.actions.save" />
            </button>
            <a href="${ctx}/" class="btn btn-default"><spring:message code="actions.back" /></a>
          </div>
        </div>
      </fieldset>
    </form:form>
  </div>
</div>
