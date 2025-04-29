import Foundation
import MongoDBVapor

class DatabaseService {
    private var client: MongoClient?
    private var database: MongoDatabase?

    init() {
        connectToDatabase()
    }

    private func connectToDatabase() {
        let connectionString = "your_mongodb_connection_string"
        client = try? MongoClient(connectionString)
        database = client?.db("ToDoListDB")
    }

    func fetchToDoItems(completion: @escaping ([ToDoItem]?) -> Void) {
        guard let collection = database?.collection("toDoItems") else {
            completion(nil)
            return
        }

        collection.find().toArray { result in
            switch result {
            case .success(let documents):
                let items = documents.compactMap { ToDoItem(document: $0) }
                completion(items)
            case .failure:
                completion(nil)
            }
        }
    }

    func saveToDoItem(_ item: ToDoItem, completion: @escaping (Bool) -> Void) {
        guard let collection = database?.collection("toDoItems") else {
            completion(false)
            return
        }

        let document: Document = [
            "title": item.title,
            "isCompleted": item.isCompleted,
            "dueDate": item.dueDate
        ]

        collection.insertOne(document) { result in
            switch result {
            case .success:
                completion(true)
            case .failure:
                completion(false)
            }
        }
    }
}