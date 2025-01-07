import SwiftUI

struct AddElementSheet: View {
    @Binding var isPresented: Bool
    var elementToEdit: UserElement?
    let onSave: (String, String, Data?) -> Void
    
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var selectedImage: UIImage?
    @State private var showingImagePicker = false
    
    init(isPresented: Binding<Bool>, elementToEdit: UserElement? = nil, onSave: @escaping (String, String, Data?) -> Void) {
        self._isPresented = isPresented
        self.elementToEdit = elementToEdit
        self.onSave = onSave
        
        if let element = elementToEdit {
            _title = State(initialValue: element.title)
            _description = State(initialValue: element.description)
            if let imageData = element.imageData {
                _selectedImage = State(initialValue: UIImage(data: imageData))
            }
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
                
                Button(action: {
                    showingImagePicker = true
                }) {
                    HStack {
                        Text("Select Image")
                        Spacer()
                        if let image = selectedImage {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 100)
                        }
                    }
                }
            }
            .navigationTitle(elementToEdit != nil ? "Edit Element" : "Add New Element")
            .navigationBarItems(
                leading: Button("Cancel") {
                    isPresented = false
                },
                trailing: Button("Save") {
                    onSave(
                        title,
                        description,
                        selectedImage?.jpegData(compressionQuality: 0.8)
                    )
                }
                .disabled(title.isEmpty || description.isEmpty)
            )
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $selectedImage)
        }
    }
} 