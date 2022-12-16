
import SwiftUI

@main
struct TechStoreApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: MainViewModel())
        }
    }
}
