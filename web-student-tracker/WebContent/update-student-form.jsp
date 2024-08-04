<!DOCTYPE html>
<html>

<head>
    <title>Update Student</title>

    <style>
    body {
    background-color: #121212;
    color: #ffffff;
    font-family: Arial, sans-serif;
}

#wrapper {
    padding: 20px;
    background-color: #1e1e1e;
    border-bottom: 2px solid #333;
}

#header h2 {
    margin: 0;
    color: #ffffff;
}

#container {
    padding: 20px;
    background-color: #1e1e1e;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
}

#container h3 {
    color: #ffffff;
}

form {
    margin-top: 20px;
}

table {
    width: 100%;
    border-collapse: collapse;
}

td {
    padding: 10px;
    vertical-align: middle;
}

label {
    color: #cccccc;
}

input[type="text"] {
    width: 100%;
    padding: 8px;
    background-color: #333;
    border: 1px solid #555;
    color: #ffffff;
    border-radius: 4px;
}

input[type="submit"] {
    padding: 10px 20px;
    background-color: #4CAF50;
    border: none;
    color: #ffffff;
    cursor: pointer;
    border-radius: 4px;
}

input[type="submit"]:hover {
    background-color: #45a049;
}

a {
    color: #1E90FF;
}

a:hover {
    color: #1C86EE;
}

.clear {
    clear: both;
}
    
    </style>
</head>

<body>
    <div id="wrapper">
        <div id="header">
            <h2>FooBar University</h2>
        </div>
    </div>

    <div id="container">
        <h3>Update Student</h3>

        <form action="StudentControllerServlet" method="GET">

            <input type="hidden" name="command" value="UPDATE" />

            <input type="hidden" name="studentId" value="${THE_STUDENT.id}" />

            <table>
                <tbody>
                    <tr>
                        <td><label>First name:</label></td>
                        <td><input type="text" name="first_name" value="${THE_STUDENT.firstName}" /></td>
                    </tr>

                    <tr>
                        <td><label>Last name:</label></td>
                        <td><input type="text" name="last_name" value="${THE_STUDENT.lastName}" /></td>
                    </tr>

                    <tr>
                        <td><label>Email:</label></td>
                        <td><input type="text" name="email" value="${THE_STUDENT.email}" /></td>
                    </tr>

                    <tr>
                        <td><label></label></td>
                        <td><input type="submit" value="Save" class="save" /></td>
                    </tr>

                </tbody>
            </table>
        </form>

        <div class="clear"></div>

        <p>
            <a href="StudentControllerServlet">Back to List</a>
        </p>
    </div>
</body>

</html>
