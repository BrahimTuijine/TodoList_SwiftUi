//
//  TodoModel.swift
//  TodoList
//
//  Created by MacBook on 15/10/2024.
//

import Foundation

struct TodoModel : Identifiable, Codable {
    let id : String
    let title: String
    let isCompleted: Bool
    
    init(id : String = UUID().uuidString, title: String, isCompleted: Bool = false ) {
        self.title = title
        self.isCompleted = isCompleted
        self.id = id
    }
    
    func updateCompletetion() -> TodoModel {
        return TodoModel(id: id, title: title, isCompleted: !isCompleted)
    }
}

