import Foundation
import SwiftUI
import SwiftData

@MainActor
class UserElementsViewModel: ObservableObject {
    @Published var userElements: [UserElement] = []
    
    func fetchUserElements() {
        // Implement your fetch logic here
    }
    
    func addUserElement(name: String, description: String, imageData: Data? = nil) {
        let newElement = UserElement(
            title: name,
            description: description,
            imageData: imageData
        )
        userElements.append(newElement)
    }
    
    func deleteUserElements(at indexSet: IndexSet) {
        userElements.remove(atOffsets: indexSet)
    }
    
    func updateUserElement(_ element: UserElement, title: String, description: String, imageData: Data?) {
        if let index = userElements.firstIndex(where: { $0.id == element.id }) {
            userElements[index].title = title
            userElements[index].imageData = imageData
        }
    }
} 
