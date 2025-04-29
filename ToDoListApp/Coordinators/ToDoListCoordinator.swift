import UIKit

class ToDoListCoordinator {
    private let navigationController: UINavigationController
    private let databaseService: DatabaseService
    private let toDoListViewModel: ToDoListViewModel

    init(navigationController: UINavigationController, databaseService: DatabaseService, toDoListViewModel: ToDoListViewModel) {
        self.navigationController = navigationController
        self.databaseService = databaseService
        self.toDoListViewModel = toDoListViewModel
    }

    func start() {
        let toDoListView = ToDoListView(viewModel: toDoListViewModel)
        navigationController.pushViewController(toDoListView, animated: true)
    }
}