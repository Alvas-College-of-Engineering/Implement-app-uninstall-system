<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>App Uninstall System</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: Arial, sans-serif; background: #f0f2f5; text-align: center; }
        h1 { background: #1a252f; color: white; padding: 25px; font-size: 24px; }
        .subtitle { color: #666; margin: 15px 0 30px; font-size: 15px; }
        .menu { display: inline-block; margin-top: 20px; }
        .btn {
            display: block; width: 320px; padding: 16px;
            margin: 12px auto; color: white; text-decoration: none;
            border-radius: 6px; font-size: 16px; font-weight: bold;
        }
        .btn1 { background: #27ae60; }  .btn1:hover { background: #1e8449; }
        .btn2 { background: #e74c3c; }  .btn2:hover { background: #c0392b; }
        .btn3 { background: #2980b9; }  .btn3:hover { background: #1a5276; }
    </style>
</head>
<body>
    <h1>📱 App Uninstall System</h1>
    <p class="subtitle">Manage your installed applications</p>
    <div class="menu">
        <a class="btn btn1" href="installApp.jsp">📥 Install Application</a>
        <a class="btn btn2" href="uninstallApp.jsp">🗑️ Uninstall Application</a>
        <a class="btn btn3" href="AppServlet?action=display">📋 View Installed Apps</a>
    </div>
</body>
</html>