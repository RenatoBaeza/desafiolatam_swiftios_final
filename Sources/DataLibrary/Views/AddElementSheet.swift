import SwiftUI

struct AddElementSheet: View {
    @Binding var isPresented: Bool
    let onSave: (String, String, Data?) -> Void
    var initialTitle: String = ""
    var initialImage: UIImage? = nil
    
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var showingImagePicker = false
    @State private var selectedImage: UIImage?
    
    init(isPresented: Binding<Bool>, 
         onSave: @escaping (String, String, Data?) -> Void,
         initialTitle: String = "",
         initialImage: UIImage? = nil) {
        self._isPresented = isPresented
        self.onSave = onSave
        self._title = State(initialValue: initialTitle)
        self._selectedImage = State(initialValue: initialImage)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Title", text: $title)
                    TextField("Description", text: $description)
                }
                
                Section {
                    if let selectedImage {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                    }
                    
                    Button(action: { showingImagePicker = true }) {
                        Label(
                            selectedImage == nil ? "Add Image" : "Change Image",
                            systemImage: "photo"
                        )
                    }
                }
            }
            .navigationTitle(initialTitle.isEmpty ? "New Element" : "Edit Element")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        isPresented = false
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        onSave(
                            title,
                            description,
                            selectedImage?.jpegData(compressionQuality: 0.8)
                        )
                        isPresented = false
                    }
                }
            }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $selectedImage)
            }
        }
    }
}

#Preview {
    AddElementSheet(isPresented: .constant(true)) { _, _, _ in }
} 