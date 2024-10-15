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
    
    func deleteTodo(indexSet: IndexSet) -> Void {
        items.remove(atOffsets: indexSet)
    }
    
    func moveTodo(from: IndexSet, to : Int) -> Void {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    var body: some View {
        List {
            ForEach(items) {
                ListRowView(title: $0.title, isCompleted: $0.isCompleted)
            }
            .onDelete(perform: deleteTodo)
            .onMove(perform: moveTodo)
            
        }
        .listStyle(PlainListStyle())
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


