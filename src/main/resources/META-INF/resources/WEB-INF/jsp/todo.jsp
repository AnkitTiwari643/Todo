<%@ include file="common/header.jspf" %>
<div>
    <%@ include file="common/navigation.jspf" %>
    <div class="container">
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
</div>
<%@ include file="common/footer.jspf" %>
<script src="webjars/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript">
    $('#targetDate').datepicker({
        format: 'yyyy-mm-dd',
        startDate: '-3d'
    });
</script>