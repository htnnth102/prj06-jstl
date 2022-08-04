<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>Home</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha384-zIaWifL2YFF1qaDiAo0JFgsmasocJ/rqu7LKYH8CoBEXqGbb9eO+Xi3s6fQhgFWM" crossorigin="anonymous">
</head>
<body>
<jsp:include page="WEB-INF/header.jsp"/>

<sql:setDataSource var = "studentdb" driver = "com.mysql.cj.jdbc.Driver"
                   url = "jdbc:mysql://localhost:3306/studentdb"
                   user = "root"  password = "motconvit"/>

<c:set var="vClassName" value="${param.searchKey}"/>

<sql:query dataSource = "${studentdb}" var = "data">
    select s.id, fullname, class_name, address, phone, gender from students s inner join myclass c on s.class_id = c.class_id order by s.id;
</sql:query>

<sql:query dataSource = "${studentdb}" var = "searchRs">
    select s.id, fullname, class_name, address, phone, gender from students s inner join myclass c on s.class_id = c.class_id where fullname = ?;
    <sql:param value="${vClassName}"/>
</sql:query>

<sql:query dataSource = "${studentdb}" var = "classData">
    select * from myclass;
</sql:query>
<h1 class="text-center mt-5 mb-5">
    STUDENT MANAGEMENT
</h1>
<div class="container-fluid w-50 mt-3 mb-3">
    <form action="index.jsp" method="post" class="d-flex input-group w-auto">
        <input
                type="search"
                class="form-control rounded"
                placeholder="Search"
                aria-label="Search"
                aria-describedby="search-addon"
                name="searchKey"
        />
        <button type="submit" class="input-group-text border-0" id="search-addon">
        <i class="fas fa-search"></i>
      </button>
    </form>
</div>

<table class="table container">
    <thead>
    <tr>
        <th scope="col">ID</th>
        <th scope="col">Name</th>
        <th scope="col">Class</th>
        <th scope="col">Address</th>
        <th scope="col">Phone</th>
        <th scope="col">Gender</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:if test="${vClassName == ''}">
        <c:forEach var = "s" items = "${data.rows}">
            <tr>
                <td> <c:out value = "${s.id}"/></td>
                <td> <c:out value = "${s.fullname}"/></td>
                <td> <c:out value = "${s.class_name}"/></td>
                <td> <c:out value = "${s.address}"/></td>
                <td> <c:out value = "${s.phone}"/></td>
                <td>
                    <c:if test="${s.gender == true}">
                        <c:out value = "Female"/>
                    </c:if>
                    <c:if test="${s.gender == false}">
                        <c:out value = "Male"/>
                    </c:if>
                </td>
                <td><a href="<%=request.getContextPath()%>/edit.jsp?id=${s.id}" class="btn btn-outline-primary">EDIT</a></td>
            </tr>
        </c:forEach>
    </c:if>
    <c:if test="${param.searchKey != ''}">
        <c:forEach var = "s" items = "${searchRs.rows}">
            <tr>
                <td> <c:out value = "${s.id}"/></td>
                <td> <c:out value = "${s.fullname}"/></td>
                <td> <c:out value = "${s.class_name}"/></td>
                <td> <c:out value = "${s.address}"/></td>
                <td> <c:out value = "${s.phone}"/></td>
                <td>
                    <c:if test="${s.gender == true}">
                        <c:out value = "Female"/>
                    </c:if>
                    <c:if test="${s.gender == false}">
                        <c:out value = "Male"/>
                    </c:if>
                </td>
                <td><a href="#" class="btn btn-outline-primary">EDIT</a></td>
            </tr>
        </c:forEach>
    </c:if>

    </tbody>
</table>
<jsp:include page="WEB-INF/footer.jsp"/>
</body>
</html>