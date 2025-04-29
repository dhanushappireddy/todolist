import UIKit

class LoginCoordinator {
    private let navigationController: UINavigationController
    private let loginViewModel: LoginViewModel

    init(navigationController: UINavigationController, loginViewModel: LoginViewModel) {
        self.navigationController = navigationController
        self.loginViewModel = loginViewModel
    }

    func start() {
        let loginView = LoginView(viewModel: loginViewModel)
        loginView.coordinator = self
        navigationController.pushViewController(loginView, animated: true)
    }

    func didLoginSuccessfully() {
        let toDoListCoordinator = ToDoListCoordinator(navigationController: navigationController)
        toDoListCoordinator.start()
    }
}