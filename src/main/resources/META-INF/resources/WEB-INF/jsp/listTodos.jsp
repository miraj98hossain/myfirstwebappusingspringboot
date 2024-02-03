<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>ToDo Table</title>
            <style>
                body {
                    font-family: 'Arial', sans-serif;
                    background-color: #f4f4f4;
                    margin: 0;
                    padding: 0;
                }

                .container {
                    width: 80%;
                    margin: 20px auto;
                    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                    background-color: #fff;
                    border-bottom: 1px solid #ddd;
                    /* Add border at the bottom of the container */
                }

                .user-details {
                    background-color: #ddd;
                    padding: 20px;
                    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                    border-bottom: 1px solid #ddd;
                    /* Add border at the bottom of user details */
                }

                table {
                    width: 100%;
                    border-collapse: collapse;
                    margin-top: 20px;
                    border-top: 1px solid #ddd;
                    /* Add border at the top of the table */
                }

                th,
                td {
                    padding: 12px;
                    text-align: left;
                    border-bottom: 1px solid #ddd;
                }

                th {
                    background-color: #4CAF50;
                    color: white;
                }

                tr:hover {
                    background-color: #f5f5f5;
                }

                .edit-btn,
                .add-btn,
                .delete-btn {
                    padding: 8px;
                    margin: 4px;
                    cursor: pointer;
                    border: none;
                    border-radius: 4px;
                    outline: none;
                }

                .edit-btn {
                    background-color: #3498db;
                    color: white;
                }

                .add-btn {
                    background-color: #2ecc71;
                    color: white;
                }

                .delete-btn {
                    background-color: #e74c3c;
                    color: white;
                }

                /* Modal styles */
                .modal {
                    display: none;
                    position: fixed;
                    z-index: 1;
                    left: 0;
                    top: 0;
                    width: 100%;
                    height: 100%;
                    overflow: auto;
                    background-color: rgb(0, 0, 0);
                    background-color: rgba(0, 0, 0, 0.4);
                }

                .modal-content {
                    background-color: #fefefe;
                    margin: 15% auto;
                    padding: 20px;
                    border: 1px solid #888;
                    width: 80%;
                }

                .close {
                    color: #aaa;
                    float: right;
                    font-size: 28px;
                    font-weight: bold;
                }

                .close:hover,
                .close:focus {
                    color: black;
                    text-decoration: none;
                    cursor: pointer;
                }

                .form-group {
                    margin-bottom: 1rem;
                }

                .form-group label {
                    display: block;
                    margin-bottom: 0.5rem;
                }

                .form-group input[type="text"] {
                    width: 100%;
                    padding: 0.5rem;
                    border: 1px solid #ccc;
                    border-radius: 4px;
                    box-sizing: border-box;
                }

                .form-group input[type="submit"] {
                    padding: 0.5rem 1rem;
                    background-color: #2ecc71;
                    color: white;
                    border: none;
                    border-radius: 4px;
                    cursor: pointer;
                }

                .navbar {
                    background-color: #333;
                    overflow: hidden;
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
                <a class="active" href="/listtodos">Todos</a>
                <a href="#">Logout</a>
            </div>
            <div class="container">
                <!-- User Details
            <div class="user-details">
                <h2>User Details</h2>
                <p>Username: ${username}</p>
                <p>Password: ${password}</p>
            </div> -->

                <!-- Todo Table -->
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Username</th>
                            <th>Description</th>
                            <th>Target Date</th>
                            <th>Is Done</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- <tr>
                        <td colspan="6" style="text-align: center;">
                            <button onclick="location.href='/add-todo';">Add new todo</button>
                        </td>
                    </tr> -->
                        <c:forEach var="todo" items="${todos}">
                            <tr>
                                <td>${todo.id}</td>
                                <td>${todo.username}</td>
                                <td>${todo.description}</td>
                                <td>${todo.targetDate}</td>
                                <td>${todo.isdone}</td>
                                <td>
                                    <button onclick="location.href='/edit-todo?id=${todo.id}';"
                                        class="edit-btn">Edit</button>
                                    <button onclick="location.href='/delete-todo?id=${todo.id}';"
                                        class="delete-btn">Delete</button>
                                </td>
                            </tr>
                        </c:forEach>
                        <!-- Add more rows as needed -->
                    </tbody>
                </table>
                <button class="add-btn" onclick="location.href='/addtodo';">Add new todo</button>
            </div>



        </body>

        </html>