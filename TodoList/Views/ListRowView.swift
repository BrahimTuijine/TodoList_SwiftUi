//
//  ListRowView.swift
//  TodoList
//
//  Created by MacBook on 15/10/2024.
//

import SwiftUI

struct ListRowView: View {
    let title : String
    let isCompleted: Bool
    
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
                .foregroundColor(isCompleted ? .green : .red)
            Text(title)
        }
    }
}

#Preview {
    ListRowView(title: "test", isCompleted: true)
}
