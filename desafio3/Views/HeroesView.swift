import SwiftUI

struct HeroesView: View {
    @StateObject private var viewModel = HeroesViewModel()
    
    var body: some View {
        List(viewModel.heroes) { hero in
            HeroRow(hero: hero)
                .onTapGesture {
                    viewModel.fetchHeroDetail(id: hero.id)
                }
        }
        .navigationTitle("Heroes")
        .onAppear {
            viewModel.fetchHeroes()
        }
        .sheet(item: $viewModel.selectedHero) { hero in
            HeroDetailView(hero: hero)
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
                .font(.headline)
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    NavigationStack {
        HeroesView()
    }
} 