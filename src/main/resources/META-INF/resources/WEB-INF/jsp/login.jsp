<%@ include file="common/header.jspf" %>
<body>
    <div class="container mt-5">
        <h1>Login</h1>
        <pre>${error}</pre>
        <form method="post">
            Name: <input type="text" name="username" id="username">
            Password: <input type="password" name="password" id="password">
            <input type="submit" value="Submit">
        </form>
    </div>
<%@ include file="common/footer.jspf" %>