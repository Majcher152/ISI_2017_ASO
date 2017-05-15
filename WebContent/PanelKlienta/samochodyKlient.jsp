<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<title>Insert title here</title>
</head>
<body>
<p>Model</p>

<select name="model">
    <c:forEach items="${samochody}" var="samochod">
        <option value="${samochod.model}"><c:out value="${samochod.model}" /></option>
    </c:forEach>
</select>

<p>Rocznik</p>
<select name="rocznik">
</select>

<script type="text/javascript">
        $model = $('#model');

        $(document).on('change', 'model', function() {
                $.ajax({
                    type: "GET",
                    url: "/Samochody2Servlet",
                    data: {model: $model.attr("selectedIndex") },
                    success: function(data){
                        $("#rocznik").html(data)
                    }
                });
            }
        );
    </script>
</body>
</html>