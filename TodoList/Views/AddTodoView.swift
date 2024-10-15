//
//  AddTodoView.swift
//  TodoList
//
//  Created by MacBook on 15/10/2024.
//

import SwiftUI

struct AddTodoView: View {
        
    @State var todoTitle: String = ""
    
    var body: some View {
        ScrollView {
            TextField("Type something here...", text: $todoTitle)
                .padding()
                .frame(height: 55)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                
            
            
            Button(action: {
                
            }, label: {
                Text("SAVE")
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(10)
                
            })
                
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
