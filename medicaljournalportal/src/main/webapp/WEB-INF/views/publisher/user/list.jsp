<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<h1>
  <spring:message code="${pageTitle}" arguments="${pageTitleArg}" text="" />
</h1>
<table class="table table-striped table-hover ">
  <thead>
    <tr>
      <th><spring:message code="user.name" /></th>
      <th><spring:message code="user.email" /></th>
      <th><spring:message code="role" /></th>
      <th><spring:message code="admin.page.list.actions" /></th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="user" items="${userPage.content}">
      <tr>
        <td><a href="${ctx}/admin/users/${user.id}">${user.name}</a></td>
        <td>${user.email}</td>
        <td><c:forEach var="role" items="${user.roles}">
            <span class="label label-default">${permission.role}</span>
          </c:forEach></td>
        <td><shiro:hasPermission name="user_edit">
            <a href="${ctx}/admin/users/${user.id}/edit" class="btn btn-default"><spring:message
                code="admin.actions.edit" /></a>
          </shiro:hasPermission> <shiro:hasPermission name="user_save">
            <a href="${ctx}/admin/users/${user.id}/change_password" class="btn btn-default"><spring:message
                code="user.page.title.change.password" /></a>
          </shiro:hasPermission> <shiro:hasPermission name="user_delete">
            <a href="${ctx}/admin/users/${user.id}/delete" class="btn btn-default"><spring:message
                code="admin.actions.delete" /></a>
          </shiro:hasPermission></td>
      </tr>
    </c:forEach>
  </tbody>
</table>

<%@ include file="/WEB-INF/views/layouts/default/pagination.jsp"%>

<shiro:hasPermission name="user_create">
  <a href="${ctx}/admin/users/create" class="btn btn-default"><spring:message code="admin.actions.create" /></a>
</shiro:hasPermission>
