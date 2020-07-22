<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form action="todo-demo.jsp">
Add new item <input type="text" name="theItem" />

<input type="submit" value="submit" />


<!-- add new items to todo list -->

<%
//get the to do items from the session

List<String> items = (List<String>) session.getAttribute("myTodoList");

//if the todo item doesnt exist create a new one

if(items == null){
	items = new ArrayList<String>();
	session.setAttribute("myTodoList", items);
	
}

//see if there if form data to add

String theItem = request.getParameter("theItem");
if (theItem != null){
	items.add(theItem);
}

%>


<!-- displaying data from session -->

<hr>
<b>to do list Items</b> <br/>

<ol>

<%
for (String temp : items){
	out.println("<li>" + temp + "</li>");
}

%>

</ol>
</form>
</body>
</html>