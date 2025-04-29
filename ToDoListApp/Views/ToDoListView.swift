import SwiftUI

struct ToDoListView: View {
    @ObservedObject var viewModel: ToDoListViewModel

    var body: some View {
        NavigationView {
            List(viewModel.toDoItems) { item in
                ToDoItemCell(item: item)
            }
            .navigationTitle("To-Do List")
            .onAppear {
                viewModel.fetchToDoItems()
            }
        }
    }
}