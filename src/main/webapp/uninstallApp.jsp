<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, model.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Uninstall App</title>
    <style>
        body  { font-family: Arial; background: #f0f2f5; }
        h2    { background: #1a252f; color: white; padding: 18px; }
        .box  { width: 430px; margin: 40px auto; background: white;
                padding: 30px; border-radius: 8px;
                box-shadow: 0 2px 8px rgba(0,0,0,0.1); }
        label { font-weight: bold; font-size: 14px; color: #333; }
        input { width: 100%; padding: 10px; margin: 6px 0 14px;
                border: 1px solid #ccc; border-radius: 4px;
                font-size: 14px; box-sizing: border-box; }
        .btn  { width: 100%; padding: 12px; background: #e74c3c;
                color: white; border: none; border-radius: 4px;
                font-size: 15px; cursor: pointer; font-weight: bold; }
        .btn:hover { background: #c0392b; }
        .back { display: block; margin-top: 15px;
                text-align: center; color: #2980b9; text-decoration: none; }
        .msg  { padding: 12px; border-radius: 4px;
                margin-bottom: 15px; font-weight: bold; }
        .success { background: #d4edda; color: #155724; }
        .error   { background: #f8d7da; color: #721c24; }

        /* Remaining apps table */
        .remaining { margin-top: 25px; }
        .remaining h3 { color: #1a252f; border-bottom: 2px solid #e74c3c;
                        padding-bottom: 6px; margin-bottom: 10px; }
        table { width: 100%; border-collapse: collapse; font-size: 13px; }
        th    { background: #1a252f; color: white; padding: 8px; text-align: left; }
        td    { padding: 8px; border-bottom: 1px solid #eee; }
        tr:hover td { background: #fdf2f2; }
        .empty { color: #999; font-style: italic; text-align: center; padding: 10px; }
    </style>
</head>
<body>
    <h2>🗑️ Uninstall Application</h2>
    <div class="box">

        <%  String msg = (String) request.getAttribute("message");
            if (msg != null) { %>
            <div class="msg <%= msg.startsWith("SUCCESS") ? "success" : "error" %>">
                <%= msg %>
            </div>
        <% } %>

        <form action="AppServlet" method="post">
            <input type="hidden" name="action" value="uninstall"/>
            <label>App ID to Uninstall:</label>
            <input type="number" name="appId" placeholder="Enter App ID to remove" required/>
            <button class="btn" type="submit">🗑️ Uninstall App</button>
        </form>

        <%-- Show remaining apps after uninstall --%>
        <%
        	@SuppressWarnings("unchecked")
            List<App> apps = (List<App>) request.getAttribute("apps");
            if (apps != null) {
        %>
        <div class="remaining">
            <h3>📋 Remaining Installed Apps (<%= apps.size() %>)</h3>
            <% if (apps.isEmpty()) { %>
                <p class="empty">No apps installed.</p>
            <% } else { %>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>App Name</th>
                        <th>Version</th>
                        <th>Category</th>
                    </tr>
                    <% for (App a : apps) { %>
                    <tr>
                        <td><%= a.getAppId() %></td>
                        <td><%= a.getAppName() %></td>
                        <td><%= a.getVersion() %></td>
                        <td><%= a.getCategory() %></td>
                    </tr>
                    <% } %>
                </table>
            <% } %>
        </div>
        <% } %>

        <a class="back" href="index.jsp">← Back to Menu</a>
    </div>
</body>
</html>