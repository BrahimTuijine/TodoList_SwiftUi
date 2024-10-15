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
                .font(.title2)
                .padding(.vertical, 8)
        }
    }
}

#Preview {
    Group {
        ListRowView(title: "hello", isCompleted: true)
        ListRowView(title: "this is new title", isCompleted: true)
    }
    .previewLayout(.sizeThatFits)
}
