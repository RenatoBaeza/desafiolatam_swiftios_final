import SwiftUI

struct HeroDetailView: View {
    let hero: HeroDetail
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: URL(string: hero.imagen)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                .frame(maxWidth: .infinity)
                .cornerRadius(12)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text(hero.nombre)
                        .font(.title)
                        .bold()
                    
                    if let nombreReal = hero.nombreReal {
                        Text("Identidad: \(nombreReal)")
                            .font(.headline)
                    }
                    
                    Text("Primera aparición: \(hero.primeraAparicion)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    if let alias = hero.alias, !alias.isEmpty {
                        Text("Alias:")
                            .font(.headline)
                        ForEach(alias, id: \.self) { name in
                            Text("• \(name)")
                        }
                    }
                    
                    if let poderes = hero.poderes, !poderes.isEmpty {
                        Text("Poderes:")
                            .font(.headline)
                        ForEach(poderes, id: \.self) { poder in
                            Text("• \(poder)")
                        }
                    }
                    
                    Text("Historia")
                        .font(.headline)
                    Text(hero.historia)
                        .font(.body)
                    
                    if let afiliaciones = hero.afiliaciones, !afiliaciones.isEmpty {
                        Text("Afiliaciones:")
                            .font(.headline)
                        ForEach(afiliaciones, id: \.self) { afiliacion in
                            Text("• \(afiliacion)")
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
} 