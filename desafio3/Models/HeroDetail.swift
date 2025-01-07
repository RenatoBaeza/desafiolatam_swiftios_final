import Foundation

struct HeroDetail: Codable, Identifiable {
    let id: Int
    let nombre: String
    let nombreReal: String?
    let alias: [String]?
    let poderes: [String]?
    let primeraAparicion: String
    let historia: String
    let afiliaciones: [String]?
    let imagen: String
    
    enum CodingKeys: String, CodingKey {
        case id, nombre, nombreReal, alias, poderes
        case primeraAparicion = "primera_aparicion"
        case historia, afiliaciones, imagen
    }
    
    var name: String { nombre }
    var description: String { historia }
} 