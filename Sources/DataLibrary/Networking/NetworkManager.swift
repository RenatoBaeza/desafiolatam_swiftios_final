import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://heroes-api-two.vercel.app/es/marvel/heroes"
    
    private init() {}
    
    func fetchHeroes() async throws -> [Hero] {
        return try await AF.request(baseURL)
            .serializingDecodable([Hero].self)
            .value
    }
    
    func fetchHeroDetail(id: Int) async throws -> HeroDetail {
        return try await AF.request("\(baseURL)/\(id)")
            .serializingDecodable(HeroDetail.self)
            .value
    }
} 