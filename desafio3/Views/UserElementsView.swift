import SwiftUI

struct UserElementsView: View {
    @StateObject private var viewModel = UserElementsViewModel()
    @State private var showingSheet = false
    
    var body: some View {
        List {
            ForEach(viewModel.elements) { element in
                VStack(alignment: .leading) {
                    Text(element.title)
                        .font(.headline)
                    Text(element.description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    if let imageData = element.imageData,
                       let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 200)
                    }
                }
                .padding(.vertical, 8)
                .onTapGesture {
                    viewModel.elementToEdit = element
                    showingSheet = true
                }
            }
            .onDelete(perform: viewModel.deleteElement)
        }
        .navigationTitle("User Elements")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    viewModel.elementToEdit = nil
                    showingSheet = true
                }) {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingSheet) {
            AddElementSheet(
                isPresented: $showingSheet,
                elementToEdit: viewModel.elementToEdit,
                onSave: { title, description, imageData in
                    if let editingElement = viewModel.elementToEdit {
                        let updatedElement = UserElement(
                            title: title,
                            description: description,
                            imageData: imageData
                        )
                        viewModel.updateElement(updatedElement)
                    } else {
                        let newElement = UserElement(
                            title: title,
                            description: description,
                            imageData: imageData
                        )
                        viewModel.addElement(newElement)
                    }
                    showingSheet = false
                    viewModel.elementToEdit = nil
                }
            )
        }
    }
}

#Preview {
    NavigationStack {
        UserElementsView()
    }
} 