<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">Please sign in</h3>
  </div>
  <div class="panel-body">
    <form name="loginform" action="${ctx}/login" method="POST" accept-charset="UTF-8" role="form">
      <fieldset>
        <div class="form-group">
          <input class="form-control" placeholder="Username or Email" name="username" type="text">
        </div>
        <div class="form-group">
          <input class="form-control" placeholder="Password" name="password" type="password" value="">
        </div>
        <div class="form-group">
          ${captchaScript}
        </div>
        <div class="checkbox">
          <label> <input name="rememberMe" type="checkbox" value="true" checked> <spring:message
              code="actions.remember.me" />
          </label>
        </div>
        <input class="btn btn-lg btn-success btn-block" type="submit" value="Login">
      </fieldset>
    </form>
  </div>
</div>
