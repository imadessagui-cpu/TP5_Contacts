<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><title>Test JSTL</title></head>
<body>
    <c:set var="test" value="JSTL fonctionne !" />
    <c:out value="${test}" />
</body>
</html>