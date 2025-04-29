import XCTest
@testable import ToDoListApp

class ToDoListViewModelTests: XCTestCase {
    
    var viewModel: ToDoListViewModel!
    var mockDatabaseService: MockDatabaseService!

    override func setUp() {
        super.setUp()
        mockDatabaseService = MockDatabaseService()
        viewModel = ToDoListViewModel(databaseService: mockDatabaseService)
    }

    override func tearDown() {
        viewModel = nil
        mockDatabaseService = nil
        super.tearDown()
    }

    func testFetchToDoItems() {
        mockDatabaseService.mockToDoItems = [ToDoItem(id: "1", title: "Test Item", isCompleted: false, dueDate: nil)]
        
        viewModel.fetchToDoItems()
        
        XCTAssertEqual(viewModel.toDoItems.count, 1)
        XCTAssertEqual(viewModel.toDoItems.first?.title, "Test Item")
    }

    func testAddToDoItem() {
        let newItem = ToDoItem(id: "2", title: "New Item", isCompleted: false, dueDate: nil)
        
        viewModel.addToDoItem(newItem)
        
        XCTAssertEqual(viewModel.toDoItems.count, 1)
        XCTAssertEqual(viewModel.toDoItems.first?.title, "New Item")
    }

    func testRemoveToDoItem() {
        let itemToRemove = ToDoItem(id: "1", title: "Item to Remove", isCompleted: false, dueDate: nil)
        viewModel.addToDoItem(itemToRemove)
        
        viewModel.removeToDoItem(itemToRemove)
        
        XCTAssertEqual(viewModel.toDoItems.count, 0)
    }
}

class MockDatabaseService: DatabaseService {
    var mockToDoItems: [ToDoItem] = []
    
    override func fetchToDoItems(completion: @escaping ([ToDoItem]) -> Void) {
        completion(mockToDoItems)
    }
    
    override func saveToDoItem(_ item: ToDoItem, completion: @escaping (Bool) -> Void) {
        mockToDoItems.append(item)
        completion(true)
    }
    
    override func deleteToDoItem(_ item: ToDoItem, completion: @escaping (Bool) -> Void) {
        if let index = mockToDoItems.firstIndex(where: { $0.id == item.id }) {
            mockToDoItems.remove(at: index)
            completion(true)
        } else {
            completion(false)
        }
    }
}