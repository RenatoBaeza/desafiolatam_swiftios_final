import SwiftUI

struct HeroesView: View {
    @StateObject private var viewModel = HeroesViewModel()
    @State private var showingAddSheet = false
    
    var body: some View {
        List(viewModel.heroes) { hero in
            Button(action: {
                viewModel.fetchHeroDetail(id: hero.id)
            }) {
                HeroRow(hero: hero)
            }
        }
        .navigationTitle("Heroes")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showingAddSheet) {
            AddElementSheet(
                isPresented: $showingAddSheet,
                onSave: { name, description, imageData in
                    // Handle save with the additional imageData parameter
                }
            )
        }
        .sheet(item: $viewModel.selectedHero) { hero in
            HeroDetailView(hero: hero)
        }
        .onAppear {
            viewModel.fetchHeroes()
        }
    }
}

struct HeroRow: View {
    let hero: Hero
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: hero.imagen)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50)
            
            Text(hero.nombre)
        }
    }
}

#Preview {
    NavigationStack {
        HeroesView()
    }
}
