import SwiftUI

struct StockSummaryView: View {
    let largeLidNeeded: Int
    let smallLidNeeded: Int
    let cupHolderNeeded: Int
    
    @State private var largeLidTaken = false
    @State private var smallLidTaken = false
    @State private var cupHolderTaken = false
    
    @Environment(\.presentationMode) var presentationMode // Environment variable for dismissing view
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Stock Up Summary")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            // Large Lid
            if largeLidNeeded > 0 {
                HStack {
                    Text("Large Lid")
                    Spacer()
                    CheckBoxView(checked: $largeLidTaken)
                    Text("\(largeLidNeeded)")
                }
            }
            
            // Small Lid
            if smallLidNeeded > 0 {
                HStack {
                    Text("Small Lid")
                    Spacer()
                    CheckBoxView(checked: $smallLidTaken)
                    Text("\(smallLidNeeded)")
                }
            }
            
            // Cup Holder
            if cupHolderNeeded > 0 {
                HStack {
                    Text("Cup Holder")
                    Spacer()
                    CheckBoxView(checked: $cupHolderTaken)
                    Text("\(cupHolderNeeded)")
                }
            }
            
            // Back button
            Button(action: {
                presentationMode.wrappedValue.dismiss() // Dismiss the view
            }) {
                HStack {
                    Image(systemName: "chevron.left")
                    Text("Back")
                }
                .foregroundColor(.red)
                .padding()
                .background(Color.white)
                .border(Color.red, width: 1)
                .cornerRadius(8)
            }
        }
        .padding()
    }
}

struct CheckBoxView: View {
    @Binding var checked: Bool
    
    var body: some View {
        Button(action: {
            self.checked.toggle()
        }) {
            Image(systemName: checked ? "checkmark.square.fill" : "square")
                .foregroundColor(.blue)
        }
    }
}
