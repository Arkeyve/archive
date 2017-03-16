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
  </style>

</head>
<body class="mainbody">

  <!-- Header -->
  <%@ include file="header.jsp" %>

  <div class="ui main container">
    <sql:query var="books" dataSource="${db}">
      SELECT b.book_id, b.cover, b.title, b.author, c.category 
      FROM books as b, category as c, users_purchase as u 
      WHERE b.category_id = c.category_id 
      AND b.book_id = u.book_id 
      GROUP BY book_id 
      ORDER BY COUNT(u.book_id) DESC 
      LIMIT 10
    </sql:query>

    <div class="ui five stackable grid cards">
      <c:forEach var="row" items="${books.rows}">
        <a href="book.jsp?id=${row.book_id}" class="ui fluid card">
          <div class="image">
            ${row.cover}
          </div>
          <div class="content">
            <div class="header">${row.title}</div>
            <div class="meta">
              <span class="category">${row.category}</span>
            </div>
          </div>
          <div class="extra content">
            <div class="right floated author">
              By - ${row.author}
            </div>
          </div>
        </a>
      </c:forEach>
    </div>
  </div>
  <!-- Footer -->
  <%@ include file="footer.jsp" %>
</body>

</html>
