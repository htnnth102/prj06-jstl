<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Edit Form</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>

<sql:setDataSource var = "studentdb" driver = "com.mysql.cj.jdbc.Driver"
                   url = "jdbc:mysql://localhost:3306/studentdb"
                   user = "root"  password = "motconvit"/>

<c:set var="vClassName" value="${param.searchKey}"/>

<sql:query dataSource = "${studentdb}" var = "data">
    select * from myclass;
</sql:query>
<jsp:include page="WEB-INF/header.jsp"/>
<h1 class="text-center mt-5 mb-5">EDIT STUDENT</h1>
<form class="container w-50 mt-5">
    <div class="form-group">
        <label for="id">Student ID</label>
        <input type="number" class="form-control" id="id" placeholder="Fill in student Id">
    </div>
    <div class="form-group">
        <label for="class">Class</label>
        <select class="form-control" name="class" id="class">
            <c:forEach var="opt" items="${data.rows}">
                <option value="${opt.id}"><c:out value="${opt.class_name}"/></option>
            </c:forEach>
        </select>
    </div>
    <div class="form-group">
        <label for="address">Address</label>
        <textarea class="form-control" id="address" rows="3"></textarea>
    </div>
    <div class="form-group">
        <label for="phone">Phone</label>
        <input type="text" class="form-control" id="phone" rows="3"></input>
    </div>
    <div class="form-group">
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="gender" checked value="male">
            <label class="form-check-label">Male</label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="gender" value="female">
            <label class="form-check-label">Female</label>
        </div>
    </div>
    <button type="submit" class="btn btn-outline-primary text-center align-center">SAVE</button>
</form>
<jsp:include page="WEB-INF/footer.jsp"/>
</body>
</html>
