<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        table {
            width: 80%;
            border-collapse: collapse;
            margin: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }

        th, td {
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

        .edit-btn, .delete-btn {
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

        .delete-btn {
            background-color: #e74c3c;
            color: white;
        }
    </style>
</head>
<body>

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
            <c:forEach var="todo" items="${todos}">
            <tr>
                <td>${todo.id}</td>
                <td>${todo.username}</td>
                <td>${todo.description}</td>
                <td>${todo.targetDate}</td>
                <td>${todo.isdone}</td>
                <td>
                    <button class="edit-btn">Edit</button>
                    <button class="delete-btn">Delete</button>
                </td>
            </tr>
            </c:forEach>
            <!-- Add more rows as needed -->
        </tbody>
    </table>

</body>
</html>
