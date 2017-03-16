<%
if( session.getAttribute("UserID") == null || request.getParameter("id") == null ) {
%>
<jsp:forward page="./login.jsp?access=0" />
<%
}
%>

<!DOCTYPE html>
<html>
<head>
  <!-- Standard Meta -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

  <!-- Site Properties -->
  <title>Archive</title>
  <link rel="stylesheet" type="text/css" href="./dist/semantic.css">

  <style type="text/css">
    body {
      background-color: #FFFFFF;
    }
    .main.container {
      margin-top: 7em;
    }
    .wireframe {
      margin-top: 2em;
    }
    iframe.book_preview {
      height: 100vh;
      width: 100%;
      border: 0px;
    }
  </style>

</head>
<body class="mainbody">

  <!-- Header -->
  <%@ include file="header.jsp" %>

<sql:query var="bookPurchased" dataSource="${db}">
  SELECT *
  FROM users_purchase
  WHERE user_id = <%= session.getAttribute("UserID") %>
  AND book_id = <%= request.getParameter("id") %>
</sql:query>

<sql:query var="bookInfo" dataSource="${db}">
  SELECT book_id, title, description, price, pdf_address, dl 
  FROM books 
  WHERE book_id = <%= request.getParameter("id") %> 
</sql:query>

<c:forEach var="row" items="${bookInfo.rows}">
<div class="ui container">
  <div class="ui two cards">
    <div class="ui card" style="width: 70%">
      <div class="content">
        ${row.pdf_address}
      </div>
    </div>
    <div class="ui card" style="width: 25%">
      <div class="content">
        <div class="ui header black right ribbon label">${row.title}</div>
        <p style="margin: 1em; text-align: justify;">
          ${row.description}
        </p>
        <div class="ui tag labels">
          <c:if test="${empty bookPurchased.rows}">
            <a class="ui green label" href="purchase.jsp?id=${row.book_id}">Buy Now at &#8377;${row.price}</a>
          </c:if>
          <c:if test="${not empty bookPurchased.rows}">
            <!-- <a class="ui green label" href="#">Gift to Someone</a> -->
            <a class="ui green label" href="${row.dl}">Download PDF</a>
          </c:if>
        </div>
      </div>
    </div>
  </div>
</div>
</c:forEach>

</div>

<sql:query var="checkIfRead" dataSource="${db}">
  SELECT * from users_read where user_id = <%= session.getAttribute("UserID") %> and book_id = <%= request.getParameter("id") %>;
</sql:query>

<c:if test="${empty checkIfRead.rows}">
  <sql:update dataSource="${db}">
    INSERT INTO users_read values( <%= session.getAttribute("UserID") %>, <%= request.getParameter("id") %> )
  </sql:update>
</c:if>

<!-- Footer -->
<%@ include file="footer.jsp" %>
</body>

</html>
