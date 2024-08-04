<!DOCTYPE html>
<html>

<head>
    <title>Add Student</title>

    <style>
    body {
    font-family: Arial, sans-serif;
    background-color: #121212;
    color: #e0e0e0;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

#wrapper {
    width: 100%;
    max-width: 600px;
    margin: auto;
}

#header {
    background-color: #1f1f1f;
    color: #4CAF50;
    text-align: center;
    padding: 10px 0;
    border-radius: 5px 5px 0 0;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);
}

#container {
    background-color: #1e1e1e;
    padding: 20px;
    border: 1px solid #333;
    border-radius: 0 0 5px 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);
}

h3 {
    color: #4CAF50;
    text-align: center;
}

form {
    width: 100%;
    margin: 0 auto;
}

table {
    width: 100%;
    margin-top: 10px;
    border-collapse: collapse;
}

td {
    padding: 10px;
    vertical-align: middle;
}

label {
    font-weight: bold;
}

input[type="text"], input[type="submit"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #444;
    border-radius: 5px;
    background-color: #2e2e2e;
    color: #e0e0e0;
    box-sizing: border-box;
}

input[type="submit"] {
    background-color: #4CAF50;
    color: #e0e0e0;
    border: none;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
    background-color: #45a049;
}

a {
    display: inline-block;
    margin-top: 20px;
    color: #4CAF50;
    text-decoration: none;
}

a:hover {
    text-decoration: underline;
}

.clear {
    clear: both;
}
    /* Additional styles for the add student form in dark mode */

input[type="text"]::placeholder {
    color: #777;
}

input[type="text"]:focus {
    border-color: #4CAF50;
    outline: none;
    background-color: #2e2e2e;
}

form h3 {
    margin-bottom: 20px;
}
    
    
    </style>
</head>

<body>
    <div id="wrapper">
        <div id="header">
            <h2>Mindset University</h2>
        </div>
    </div>

    <div id="container">
        <h3>Add Student</h3>

        <form action="StudentControllerServlet" method="GET">
            <input type="hidden" name="command" value="ADD" />

            <table>
                <tbody>
                    <tr>
                        <td><label>First name:</label></td>
                        <td><input type="text" name="first_name" placeholder="Enter first name" /></td>
                    </tr>

                    <tr>
                        <td><label>Last name:</label></td>
                        <td><input type="text" name="last_name" placeholder="Enter last name" /></td>
                    </tr>

                    <tr>
                        <td><label>Email:</label></td>
                        <td><input type="text" name="email" placeholder="Enter email" /></td>
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
