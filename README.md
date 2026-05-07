# 📱 App Uninstall System

A Java-based dynamic web application that allows users to install and uninstall applications, updates the list of installed apps, and displays confirmation along with the remaining apps using appropriate classes, constructors, and methods.

---

## 📌 Project Description

The **App Uninstall System** is a dynamic web project built using **JSP and Servlet** that simulates a basic application manager. Users can install new apps, uninstall existing ones with confirmation, and view all currently installed applications — all without a database (in-memory storage).

---

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| Java | Core logic and backend |
| JSP (JavaServer Pages) | Frontend web pages |
| Servlet | Request handling and routing |
| HTML + CSS | UI styling |
| Apache Tomcat 9+ | Web server |
| Eclipse IDE | Development environment |

---

## 📁 Project Structure

```
AppUninstallSystem/
└── src/
    └── main/
        ├── java/
        │   ├── model/
        │   │   └── App.java                  # App entity (ID, Name, Version, Category)
        │   └── servlet/
        │       ├── Storage.java              # In-memory static list (acts as DB)
        │       └── AppServlet.java           # Main servlet handling all requests
        └── webapp/
            ├── WEB-INF/
            │   ├── lib/
            │   │   └── servlet-api.jar       # Servlet dependency
            │   └── web.xml                   # Servlet mapping configuration
            ├── index.jsp                     # Home page / Menu
            ├── installApp.jsp                # Install Application page
            ├── uninstallApp.jsp              # Uninstall Application page
            └── display.jsp                   # View All Installed Apps page
```

---

## ⚙️ Features

- ✅ **Install Application** — Add apps with ID, Name, Version, and Category
- ✅ **Uninstall Application** — Remove an app by ID with success confirmation
- ✅ **Remaining Apps Display** — Shows updated app list after every uninstall
- ✅ **View All Apps** — Display all installed apps in a styled table with category badges
- ✅ **Duplicate Check** — Prevents installing an app with an existing ID
- ✅ **In-Memory Storage** — No database required, uses static Java List

---

## 🔁 Application Flow

```
index.jsp (Menu)
    │
    ├── installApp.jsp    ──POST──► AppServlet (action=install)
    ├── uninstallApp.jsp  ──POST──► AppServlet (action=uninstall)
    │       └── displays remaining apps after uninstall ✅
    └── display.jsp       ◄──GET──  AppServlet (action=display)
                                          │
                                     Storage.java
                                  (static List<App>)
```

---

## 🚀 How to Run

### Prerequisites
- Java JDK 8 or above
- Apache Tomcat 9+
- Eclipse IDE (Dynamic Web Project)

### Steps

**1. Clone the Repository**
```bash
git clone https://github.com/Alvas-College-of-Engineering/Implement-app-uninstall-system.git
```

**2. Import into Eclipse**
```
File → Import → Existing Projects into Workspace
→ Select cloned folder → Finish
```

**3. Add Tomcat Server**
```
Right-click Project → Build Path → Configure Build Path
→ Libraries → Add Library → Server Runtime → Select Tomcat → Finish
```

**4. Add servlet-api.jar**
```
Copy servlet-api.jar from: apache-tomcat/lib/
Paste into: WEB-INF/lib/
```

**5. Run the Project**
```
Right-click Project → Run As → Run on Server → Select Tomcat → Finish
```

**6. Open in Browser**
```
http://localhost:8080/AppUninstallSystem/
```

---

## 📸 Pages Overview

| Page | URL | Description |
|---|---|---|
| Home Menu | `/index.jsp` | Navigation to all features |
| Install App | `/installApp.jsp` | Form to install a new application |
| Uninstall App | `/uninstallApp.jsp` | Remove app and view remaining apps |
| Display All | `/AppServlet?action=display` | View all installed apps with category badges |

---

## 👥 Classes Overview

### App.java
```
Fields  : appId, appName, version, category
Methods : getAppId(), getAppName(), getVersion(), getCategory()
```

### Storage.java
```
Type    : Utility class with static List<App>
Methods : getInstalledApps(), findApp(), appExists(), uninstallApp()
```

### AppServlet.java
```
Type    : HttpServlet handling POST and GET
Actions : install, uninstall, display
```

---

## ✅ Validations

- App ID must be unique — no duplicate installations
- App must exist before uninstalling
- Confirmation message shown after every install and uninstall
- Remaining apps list updated and displayed after every uninstall

---

## 📂 App Categories Supported

| Category | Badge Color |
|---|---|
| Social Media | Green |
| Games | Red |
| Productivity | Blue |
| Education | Orange |
| Entertainment | Purple |
| Utilities | Grey |

---

## 📚 Concepts Used

- **OOP** — Encapsulation using private fields and public getters
- **Servlet Lifecycle** — doGet() and doPost() request handling
- **JSP Scriptlets** — Dynamic HTML generation using Java in JSP
- **Request Attributes** — Passing data from Servlet to JSP via setAttribute()
- **In-Memory Storage** — Static List as temporary data store
- **Lambda Expression** — Used in removeIf() for uninstall logic

---

## 👨‍💻 Developed By

**Reshma S Gowda**
Student ID: 4AL23CS122
Computer Science Engineering
Alvas College of Engineering

---

## 🏫 Organization

**Alvas College of Engineering**
[GitHub Organization](https://github.com/Alvas-College-of-Engineering)
