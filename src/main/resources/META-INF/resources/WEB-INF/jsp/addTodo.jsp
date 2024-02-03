<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Add New Todo</title>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.6.6/flatpickr.min.css">
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

                input[type="text"],
                input[type="date"] {
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

                .custom-checkbox {
                    display: inline-block;
                    vertical-align: middle;
                }

                .custom-checkbox input[type="checkbox"] {
                    opacity: 0;
                    position: absolute;
                    cursor: pointer;
                }

                .custom-checkbox label {
                    position: relative;
                    cursor: pointer;
                    padding-left: 25px;
                    /* Adjust spacing between checkbox and label */
                }

                .custom-checkbox label::before {
                    content: "";
                    position: absolute;
                    left: 0;
                    top: 50%;
                    transform: translateY(-50%);
                    width: 20px;
                    height: 20px;
                    border: 1px solid #ccc;
                    background-color: #fff;
                }

                .custom-checkbox input[type="checkbox"]:checked+label::before {
                    background-color: #4CAF50;
                    /* Change background color when checkbox is checked */
                    border-color: #4CAF50;
                    /* Change border color when checkbox is checked */
                }

                .custom-checkbox label::after {
                    content: "\2713";
                    /* Unicode checkmark symbol */
                    position: absolute;
                    left: 5px;
                    top: 50%;
                    transform: translateY(-50%);
                    color: #fff;
                    /* Change color of checkmark */
                    font-size: 16px;
                    display: none;
                }

                .custom-checkbox input[type="checkbox"]:checked+label::after {
                    display: block;
                    /* Show checkmark when checkbox is checked */
                }
            </style>
        </head>

        <body>
            <div class="navbar">
                <a href="#">Home</a>
                <a href="/listtodos">Todos</a>
                <a class="active" href="#">Add New Todo</a>
                <a href="/logout">Logout</a>
            </div>
            <div class="container">
                <h2>Add New Todo</h2>
                <form:form method="post" modelAttribute="todo">
                    <div>
                        <label for="description">Description:</label>
                        <form:input type="text" path="description" id="description" value="${todo.description}"
                            required="required" />
                        <form:errors path="description" />
                        <form:input type="hidden" path="id" id="id" value="${todo.id}" required="required" />
                        <!-- <form:input type="hidden" path="isdone" id="isdone" required="required" /> -->
                    </div>
                    <div>
                        <label for="targetDate">Target Date:</label>
                        <form:input type="date" path="targetDate" id="targetDate" required="required"
                            value="${todo.targetDate}" />
                    </div>
                    <div>
                        <label for="isdone">Is Done:</label>
                        <form:checkbox id="isdone" path="isdone" checked="${todo.isdone}" class="custom-checkbox" />
                    </div>

                    <div>
                        <button type="submit">Submit</button>
                    </div>
                </form:form>
            </div>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.6.6/flatpickr.min.js"></script>
            <script>
                flatpickr('#targetDate');
            </script>
        </body>

        </html>