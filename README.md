# Todo App - Task Management Application

A simple and lightweight Flutter application that helps users take notes and manage their daily tasks. The app uses local storage to ensure data is safely stored and not lost when you close the app.

## 🚀 Key Features

* **Add Tasks:** Easily add new tasks via the Action Button.
* **Display List:** View all your pending tasks right on the main screen.
* **Search Tasks:** Quickly find a specific task using the built-in search tool.
* **Complete Tasks:** View task details and mark them as complete (which removes them from the list) with just a tap.
* **Local Storage:** Integrated with `shared_preferences` to automatically save and load your task list every time you open the app.

## 🛠 Tech Stack

* **Framework:** [Flutter](https://flutter.dev/)
* **Language:** Dart
* **Package:** [`shared_preferences`](https://pub.dev/packages/shared_preferences) (Local storage management)

## 📁 Folder Structure

* `main.dart`: The main entry point of the application.
* `homepage.dart`: Contains the main UI of the app and handles the core logic (Add, Delete, Search, and Storage).

## 💻 Installation & Usage Guide

Follow these steps to run the application on your local machine:

**Step 1:** Ensure you have the Flutter SDK installed. If not, follow the guide on the [Official Flutter Website](https://docs.flutter.dev/get-started/install).

**Step 2:** Open your Terminal (or Command Prompt) and navigate to the project directory.

**Step 3:** Install the required dependencies (specifically `shared_preferences`):
```bash
flutter pub get