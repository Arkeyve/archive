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
    .description {
      max-height: 11em;
      overflow-y: hidden;
    }

    img.book-title {
      height: auto;
      width: 100%;
    }

    p {
     color: #222;
     max-height: 4.5em;
     overflow-y: scroll;
   }
 </style>

</head>
<body class="mainbody">

  <!-- Header -->
  <%@ include file="header.jsp" %>

  <sql:query var="bookPurchased" dataSource="${db}">
    SELECT b.book_id, b.title, c.category, b.author, b.description, b.cover
    FROM books as b, category as c
    WHERE b.category_id = c.category_id AND b.book_id IN 
    (
    SELECT book_id
    FROM users_purchase
    WHERE user_id = <%= session.getAttribute("UserID") %>
    )
  </sql:query>

  <div class="ui main container">
    <h1 class="ui header">Purchased</h1>
    <c:if test="${empty bookPurchased.rows}">
      <center>Books you purchase will be displayed here.</center>
    </c:if>
    <c:forEach var="row" items="${bookPurchased.rows}">
      <div class="ui two stackable grid cards">
        <a href="book.jsp?id=${row.book_id}" class="ui fluid card" style="width: 10%;">
          <div class="image">
            ${row.cover}
          </div>
        </a>
        <a href="book.jsp?id=${row.book_id}" class="ui fluid card" style="width: 85%;">
          <div class="content">
            <div class="header">${row.title}</div>
            <div class="meta">
              <span class="category">${row.category}</span>
              <p>${row.description}</p>
            </div>
          </div>
          <div class="extra content">
            <div class="right floated author">
              By - ${row.author}
            </div>
          </div>
        </a>
      </div>
    </c:forEach>

  <sql:query var="bookRead" dataSource="${db}">
    SELECT b.book_id, b.title, c.category, b.author, b.description, b.cover
    FROM books as b, category as c
    WHERE b.category_id = c.category_id AND b.book_id IN 
    (
    SELECT book_id
    FROM users_read
    WHERE user_id = <%= session.getAttribute("UserID") %>
    )
  </sql:query>

    <h1 class="ui header">Read Earlier</h1>
    <c:if test="${empty bookRead.rows}">
      <center>Books you read will be displayed here.</center>
    </c:if>
    <c:forEach var="row" items="${bookRead.rows}">
      <div class="ui two stackable grid cards">
        <a href="book.jsp?id=${row.book_id}" class="ui fluid card" style="width: 10%;">
          <div class="image">
            <!-- <img class="book-title" src="./assets/images/book_covers/the-martian.jpg" /> -->
            ${row.cover}
          </div>
        </a>
        <a href="book.jsp?id=${row.book_id}" class="ui fluid card" style="width: 85%;">
          <div class="content">
            <div class="header">${row.title}</div>
            <div class="meta">
              <span class="category">${row.category}</span>
              <p>${row.description}</p>
            </div>
          </div>
          <div class="extra content">
            <div class="right floated author">
              By - ${row.author}
            </div>
          </div>
        </a>
      </div>
    </c:forEach>
  </div>

  <!-- Footer -->
  <%@ include file="footer.jsp" %>
</body>

</html>
