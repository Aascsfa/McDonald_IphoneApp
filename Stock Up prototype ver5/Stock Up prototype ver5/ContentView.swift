import SwiftUI

struct ContentView: View {
    @State private var showOptions = false
    
    var body: some View {
        VStack {
            Text("Stock Management and Training Application")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding()
            
            Text("Welcome to Stock Management and Training Application: A Protot ype from Broadway Mcdonald")
                .foregroundColor(.black)
                .padding()
            
            Button(action: {
                showOptions = true
            }) {
                Text("Continue")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding()
            .sheet(isPresented: $showOptions) {
                WhatToDoView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
