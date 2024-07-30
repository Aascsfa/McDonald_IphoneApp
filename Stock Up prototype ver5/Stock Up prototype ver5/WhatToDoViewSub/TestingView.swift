import SwiftUI

struct TestingView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Please choose your area")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                NavigationLink(destination: BackAreaTestingView()) {
                    Text("Back")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                
                NavigationLink(destination: FrontAreaTestingView()) {
                    Text("Front")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                
                NavigationLink(destination: CafeAreaTestingView()) {
                    Text("Cafe")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct TestingView_Previews: PreviewProvider {
    static var previews: some View {
        TestingView()
    }
}
