import SwiftUI

struct HeroDetailView: View {
    let hero: HeroDetail
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    AsyncImage(url: URL(string: hero.imagen)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 300)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text(hero.nombre)
                            .font(.title)
                            .bold()
                        
                        Text("Real Name: \(hero.nombreReal)")
                            .font(.headline)
                        
                        Text("First Appearance: \(hero.primeraAparicion)")
                            .foregroundColor(.gray)
                        
                        Text("Aliases:")
                            .font(.headline)
                        ForEach(hero.alias, id: \.self) { alias in
                            Text("• \(alias)")
                        }
                        
                        Text("Powers:")
                            .font(.headline)
                        ForEach(hero.poderes, id: \.self) { power in
                            Text("• \(power)")
                        }
                        
                        Text("History:")
                            .font(.headline)
                        Text(hero.historia)
                        
                        Text("Affiliations:")
                            .font(.headline)
                        ForEach(hero.afiliaciones, id: \.self) { affiliation in
                            Text("• \(affiliation)")
                        }
                    }
                    .padding()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}
