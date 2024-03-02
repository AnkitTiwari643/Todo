<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Add Todo</title>
    <link rel="stylesheet" href="webjars/bootstrap/5.3.0/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h1>Enter Todo Details</h1>
    <form:form method="post" modelAttribute="todo">
        <form:input type="hidden" path="id" />
        <div class="mb-3">
            <label for="description" class="form-label">Description</label>
            <form:input type="text" path="description" id="description" cssClass="form-control" />
            <form:errors path="description" cssClass="text-warning"/>
        </div>
        <div class="mb-3">
            <label for="targetDate" class="form-label">Target Date</label>
            <form:input type="date" path="targetDate" id="targetDate" cssClass="form-control"/>
        </div>
        <h5>Done</h5>
        <div class="form-check mb-3">
            <form:radiobutton path="done" cssClass="form-check-input" value="Yes"/>
            <form:label path="done" cssClass="form-check-label">True</form:label>
        </div>
        <div class="form-check mb-3">
            <form:radiobutton path="done" cssClass="form-check-input" value="No"/>
            <form:label path="done" cssClass="form-check-label">False</form:label>
        </div>
        <input type="submit" class="btn btn-success" value="Submit">
    </form:form>
</div>
<script src="webjars/bootstrap/5.3.0/js/bootstrap.min.js" ></script>
<script src="webjars/jquery/3.6.4/jquery.min.js"></script>
</body>
</html>