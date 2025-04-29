import UIKit

class AppCoordinator {
    var window: UIWindow?
    var loginCoordinator: LoginCoordinator?
    var toDoListCoordinator: ToDoListCoordinator?

    init(window: UIWindow?) {
        self.window = window
    }

    func start() {
        loginCoordinator = LoginCoordinator(window: window)
        loginCoordinator?.start()
    }

    func showToDoList() {
        toDoListCoordinator = ToDoListCoordinator(window: window)
        toDoListCoordinator?.start()
    }
}