# ToDo List App

This is a sample To-Do List application built using Swift, following the MVVM-C (Model-View-ViewModel-Coordinator) architecture pattern. The app includes a login screen for user authentication and displays a personalized to-do list after logging in. The backend is powered by MongoDB with PowerSync for data management.

## Features

- User authentication with username and password.
- Display of a personalized to-do list.
- Ability to add, edit, and delete to-do items.
- Responsive UI designed for a smooth user experience.

## Project Structure

- **AppDelegate.swift**: Sets up the application and handles application-level events.
- **SceneDelegate.swift**: Manages the app's UI lifecycle in a multi-window environment.
- **Models/ToDoItem.swift**: Defines the `ToDoItem` model representing a single to-do item.
- **Views**: Contains the UI components including `LoginView`, `ToDoListView`, and `ToDoItemCell`.
- **ViewModels**: Contains the logic for handling user input and data management with `LoginViewModel` and `ToDoListViewModel`.
- **Coordinators**: Manages navigation flow with `AppCoordinator`, `LoginCoordinator`, and `ToDoListCoordinator`.
- **Services**: Handles database interactions with `DatabaseService` and user authentication with `AuthService`.
- **Tests**: Contains unit tests for the view models to ensure functionality.

## Setup Instructions

1. Clone the repository to your local machine.
2. Open the project in Xcode.
3. Ensure you have the necessary dependencies installed for MongoDB and PowerSync.
4. Configure the `Info.plist` with your MongoDB connection details.
5. Build and run the application on your preferred simulator or device.

## Usage

- Launch the app and enter your username and password on the login screen.
- After successful login, you will be redirected to your to-do list.
- You can add, edit, or delete tasks as needed.

## Contributing

Feel free to submit issues or pull requests for improvements or bug fixes. 

## License

This project is licensed under the MIT License.