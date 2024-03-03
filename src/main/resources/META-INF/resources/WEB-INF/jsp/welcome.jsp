<%@ include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>
<body>
    <div class="container mt-5">
        <h1>Welcome ${name}</h1>
        <hr>
        <h4>Your username: ${name}</h4>
        <div><a href="list-todos">Manage</a> your todos</div>
    </div>
<%@ include file="common/footer.jspf" %>


