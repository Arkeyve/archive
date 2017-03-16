<!DOCTYPE html>
<html>
<head>
  <!-- Standard Meta -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

  <!-- Site Properties -->
  <title>Signup - Archive</title>
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
    .ui.label {
      width: 6em;
    }
  </style>
  <script>
    $(document)
    .ready(function() {
      $('.ui.form')
      .form({
        fields: {
          name: {
            identifier : 'name',
            rules: [
            {
              type: 'empty',
              prompt: 'Please enter your name'
            }
            ]
          },
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
          Sign Up
        </div>
      </h2>
      <form class="ui large form" method="post" action="signup.jsp">
        <div class="ui stacked segment">
          <div class="field">
            <div class="ui labeled corner input">
              <label class="ui label" for="name">Name</label>
              <input type="text" name="name" placeholder="Name">
              <label class="ui corner label"><i class="asterisk icon"></i></label>
            </div>
          </div>
          <div class="field">
            <div class="ui labeled corner input">
              <label class="ui label" for="email">E-mail</label>
              <input type="text" name="email" placeholder="E-mail address">
              <label class="ui corner label"><i class="asterisk icon"></i></label>
            </div>
          </div>
          <div class="field">
            <div class="ui labeled corner input">
              <label class="ui label" for="password">Password</label>
              <input type="password" name="password" placeholder="Password">
              <label class="ui corner label"><i class="asterisk icon"></i></label>
            </div>
          </div>
          <button type="submit" name="signup" value="signup" class="ui fluid large teal submit button">Sign Up</button>
        </div>

        <div class="ui error message"></div>

</form>

</div>
</div>


</body>

</html>

<%@ page import="com.onlib.User" %>
<%
if( request.getParameter("email") != null && request.getParameter("password") != null && request.getParameter("name") != null ) {
  if( new User().signup( request.getParameter("email"), request.getParameter("password"), request.getParameter("name") ) ) {
    out.println( "<script> alert('Thank you for Signing Up. Please login to continue'); </script>" );
  } else {
    out.println( "<script>alert('Email ID already exists');</script>" );
  }
}
%>
