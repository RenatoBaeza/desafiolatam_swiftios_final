import Foundation

struct UserElement: Identifiable {
    let id: UUID = UUID()
    let title: String
    let description: String
    let imageData: Data?
} 