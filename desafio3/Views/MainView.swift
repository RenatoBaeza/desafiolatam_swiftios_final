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
                }
                
                NavigationLink(destination: UserElementsView()) {
                    Text("User Elements")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }
            }
            .padding()
            .navigationTitle("Main Menu")
        }
    }
}

#Preview {
    MainView()
}