<%@ include file="sqlconn.jsp" %>
<style>
  .ui.menu .item img.logo {
    margin-right: 1.5em;

  }

  body.mainbody {
    margin-top: 7em;
  }
  
  i.empty.heart.icon:hover {
    color: #000;
    cursor: pointer;
  }

  .ui.main.container {
    min-height: 90vh;
  }
</style>

<sql:query var="categories" dataSource="${db}">
  SELECT category
  FROM category
</sql:query>

<div class="ui fixed inverted menu">
  <div class="ui container">
    <a href="#" class="header item">
      <img class="logo" src="assets/images/logo.png">
      Archive
    </a>
    <a href="index.jsp" class="item">Home</a>
    <a href="bestsellers.jsp" class="item">Best Sellers</a>
    <div class="ui simple dropdown item">
      Categories <i class="dropdown icon"></i>
      <div class="menu">
      <c:forEach var="row" items="${categories.rows}">
        <a class="item" href="search.jsp?s=${row.category}">${row.category}</a>
      </c:forEach>
      </div>
    </div>
    <span style="width: 65%;"></span>
    <form action="search.jsp" method="post" style="margin-top: 0.8em;">
      <div class="ui inverted transparent icon input">
        <input type="text" name="s" placeholder="Search...">
        <input type="submit" value=""><i class="search icon"></i>
      </div>
    </form>
    <span style="width: 1%;"></span>
    <%
    if( session.getAttribute("UserID") != null) {
    %>
      <a href="./mybooks.jsp" class="item">My Books</a>
      <a href="./logout.jsp" class="item">Logout</a>
    <%
    } else {
    %>
      <a href="./login.jsp" class="item">Login</a>
    <%
    }
    %>
  </div>
</div>