import Foundation

@MainActor
class UserElementsViewModel: ObservableObject {
    @Published var elements: [UserElement] = []
    @Published var isLoading = false
    @Published var error: Error?
    @Published var elementToEdit: UserElement?
    
    func addElement(_ element: UserElement) {
        elements.append(element)
    }
    
    func deleteElement(at indexSet: IndexSet) {
        elements.remove(atOffsets: indexSet)
    }
    
    func updateElement(_ updatedElement: UserElement) {
        if let index = elements.firstIndex(where: { $0.id == updatedElement.id }) {
            elements[index] = updatedElement
        }
    }
} 