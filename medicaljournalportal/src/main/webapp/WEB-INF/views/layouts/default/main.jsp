<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<c:set var="ctx" scope="session" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>${pageTitlePrefix} - <spring:message code="${pageTitle}" arguments="${pageTitleArg}" text=""/></title>
<link rel="shortcut icon" href="${ctx}/favorite.ico" />
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="${ctx}/common/css/main.css">
<!-- Latest compiled and minified JavaScript -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<!-- jquery ui -->
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>

<!-- jquery-ui-timepicker-addon -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-ui-timepicker-addon/1.4.5/jquery-ui-timepicker-addon.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ui-timepicker-addon/1.4.5/jquery-ui-timepicker-addon.js"></script>


<script src="//cdn.ckeditor.com/4.4.7/full-all/ckeditor.js"></script>

<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/jquery.slick/1.5.0/slick.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/jquery.slick/1.5.0/slick-theme.css"/>
<script type="text/javascript" src="//cdn.jsdelivr.net/jquery.slick/1.5.0/slick.min.js"></script>

<link rel="stylesheet" href="${ctx}/common/css/blueimp-gallery.min.css" />

</head>
<body>
  <div class="container">
    <div class="container">
      <tiles:insertAttribute name="header_logo" />
    </div>
    <div class="container">
      <tiles:insertAttribute name="header" />
    </div>
    <div class="container-fluid">
      <div class="row">
        <div class="col-lg-3">
          <tiles:insertAttribute name="menu" ignore="true" />
        </div>
        <div class="col-lg-8 col-lg-offset-1">
          <div class="row">
            <tiles:insertAttribute name="message" />
          </div>
          <div class=row>
            <tiles:insertAttribute name="body" />
          </div>
        </div>
      </div>
    </div>
    <div class="container-fluid">
      <tiles:insertAttribute name="footer" />
    </div>
  </div>
  <script src="${ctx}/common/javascript/main.js"></script>
</body>
</html>
