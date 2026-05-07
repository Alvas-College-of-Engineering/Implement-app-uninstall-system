<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Install App</title>
    <style>
        body  { font-family: Arial; background: #f0f2f5; }
        h2    { background: #1a252f; color: white; padding: 18px; }
        .box  { width: 430px; margin: 40px auto; background: white;
                padding: 30px; border-radius: 8px;
                box-shadow: 0 2px 8px rgba(0,0,0,0.1); }
        label { font-weight: bold; font-size: 14px; color: #333; }
        input, select {
            width: 100%; padding: 10px; margin: 6px 0 14px;
            border: 1px solid #ccc; border-radius: 4px;
            font-size: 14px; box-sizing: border-box;
        }
        .btn  { width: 100%; padding: 12px; background: #27ae60;
                color: white; border: none; border-radius: 4px;
                font-size: 15px; cursor: pointer; font-weight: bold; }
        .btn:hover { background: #1e8449; }
        .back { display: block; margin-top: 15px;
                text-align: center; color: #2980b9; text-decoration: none; }
        .msg  { padding: 12px; border-radius: 4px;
                margin-bottom: 15px; font-weight: bold; }
        .success { background: #d4edda; color: #155724; }
        .error   { background: #f8d7da; color: #721c24; }
    </style>
</head>
<body>
    <h2>📥 Install Application</h2>
    <div class="box">

        <%  String msg = (String) request.getAttribute("message");
            if (msg != null) { %>
            <div class="msg <%= msg.startsWith("SUCCESS") ? "success" : "error" %>">
                <%= msg %>
            </div>
        <% } %>

        <form action="AppServlet" method="post">
            <input type="hidden" name="action" value="install"/>

            <label>App ID:</label>
            <input type="number" name="appId" placeholder="Enter App ID" required/>

            <label>App Name:</label>
            <input type="text" name="appName" placeholder="Enter App Name" required/>

            <label>Version:</label>
            <input type="text" name="version" placeholder="e.g. 1.0.0" required/>

            <label>Category:</label>
            <select name="category">
                <option value="Social Media">Social Media</option>
                <option value="Games">Games</option>
                <option value="Productivity">Productivity</option>
                <option value="Education">Education</option>
                <option value="Entertainment">Entertainment</option>
                <option value="Utilities">Utilities</option>
            </select>

            <button class="btn" type="submit">📥 Install App</button>
        </form>
        <a class="back" href="index.jsp">← Back to Menu</a>
    </div>
</body>
</html>