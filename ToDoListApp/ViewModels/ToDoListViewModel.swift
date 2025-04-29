import Foundation
import Combine

class ToDoListViewModel: ObservableObject {
    @Published var toDoItems: [ToDoItem] = []
    private var cancellables = Set<AnyCancellable>()
    private let databaseService: DatabaseService

    init(databaseService: DatabaseService) {
        self.databaseService = databaseService
        fetchToDoItems()
    }

    func fetchToDoItems() {
        databaseService.fetchToDoItems()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Error fetching to-do items: \(error)")
                }
            }, receiveValue: { [weak self] items in
                self?.toDoItems = items
            })
            .store(in: &cancellables)
    }

    func addToDoItem(title: String) {
        let newItem = ToDoItem(id: UUID().uuidString, title: title, isCompleted: false, dueDate: nil)
        databaseService.saveToDoItem(newItem)
        toDoItems.append(newItem)
    }

    func toggleCompletion(for item: ToDoItem) {
        guard let index = toDoItems.firstIndex(where: { $0.id == item.id }) else { return }
        toDoItems[index].isCompleted.toggle()
        databaseService.updateToDoItem(toDoItems[index])
    }
}