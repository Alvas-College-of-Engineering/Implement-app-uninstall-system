<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, model.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Installed Apps</title>
    <style>
        body  { font-family: Arial; background: #f0f2f5; }
        h2    { background: #1a252f; color: white; padding: 18px; }
        .container { width: 700px; margin: 30px auto; }
        .count { background: #2980b9; color: white; padding: 10px 16px;
                 border-radius: 4px; display: inline-block;
                 margin-bottom: 15px; font-weight: bold; }
        table { width: 100%; border-collapse: collapse; background: white;
                border-radius: 8px; overflow: hidden;
                box-shadow: 0 2px 8px rgba(0,0,0,0.1); }
        th    { background: #1a252f; color: white; padding: 12px; text-align: left; }
        td    { padding: 12px; border-bottom: 1px solid #eee; }
        tr:hover td { background: #eaf4fb; }
        .empty { text-align: center; color: #999;
                 font-style: italic; padding: 20px; }
        .back { display: block; margin: 20px auto;
                text-align: center; color: #2980b9; text-decoration: none; }
        .badge {
            padding: 3px 8px; border-radius: 10px;
            font-size: 12px; font-weight: bold;
        }
        .Games        { background: #fadbd8; color: #e74c3c; }
        .Social       { background: #d5f5e3; color: #27ae60; }
        .Productivity { background: #d6eaf8; color: #2980b9; }
        .Education    { background: #fdebd0; color: #e67e22; }
        .Entertainment{ background: #e8daef; color: #8e44ad; }
        .Utilities    { background: #d5d8dc; color: #555; }
    </style>
</head>
<body>
    <h2>📋 Installed Applications</h2>
    <div class="container">
        <%
        	@SuppressWarnings("unchecked")
            List<App> apps = (List<App>) request.getAttribute("apps");
            if (apps == null || apps.isEmpty()) {
        %>
            <p class="empty" style="background:white; padding:30px;
               border-radius:8px; box-shadow:0 2px 8px rgba(0,0,0,0.1);">
                No applications installed yet.
            </p>
        <%
            } else {
        %>
            <div class="count">Total Installed Apps: <%= apps.size() %></div>
            <table>
                <tr>
                    <th>App ID</th>
                    <th>App Name</th>
                    <th>Version</th>
                    <th>Category</th>
                </tr>
                <% for (App a : apps) { %>
                <tr>
                    <td><%= a.getAppId() %></td>
                    <td><%= a.getAppName() %></td>
                    <td><%= a.getVersion() %></td>
                    <td>
                        <span class="badge <%= a.getCategory().replace(" ","") %>">
                            <%= a.getCategory() %>
                        </span>
                    </td>
                </tr>
                <% } %>
            </table>
        <% } %>
        <a class="back" href="index.jsp">← Back to Menu</a>
    </div>
</body>
</html>