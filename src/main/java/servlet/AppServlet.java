package servlet;

import model.App;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;

//@WebServlet("/AppServlet")
public class AppServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String message = "";

        // ── INSTALL APP ───────────────────────────────────────────────────
        if (action.equals("install")) {
            int    appId    = Integer.parseInt(request.getParameter("appId"));
            String appName  = request.getParameter("appName");
            String version  = request.getParameter("version");
            String category = request.getParameter("category");

            if (Storage.appExists(appId)) {
                message = "ERROR: App ID " + appId + " is already installed!";
            } else {
                Storage.getInstalledApps().add(new App(appId, appName, version, category));
                message = "SUCCESS: '" + appName + "' installed successfully!";
            }

            request.setAttribute("message", message);
            request.getRequestDispatcher("installApp.jsp").forward(request, response);
        }

        // ── UNINSTALL APP ─────────────────────────────────────────────────
        else if (action.equals("uninstall")) {
            int appId = Integer.parseInt(request.getParameter("appId"));

            App app = Storage.findApp(appId);
            if (app == null) {
                message = "ERROR: App ID " + appId + " not found!";
            } else {
                String appName = app.getAppName();
                Storage.uninstallApp(appId);
                message = "SUCCESS: '" + appName + "' uninstalled successfully!";
            }

            request.setAttribute("message", message);
            request.setAttribute("apps", Storage.getInstalledApps());
            request.getRequestDispatcher("uninstallApp.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        // ── DISPLAY ALL ───────────────────────────────────────────────────
        if ("display".equals(action)) {
            request.setAttribute("apps", Storage.getInstalledApps());
            request.getRequestDispatcher("display.jsp").forward(request, response);
        } else {
            response.sendRedirect("index.jsp");
        }
    }
}