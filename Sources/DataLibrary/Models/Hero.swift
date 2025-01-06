import Foundation

struct Hero: Codable, Identifiable {
    let id: Int
    let nombre: String
    let primeraAparicion: String
    let imagen: String
}

struct HeroDetail: Codable, Identifiable {
    let id: Int
    let nombre: String
    let nombreReal: String
    let alias: [String]
    let poderes: [String]
    let primeraAparicion: String
    let historia: String
    let afiliaciones: [String]
    let imagen: String
} 