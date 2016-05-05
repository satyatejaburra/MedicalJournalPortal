<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row">
  <nav>
    <ul class="pagination">
      <li><a href="?page=1&size=${pageSize}" aria-label="First"> <span aria-hidden="true">&laquo;</span>
      </a></li>
      <li><a href="?page=${previousPage}&size=${pageSize}" aria-label="Previous"> <span aria-hidden="true">&lt;</span>
      </a></li>
      <c:forEach begin="1" end="${totalPages}" varStatus="loop">
        <li <c:if test="${currentPage eq loop.index }">class="active"</c:if>><a
          href="?page=${loop.index}&size=${pageSize}">${loop.index}</a></li>
      </c:forEach>
      <li><a href="?page=${nextPage}&size=${pageSize}" aria-label="Next"> <span aria-hidden="true">&gt;</span>
      </a></li>
      <li><a href="?page=${totalPages}&size=${pageSize}" aria-label="Last"> <span aria-hidden="true">&raquo;</span>
      </a></li>
    </ul>
  </nav>
</div>