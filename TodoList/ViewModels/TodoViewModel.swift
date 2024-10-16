//
//  TodoViewModel.swift
//  TodoList
//
//  Created by MacBook on 15/10/2024.
//

import Foundation

class TodoViewModel : ObservableObject {
    @Published var items : [TodoModel] = [
        TodoModel(title: "This is the first item !", isCompleted: true),
        TodoModel(title: "this is the second !"),
        TodoModel(title: "this is Third !")
    ]
    
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
    
}
