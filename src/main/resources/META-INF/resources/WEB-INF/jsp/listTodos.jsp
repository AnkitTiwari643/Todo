<%@ include file="common/header.jspf" %>
<body>
    <%@ include file="common/navigation.jspf" %>
    <div class="container mt-5">
        <h2>Your Todos</h2>
        <table class="table">
            <thead>
                <th>Description</th>
                <th>Target Date</th>
                <th>Is Done?</th>
                <th></th>
                <th></th>
            </thead>
            <tbody>
                <c:forEach items="${todos}" var="todo">
                    <tr>
                        <td>${todo.description}</td>
                        <td>${todo.targetDate}</td>
                        <td>${todo.done}</td>
                        <td><a href="delete-todo?id=${todo.id}" class="btn btn-warning">DELETE</a></td>
                        <td><a href="update-todo?id=${todo.id}" class="btn btn-danger">UPDATE</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="add-todo" class="btn btn-success">Add Todo</a>
    </div>
<%@ include file="common/footer.jspf" %>