<%@ page import="javax.servlet.http.*, java.io.*" %>
<%

    int visitCount = 1;
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie c : cookies) {
            if (c.getName().equals("visitCount")) {
                visitCount = Integer.parseInt(c.getValue()) + 1;
            }
        }
    }
    Cookie visitCookie = new Cookie("visitCount", String.valueOf(visitCount));
    visitCookie.setMaxAge(60 * 60 * 24 * 365);
    response.addCookie(visitCookie);


    String savedUsername = null;
    String savedPassword = null;
    String savedRole = null;

    if (cookies != null) {
        for (Cookie c : cookies) {
            if (c.getName().equals("registeredUser")) savedUsername = c.getValue();
            if (c.getName().equals("registeredPass")) savedPassword = c.getValue();
            if (c.getName().equals("registeredRole")) savedRole = c.getValue();
        }
    }

    
    String enteredUsername = request.getParameter("login-username");
    String enteredPassword = request.getParameter("login-password");
    String enteredRole = request.getParameter("login-role");

    if (enteredUsername != null && enteredPassword != null && enteredRole != null) {
        if (enteredUsername.equals(savedUsername) && 
            enteredPassword.equals(savedPassword) && 
            enteredRole.equals(savedRole)) {

            Cookie loginCookie = new Cookie("loggedInUser", enteredUsername);
            loginCookie.setMaxAge(60 * 60 * 24);
            response.addCookie(loginCookie);

            response.sendRedirect("homepage.jsp");
            return;
        } else {
            out.println("<script>alert('Invalid credentials or role. Please try again.');</script>");
        }
    }

    
    String regUsername = request.getParameter("register-username");
    String regPassword = request.getParameter("register-password");
    String regRole = request.getParameter("register-role");

    if (regUsername != null && regPassword != null && regRole != null) {
        Cookie userC = new Cookie("registeredUser", regUsername);
        Cookie passC = new Cookie("registeredPass", regPassword);
        Cookie roleC = new Cookie("registeredRole", regRole);

        userC.setMaxAge(60 * 60 * 24 * 365);
        passC.setMaxAge(60 * 60 * 24 * 365);
        roleC.setMaxAge(60 * 60 * 24 * 365);

        response.addCookie(userC);
        response.addCookie(passC);
        response.addCookie(roleC);

        out.println("<script>alert('Registration successful! You can now log in.');</script>");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login & Registration - Hostel Management System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body {
            background: url(login.png) no-repeat center center/cover;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: Arial, sans-serif;
        }

        .container {
            width: 400px;
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(10px);
            padding: 40px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.3);
        }

        .container h2 {
            color: white;
            margin-bottom: 20px;
        }

        .input-group {
            margin-bottom: 15px;
            position: relative;
        }

        .input-group input, .input-group select {
            width: 100%;
            padding: 10px;
            padding-left: 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
        }

        .input-group i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: gray;
        }

        .btn {
            background: #007bff;
            color: white;
            padding: 10px;
            border: none;
            width: 100%;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn:hover {
            background: #0056b3;
        }

        .toggle-link {
            margin-top: 15px;
            color: white;
            text-decoration: none;
            font-size: 14px;
            cursor: pointer;
        }

        .toggle-link:hover {
            text-decoration: underline;
        }

        .visit-count {
            position: absolute;
            top: 15px;
            left: 20px;
            color: white;
            font-weight: bold;
            font-size: 16px;
        }

        @media (max-width: 400px) {
            .container {
                width: 90%;
            }
        }
    </style>
</head>
<body>

<div class="visit-count">Visits: <%= visitCount %></div>

<div class="container" id="login-container">
    <h2>Eshaara  Girl's Hostel</h2>
    <form method="post">
        <div class="input-group">
            <i class="fas fa-user"></i>
            <input type="text" name="login-username" placeholder="Enter Username" required>
        </div>

        <div class="input-group">
            <i class="fas fa-lock"></i>
            <input type="password" name="login-password" placeholder="Enter Password" required>
        </div>

        <div class="input-group">
            <i class="fas fa-user-tag"></i>
            <select name="login-role">
                <option value="admin">Admin</option>
                <option value="warden">Warden</option>
                <option value="student">Student</option>
            </select>
        </div>

        <button class="btn" type="submit">Login</button>
    </form>
    <p class="toggle-link" onclick="toggleForms()">Don't have an account? Sign up</p>
</div>

<div class="container" id="register-container" style="display: none;">
    <h2>Hostel Management Registration</h2>
    <form method="post">
        <div class="input-group">
            <i class="fas fa-user"></i>
            <input type="text" name="register-name" placeholder="Full Name" required>
        </div>

        <div class="input-group">
            <i class="fas fa-envelope"></i>
            <input type="email" name="register-email" placeholder="Email" required>
        </div>

        <div class="input-group">
            <i class="fas fa-user"></i>
            <input type="text" name="register-username" placeholder="Username" required>
        </div>

        <div class="input-group">
            <i class="fas fa-lock"></i>
            <input type="password" name="register-password" placeholder="Password" required>
        </div>

        <div class="input-group">
            <i class="fas fa-user-tag"></i>
            <select name="register-role">
                <option value="admin">Admin</option>
                <option value="warden">Warden</option>
                <option value="student">Student</option>
            </select>
        </div>

        <button class="btn" type="submit">Register</button>
    </form>
    <p class="toggle-link" onclick="toggleForms()">Already have an account? Login here</p>
</div>

<script>
    function toggleForms() {
        const loginContainer = document.getElementById("login-container");
        const registerContainer = document.getElementById("register-container");

        if (loginContainer.style.display === "none") {
            loginContainer.style.display = "block";
            registerContainer.style.display = "none";
        } else {
            loginContainer.style.display = "none";
            registerContainer.style.display = "block";
        }
    }
</script>

</body>
</html>
