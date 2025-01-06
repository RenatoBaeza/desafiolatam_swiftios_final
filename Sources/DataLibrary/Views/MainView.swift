import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                NavigationLink(destination: HeroesView()) {
                    Text("Heroes View")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .shadow(radius: 2)
                }
                
                NavigationLink(destination: UserElementsView()) {
                    Text("User Elements View")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(10)
                        .shadow(radius: 2)
                }
            }
            .padding()
            .navigationTitle("Data Library")
        }
    }
}

#Preview {
    MainView()
} 