//
//  TodoList.swift
//  TodoList
//
//  Created by MacBook on 15/10/2024.
//

import SwiftUI

@main
struct TodoListApp: App {
    @StateObject var todoViewModel: TodoViewModel = TodoViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(todoViewModel)
        }
    }
}

