
import SwiftUI

protocol ProductDetailsFlowStateProtocol: ObservableObject {
    var activeLink: ProductDetailsLink? { get set }
}

enum ProductDetailsLink: Hashable { }

struct ProductDetailsFlowCoordinator<State: ProductDetailsFlowStateProtocol, Content: View>: View {

    @ObservedObject var state: State
    let content: () -> Content

    var body: some View {
        content()
    }
}
