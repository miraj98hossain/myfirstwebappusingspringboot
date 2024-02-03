<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Add New Todo</title>
            <style>
                body {
                    font-family: Arial, sans-serif;
                    background-color: #f4f4f4;
                    margin: 0;
                    padding: 0;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    height: 100vh;
                }

                .container {
                    background-color: #fff;
                    padding: 20px;
                    border-radius: 8px;
                    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                }

                h2 {
                    text-align: center;
                    margin-bottom: 20px;
                }

                form {
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                }

                label {
                    margin-bottom: 8px;
                }

                input[type="text"] {
                    width: 100%;
                    padding: 10px;
                    margin-bottom: 20px;
                    border: 1px solid #ddd;
                    border-radius: 4px;
                    box-sizing: border-box;
                }

                button[type="submit"] {
                    padding: 10px 20px;
                    background-color: #4CAF50;
                    color: white;
                    border: none;
                    border-radius: 4px;
                    cursor: pointer;
                    transition: background-color 0.3s;
                }

                button[type="submit"]:hover {
                    background-color: #45a049;
                }

                /* Navigation bar styles */
                .navbar {
                    background-color: #333;
                    overflow: hidden;
                    width: 100%;
                    position: fixed;
                    top: 0;
                    z-index: 1000;
                }

                .navbar a {
                    float: left;
                    display: block;
                    color: white;
                    text-align: center;
                    padding: 14px 20px;
                    text-decoration: none;
                }

                .navbar a:hover {
                    background-color: #ddd;
                    color: black;
                }

                .navbar a.active {
                    background-color: #4CAF50;
                    color: white;
                }
            </style>
        </head>

        <body>
            <div class="navbar">
                <a href="#">Home</a>
                <a href="/listtodos">Todos</a>
                <a class="active" href="#">Add New Todo</a>
                <a href="#">Logout</a>
            </div>
            <div class="container">
                <h2>Add New Todo</h2>
                <form:form method="post" modelAttribute="todo">
                    <div>
                        <label for="description">Description:</label>
                        <form:input type="text" path="description" id="description" required="required" />
                        <form:errors path="description" />
                        <form:input type="hidden" path="id" id="id" required="required" />
                        <form:input type="hidden" path="isdone" id="isdone" required="required" />
                    </div>
                    <div>
                        <button type="submit">Submit</button>
                    </div>
                </form:form>
            </div>
        </body>

        </html>