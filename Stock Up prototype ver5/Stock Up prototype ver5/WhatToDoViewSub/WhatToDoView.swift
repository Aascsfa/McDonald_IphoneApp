import SwiftUI

struct WhatToDoView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showStockUp = false
    @State private var showTraining = false
    @State private var showTesting = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("What would you like to do today?")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding()
            
            Button(action: {
                showStockUp = true
            }) {
                Text("Stock Up")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .sheet(isPresented: $showStockUp) {
                StockUpView()
            }
            
            Button(action: {
                showTraining = true
            }) {
                Text("Training")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .sheet(isPresented: $showTraining) {
                TrainingView()
            }
            
            Button(action: {
                showTesting = true
            }) {
                Text("Testing")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .sheet(isPresented: $showTesting) {
                TestingView()
            }
            
            Spacer() // Pushes the button to the bottom
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Back")
                    .foregroundColor(.red)
                    .padding()
                    .background(Color.white)
                    .border(Color.red, width: 1)
                    .cornerRadius(8)
            }
            .padding()
        }
        .padding()
    }
}
