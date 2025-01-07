import Foundation

struct Hero: Codable, Identifiable {
    let id: Int
    let nombre: String
    let primeraAparicion: String
    let imagen: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case nombre
        case primeraAparicion = "primera_aparicion"
        case imagen
    }
    
    var name: String { nombre }
}