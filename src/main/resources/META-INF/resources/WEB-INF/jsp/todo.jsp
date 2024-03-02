<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Add Todo</title>
    <link rel="stylesheet" href="webjars/bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="webjars/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css"
</head>
<body>
<div class="container mt-5">
    <h1>Enter Todo Details</h1>
    <form:form method="post" modelAttribute="todo">
        <form:input type="hidden" path="id" />
        <fieldset class="mb-3">
            <form:label path="description">Description</form:label>
            <form:input type="text" path="description" cssClass="form-control" required="required"/>
            <form:errors path="description" cssClass="text-warning"/>
        </fieldset>
        <fieldset class="mb-3">
            <form:label path="targetDate" class="form-label">Target Date</form:label>
            <form:input type="text" path="targetDate" cssClass="form-control" required="required"/>
            <form:errors path="description" cssClass="text-warning"/>
        </fieldset>
        <h5>Done</h5>
        <fieldset class="form-check mb-3">
            <form:radiobutton path="done" cssClass="form-check-input" value="Yes"/>
            <form:label path="done" cssClass="form-check-label">True</form:label>
        </fieldset>
        <fieldset class="form-check mb-3">
            <form:radiobutton path="done" cssClass="form-check-input" value="No"/>
            <form:label path="done" cssClass="form-check-label">False</form:label>
        </fieldset>
        <input type="submit" class="btn btn-success" value="Submit">
    </form:form>
</div>
<script src="webjars/bootstrap/5.3.0/js/bootstrap.min.js" ></script>
<script src="webjars/jquery/3.6.4/jquery.min.js"></script>
<script src="webjars/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript">
    $('#targetDate').datepicker({
        format: 'yyyy-mm-dd',
        startDate: '-3d'
    });
</script>
</body>
</html>