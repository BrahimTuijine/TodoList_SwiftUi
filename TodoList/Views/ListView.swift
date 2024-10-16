//
//  ListView.swift
//  TodoList
//
//  Created by MacBook on 15/10/2024.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var todoViewModel: TodoViewModel
    
    var body: some View {
        List {
            ForEach(todoViewModel.items) { item in
                ListRowView(title: item.title, isCompleted: item.isCompleted)
                    .onTapGesture {
                        withAnimation(.linear) {
                            todoViewModel.updateStatus(todo: item)
                        }
                    }
            }
            .onDelete(perform: todoViewModel.deleteTodo)
            .onMove(perform: todoViewModel.moveTodo)
            
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
    }.environmentObject(TodoViewModel())
}


