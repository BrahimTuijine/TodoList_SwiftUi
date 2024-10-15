//
//  TodoModel.swift
//  TodoList
//
//  Created by MacBook on 15/10/2024.
//

import Foundation

struct TodoModel : Identifiable {
    let id : String = UUID().uuidString
    let title: String
    var isCompleted: Bool = false
}
