<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<nav class="navbar navbar-default">
  <div class="container">
    <div class="navbar-header">
      <a class="navbar-brand" href="${ctx}/"><img alt="${pageTitlePrefix}" src="${ctx}/favorite.ico" width="18" height="18"></a>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <li id="home"><a href="${ctx}/"><spring:message code="page.nav.home" /></a></li>
        <li id="equipments"><a href="${ctx}/equipments"><spring:message code="page.nav.equipments" /></a></li>
        <li id="pigeon_sales"><a href="${ctx}/pigeon_sales"><spring:message code="page.nav.pigeon.sales" /></a></li>
        <li id="news"><a href="${ctx}/news"><spring:message code="page.nav.news" /></a></li>
        <li id="testimonials"><a href="${ctx}/testimonials"><spring:message code="page.nav.testimonials" /></a></li>
        <li id="about_us"><a href="${ctx}/about_us"><spring:message code="page.nav.about" /></a></li>
        <li id="contact_us"><a href="${ctx}/contact_us"><spring:message code="page.nav.contact" /></a></li>
        <li id="strayed_pigeons"><a href="${ctx}/strayed_pigeons"><spring:message code="page.nav.found.strayed.pigeons" /></a></li>
        <li id="how_to_order"><a href="${ctx}/how_to_order"><spring:message code="page.nav.how.to.order" /></a></li>
        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
          aria-expanded="false"><spring:message code="page.nav.links" /><span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <c:forEach var="link" items="${linkList}">
              <li><a href="${link.url}" class="list-group-item" <c:if test="${link.newWindow}"> target="_blank" </c:if> >${link.name}</a></li>
            </c:forEach>
          </ul></li>
      </ul>
    </div>
    <!--/.container-fluid -->
  </div>
  <!--/.nav-collapse -->
</nav>
<script>
<c:if test="${not empty currentNavButton}">
$("li[id=${currentNavButton}]").addClass("active");
</c:if>
<c:if test="${empty currentNavButton}">
$("li[id=home]").addClass("active");
</c:if>
</script>