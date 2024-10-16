//
//  AddTodoView.swift
//  TodoList
//
//  Created by MacBook on 15/10/2024.
//

import SwiftUI

struct AddTodoView: View {
    
    @EnvironmentObject var todoViewModel: TodoViewModel
    @Environment(\.presentationMode) var presentationMode
        
    @State private var  todoTitle: String = ""
    
    @State private var  showAlert: Bool = false
    
    func titleIsValid() -> Bool {
        return todoTitle.count > 3
    }
    
    var body: some View {
        ScrollView {
            TextField("Type something here...", text: $todoTitle)
                .padding()
                .frame(height: 55)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            
            
            Button(action: {
                if titleIsValid() {
                    todoViewModel.addTodo(todo: TodoModel(title: todoTitle))
                    presentationMode.wrappedValue.dismiss()
                }else {
                    showAlert = true
                }
                
            }, label: {
                Text("SAVE")
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(10)
                
            }).alert(isPresented: $showAlert) {
                Alert(title: Text("your title is not valid"))
            }
                
               // Button("ok" , role: .cancel ) {
                    // presentationMode.wrappedValue.dismiss()
                    // showAlert = false
                //}
            
            
        }
        .padding()
        .navigationTitle("Add Todo 🖋️")
    }
}

#Preview {
    NavigationView {
       AddTodoView()
    }
}
