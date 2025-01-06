import SwiftUI
import SwiftData

@main
struct DataLibraryApp: App {
    let container: ModelContainer
    
    init() {
        // Set supported orientations to portrait only
        UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        
        // Disable landscape orientations
        if #available(iOS 16.0, *) {
            UIApplication.shared.connectedScenes.compactMap { ($0 as? UIWindowScene)?.keyWindow }.last?.rootViewController?.setNeedsUpdateOfSupportedInterfaceOrientations()
        }
        
        // Initialize ModelContainer
        do {
            let config = ModelConfiguration(isStoredInMemoryOnly: true)
            container = try ModelContainer(for: UserElement.self, configurations: config)
        } catch {
            fatalError("Could not initialize ModelContainer: \(error)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(container)
    }
}

// Add this extension to enforce portrait orientation
extension UIWindowScene {
    func requestGeometryUpdate(using preferences: UIWindowScene.GeometryPreferences) async throws {
        try await self.requestGeometryUpdate(preferences)
    }
}

#Preview {
    MainView()
        .modelContainer(for: UserElement.self)
} 