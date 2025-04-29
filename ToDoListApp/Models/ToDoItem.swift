class ToDoItem {
    var id: String
    var title: String
    var isCompleted: Bool
    var dueDate: Date?

    init(id: String, title: String, isCompleted: Bool = false, dueDate: Date? = nil) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.dueDate = dueDate
    }
}