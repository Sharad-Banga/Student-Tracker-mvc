<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Tracker App</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: #121212;
            color: #e0e0e0;
            margin: 0;
            padding: 20px;
        }
        h2 {
            color: #ffffff;
            text-align: center;
            margin-bottom: 20px;
        }
        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            background-color: #1e1e1e;
            border-radius: 8px;
            overflow: hidden;
        }
        th, td {
            padding: 12px 15px;
            text-align: left;
        }
        th {
            background-color: #333;
            color: #4CAF50;
            text-transform: uppercase;
        }
        tr {
            border-bottom: 1px solid #444;
        }
        tr:nth-child(even) {
            background-color: #292929;
        }
        tr:hover {
            background-color: #333;
        }
        td {
            border-right: 1px solid #444;
        }
        td:last-child {
            border-right: none;
        }
        .no-data {
            text-align: center;
            font-style: italic;
            color: #888;
            padding: 20px;
        }
        .error {
            color: #ff4d4d;
            font-weight: bold;
            text-align: center;
        }
        input[type="button"] {
            display: block;
            margin: 0 auto 20px auto;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        input[type="button"]:hover {
            background-color: #45a049;
        }
        a{
        	color: #ffffff;
        	
        }
    </style>
    <!-- Google Fonts Link -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
</head>

<body>
    <h2>Student Tracker</h2>
    
    <input type="button" value="Add Student" onclick="window.location.href='add-student-form.jsp';"/>
     
    <table>
        <tr>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>UPDATE</th>
        </tr>
        <c:choose>
            <c:when test="${not empty STUDENT_LIST}">
                <c:forEach var="tempStudent" items="${STUDENT_LIST}">
                
                	<!-- set up link for each student -->
                	
                	<c:url var="tempLink" value="StudentControllerServlet" >
                	
                			<c:param name="command" value="LOAD" />
                			<c:param name="studentId" value="${tempStudent.id }" />
                			
                	</c:url>
                	
                	<c:url var="deleteLink" value="StudentControllerServlet" >
                	
                			<c:param name="command" value="DELETE" />
                			<c:param name="studentId" value="${tempStudent.id }" />
                			
                	</c:url>
                	
                    <tr>
                        <td>${tempStudent.firstName}</td>
                        <td>${tempStudent.lastName}</td>
                        <td>${tempStudent.email}</td>
                        <td>
                         <a href="${tempLink }">Update</a> 
                         |
                         <a href="${deleteLink }"
                         onclick="if(!(confirm('Are you sure you want to delete this student'))) return false"
                         
                         >Delete</a> 
                         
                         
                         </td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="4" class="no-data">No students available</td>
                    
                </tr>
            </c:otherwise>
        </c:choose>
    </table>
</body>
</html>
