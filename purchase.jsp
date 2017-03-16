Fayteway, the fake payment gateway...<br />
Processing...<br />

<form method="post" action="purchase.jsp">
	<input type="hidden" name="book_id" value='<%= request.getParameter("id") %>' />
	<input type="hidden" name="user_id" value='<%= session.getAttribute("UserID") %>' />
	<br />
	<br />
	<input type="submit" name="submit" value="Cofirm Payment">
</form>

<%@ page import="com.onlib.User" %>
<%
String book_id = request.getParameter("book_id");
String user_id = request.getParameter("user_id");
if( book_id != null && user_id != null ) {
	if( new User().purchase( book_id, user_id ) ) {
		%>
		<jsp:forward page="mybooks.jsp" />
		<%
	}
}
%>