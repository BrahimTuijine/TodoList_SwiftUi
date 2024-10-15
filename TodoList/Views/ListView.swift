//
//  ListView.swift
//  TodoList
//
//  Created by MacBook on 15/10/2024.
//

import SwiftUI

struct ListView: View {
    
    @State var items : [TodoModel] = [
        TodoModel(title: "This is the first item !", isCompleted: true),
        TodoModel(title: "this is the second !"),
        TodoModel(title: "this is Third !")
    ]
    
    var body: some View {
        List(items) {
            
            ListRowView(title: $0.title, isCompleted: $0.isCompleted)
            
        }.listStyle(PlainListStyle())
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading:  EditButton(),
            trailing: NavigationLink("Add", destination: AddTodoView())
        )
    }
    
}

#Preview {
    NavigationView {
        ListView()
    }
}


