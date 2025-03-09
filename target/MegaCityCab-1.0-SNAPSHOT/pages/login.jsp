<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Mega City Cab</title>
    <link rel="stylesheet" href="../styles.css">

<!-- Load jQuery before Validation Plugin -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>

    <script>
        $(document).ready(function () {
            $("#loginForm").validate({
                rules: {
                    username: {
                        required: true,
                        minlength: 3
                    },
                    password: {
                        required: true,
                        minlength: 6
                    }
                },
                messages: {
                    username: {
                        required: "Please enter your username",
                        minlength: "Username must be at least 3 characters long"
                    },
                    password: {
                        required: "Please enter your password",
                        minlength: "Password must be at least 6 characters long"
                    }
                },
                errorElement: "div",
                errorPlacement: function (error, element) {
                    error.addClass("error-message"); // Add styling to the error message
                    element.closest(".input-group").append(error); // Place error inside input-group
                },
                highlight: function (element) {
                    $(element).addClass("input-error");
                },
                unhighlight: function (element) {
                    $(element).removeClass("input-error");
                },
                submitHandler: function (form) {
                    form.submit();
                }
            });
        });
    </script>

    <style>
        .error-message {
            color: red;
            font-size: 14px;
            margin-top: 5px;
        }
        .input-error {
            border: 2px solid red;
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>
<!--action="loginServlet"-->
    <div class="container">
        <h1>Login</h1>
        <form id="loginForm"  method="post">
            <div class="input-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username">
            </div>
            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password">
            </div>
            <button type="submit">Login</button>
        </form>
        <p>Don't have an account? <a href="/MegaCityCab/pages/signup.jsp">Sign up here</a></p>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
