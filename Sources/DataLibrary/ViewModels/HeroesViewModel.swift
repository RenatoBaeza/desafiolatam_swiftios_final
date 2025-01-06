import Foundation
import UIKit

@MainActor
class HeroesViewModel: ObservableObject {
    @Published var heroes: [Hero] = []
    @Published var selectedHero: HeroDetail?
    @Published var isLoading = false
    @Published var error: Error?
    
    func fetchHeroes() {
        isLoading = true
        Task {
            do {
                heroes = try await NetworkManager.shared.fetchHeroes()
            } catch {
                self.error = error
            }
            isLoading = false
        }
    }
    
    func fetchHeroDetail(id: Int) {
        Task {
            do {
                selectedHero = try await NetworkManager.shared.fetchHeroDetail(id: id)
            } catch {
                self.error = error
            }
        }
    }
} 