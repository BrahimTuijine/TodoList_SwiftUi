//
//  NoTodosView.swift
//  TodoList
//
//  Created by MacBook on 18/10/2024.
//

import SwiftUI

struct NoTodosView: View {
    
    @State var animate: Bool = false
    
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    func animation() -> Void {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation.easeInOut(duration: 2)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("There are no items !")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("Are you a productive person? I think you should click the add button and add a bunch of items to your list!")
                    .padding(.bottom)
                
                NavigationLink {
                    AddTodoView()
                } label: {
                    Text("Add Todo 🥳")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? secondaryAccentColor  : Color.accentColor)
                        .cornerRadius(10)
                }
                .padding(.horizontal, animate ? 30 : 50)
                . shadow(
                color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                radius: animate ? 30 : 10,
                x: 0,
                y: animate ? 20 : 10)
                .scaleEffect(animate ? 1.1 : 1)
                .offset(y: animate ? -7 : 0)

            }
            .frame(maxWidth: 400)
            .padding(40)
            .onAppear(perform: animation)
            
        }
        .frame(maxWidth: .infinity)
        .multilineTextAlignment(.center)
        
        
    }
}

#Preview {
    NavigationView {
        NoTodosView()
    }
}
