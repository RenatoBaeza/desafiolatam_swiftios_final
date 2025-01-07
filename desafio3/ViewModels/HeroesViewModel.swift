import Foundation

@MainActor
class HeroesViewModel: ObservableObject {
    @Published var heroes: [Hero] = []
    @Published var selectedHero: HeroDetail?
    @Published var isLoading = false
    @Published var error: Error?
    
    private let baseURL = "https://heroes-api-two.vercel.app/es/marvel/heroes"
    
    func fetchHeroes() {
        isLoading = true
        
        guard let url = URL(string: baseURL) else {
            self.error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
            isLoading = false
            return
        }
        
        Task {
            do {
                let (data, response) = try await URLSession.shared.data(from: url)
                
                // Print response for debugging
                if let httpResponse = response as? HTTPURLResponse {
                    print("HTTP Status Code: \(httpResponse.statusCode)")
                }
                
                // Print raw data for debugging
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("Raw JSON response: \(jsonString)")
                }
                
                let decodedHeroes = try JSONDecoder().decode([Hero].self, from: data)
                self.heroes = decodedHeroes
            } catch {
                self.error = error
            }
            self.isLoading = false
        }
    }
    
    func fetchHeroDetail(id: Int) {
        isLoading = true
        
        guard let url = URL(string: "\(baseURL)/\(id)") else {
            isLoading = false
            return
        }
        
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let heroDetail = try JSONDecoder().decode(HeroDetail.self, from: data)
                self.selectedHero = heroDetail
            } catch {
                self.error = error
            }
            self.isLoading = false
        }
    }
} 