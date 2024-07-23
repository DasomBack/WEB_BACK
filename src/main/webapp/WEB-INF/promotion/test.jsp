<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Promotions</title>
</head>
<body>
    <div id="testform">
        <form action="/api/promotion-discount/test" method="post">
            <input name="ant" plceholder=1>
            <input name="bent" placeholder="안녕?">
            <button type="submit">제출</button>
        </form>
    </div>
</body>
</html>