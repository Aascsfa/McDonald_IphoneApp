import SwiftUI

struct StockUpView: View {
    // Static string for each stock item
    let stockItems = ["Large Lid", "Small Lid", "Cup Holder"]
    
    // Group stock items under each station
    let stations: [(String, [String])] = [
        ("Counter", ["Cup Holder"]),
        ("Run Station", ["Large Lid", "Small Lid"])
    ]
    
    // Current stock for each item
    @State private var largeLidStock = ""
    @State private var smallLidStock = ""
    @State private var cupHolderStock = ""
    
    @Environment(\.presentationMode) var presentationMode // Environment variable for dismissing view
    
    @State private var showingSummary = false // Flag to control navigation
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Stock Up Calculator")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Text("Please input the current stock on the shelves. If it is full, move to the next item")
                    .foregroundColor(.black)
                
                // Display subheaders and stock items for each station
                ForEach(stations, id: \.0) { station, items in
                    // Subheader for each station
                    Text(station)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.top)
                    
                    // Display stock items for the station
                    ForEach(items, id: \.self) { item in
                        HStack {
                            Text(item)
                            Spacer()
                            TextField("Current Stock", text: stockBinding(for: item))
                                .keyboardType(.numberPad)
                                .frame(width: 100)
                                .padding()
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    }
                }
                
                Button(action: {
                    showingSummary = true // Set flag to true to navigate to summary
                }) {
                    Text("Calculate Stock Needed")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                
                // Back button to dismiss view and navigate to WhatToDoView
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
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .sheet(isPresented: $showingSummary) {
                // Pass calculated stock needed to summary view
                StockSummaryView(largeLidNeeded: stockNeeded(for: "Large Lid"),
                                 smallLidNeeded: stockNeeded(for: "Small Lid"),
                                 cupHolderNeeded: stockNeeded(for: "Cup Holder"))
            }
        }
    }
    
    // Function to bind current stock for each item
    private func stockBinding(for item: String) -> Binding<String> {
        switch item {
        case "Large Lid":
            return $largeLidStock
        case "Small Lid":
            return $smallLidStock
        case "Cup Holder":
            return $cupHolderStock
        default:
            return Binding.constant("")
        }
    }
    
    // Function to calculate stock needed for each item
    private func stockNeeded(for item: String) -> Int {
        guard let currentStock = Int(stockBinding(for: item).wrappedValue) else { return 0 }
        return max(0, 10 - currentStock)
    }
}

struct StockUpView_Previews: PreviewProvider {
    static var previews: some View {
        StockUpView()
    }
}
