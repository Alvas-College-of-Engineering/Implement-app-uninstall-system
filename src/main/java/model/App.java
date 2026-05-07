package model;

public class App {
    private int appId;
    private String appName;
    private String version;
    private String category;

    public App(int appId, String appName, String version, String category) {
        this.appId    = appId;
        this.appName  = appName;
        this.version  = version;
        this.category = category;
    }

    public int    getAppId()    { return appId; }
    public String getAppName()  { return appName; }
    public String getVersion()  { return version; }
    public String getCategory() { return category; }

    @Override
    public String toString() {
        return "App [ID=" + appId + ", Name=" + appName +
               ", Version=" + version + ", Category=" + category + "]";
    }
}