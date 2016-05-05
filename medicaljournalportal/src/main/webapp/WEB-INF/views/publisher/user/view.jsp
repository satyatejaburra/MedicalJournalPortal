<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<h1>
  <spring:message code="${pageTitle}" arguments="${pageTitleArg}" text="" />
</h1>
<p>${user.name}</p>
<p>${user.description}</p>
<shiro:hasPermission name="user_list">
  <a href="${ctx}/admin/users" class="btn btn-default"><spring:message code="user.list" /></a>
</shiro:hasPermission>
<shiro:hasPermission name="user_edit">
  <a href="${ctx}/admin/users/${user.id}/edit" class="btn btn-default"><spring:message code="admin.actions.edit" /></a>
</shiro:hasPermission>
<shiro:hasPermission name="user_delete">
  <a href="${ctx}/admin/users/${user.id}/delete" class="btn btn-default"><spring:message code="admin.actions.delete" /></a>
</shiro:hasPermission>