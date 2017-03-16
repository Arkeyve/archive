<!DOCTYPE html>
<html>
<head>
  <!-- Standard Meta -->
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

  <!-- Site Properties -->
  <title>Login - Archive</title>
  <link rel="stylesheet" type="text/css" href="./dist/semantic.css">

  <script src="assets/library/jquery.min.js"></script>
  <script src="./dist/semantic.js"></script>

  <style type="text/css">
    body {
      background-color: #DADADA;
    }
    body > .grid {
      height: 100%;
    }
    .image {
      margin-top: -100px;
    }
    .column {
      max-width: 450px;
    }
  </style>
  <script>
    $(document)
    .ready(function() {
      $('.ui.form')
      .form({
        fields: {
          email: {
            identifier  : 'email',
            rules: [
            {
              type   : 'empty',
              prompt : 'Please enter your e-mail'
            },
            {
              type   : 'email',
              prompt : 'Please enter a valid e-mail'
            }
            ]
          },
          password: {
            identifier  : 'password',
            rules: [
            {
              type   : 'empty',
              prompt : 'Please enter your password'
            },
            {
              type   : 'length[6]',
              prompt : 'Your password must be at least 6 characters'
            }
            ]
          }
        }
      })
      ;
    })
    ;
  </script>
</head>
<body>

  <!-- Header -->
  <%@ include file="header.jsp" %>

  <div class="ui middle aligned center aligned grid">
    <div class="column">
      <h2 class="ui teal image header">
        <img src="assets/images/logo.png" class="image">
        <div class="content">
          <%
          if( request.getParameter("access") != null ) {
            out.println("Log-in to continue");
          } else {
            out.println("Log-in to your account");
          }
          %>
        </div>
      </h2>

      <form class="ui large form" method="post" action="login.jsp">
        <div class="ui stacked segment">
          <div class="field">
            <div class="ui left icon input">
              <i class="user icon"></i>
              <input type="text" name="email" placeholder="E-mail address">
            </div>
          </div>
          <div class="field">
            <div class="ui left icon input">
              <i class="lock icon"></i>
              <input type="password" name="password" placeholder="Password">
            </div>
          </div>
          <button type="submit" name="login" value="login" class="ui fluid large teal submit button">Login</button>
        </div>

        <div class="ui error message">

        </div>

      </form>

      <div class="ui message">
        New to us? <a href="signup.jsp">Sign Up</a>
      </div>
    </div>
  </div>


</body>

</html>

<%@ page import="com.onlib.User" %>
<%
if( request.getParameter("email") != null && request.getParameter("password") != null ) {
  int uid = new User().login( request.getParameter("email"), request.getParameter("password") );
  if( uid != 0 ) {
    out.println( "<script>alert('Logged In');</script>" );
    session.setAttribute("UserID", uid);
    %>
    <jsp:forward page="index.jsp" />
    <%
  } else {
    out.println( "<script>alert('Invalid e-mail password combination');</script>" );
  }
}
%>
