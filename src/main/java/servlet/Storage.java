package servlet;

import model.App;
import java.util.ArrayList;
import java.util.List;

public class Storage {

    // Static list — stays in memory while server runs
    private static List<App> installedApps = new ArrayList<>();

    public static List<App> getInstalledApps() {
        return installedApps;
    }

    public static App findApp(int appId) {
        for (App a : installedApps) {
            if (a.getAppId() == appId) return a;
        }
        return null;
    }

    public static boolean appExists(int appId) {
        return findApp(appId) != null;
    }

    public static boolean uninstallApp(int appId) {
        return installedApps.removeIf(a -> a.getAppId() == appId);
    }
}