//
//  TodoViewModel.swift
//  TodoList
//
//  Created by MacBook on 15/10/2024.
//

import Foundation

class TodoViewModel : ObservableObject {
    let todosKey : String = "todoKey"
    
    @Published var items : [TodoModel] = [] {
        didSet {
            saveTodos()
        }
    }
    
    init() {
        getTodos()
    }
    
    func deleteTodo(indexSet: IndexSet) -> Void {
        items.remove(atOffsets: indexSet)
    }
    
    func moveTodo(from: IndexSet, to : Int) -> Void {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addTodo(todo : TodoModel) -> Void {
        items.append(todo)
    }
    
    func updateStatus(todo: TodoModel) -> Void {
        if let index = items.firstIndex(where: { $0.id == todo.id }){
            items[index] = todo.updateCompletetion()
        }
    }
    
    func saveTodos() -> Void {
        if let encodedTodos = try? JSONEncoder().encode(items) {
            UserDefaults.standard.setValue(encodedTodos, forKey: todosKey)
        }
    }
    
    func getTodos() -> Void {
        guard
            let encodedTodos = UserDefaults.standard.value(forKey: todosKey),
            let decodedTodos = try? JSONDecoder().decode([TodoModel].self, from: encodedTodos as! Data  )
        else { return }
        
        items = decodedTodos
    }
    
}
