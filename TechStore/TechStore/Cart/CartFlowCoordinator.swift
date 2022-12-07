
import SwiftUI

protocol CartFlowStateProtocol: ObservableObject {
    var activeLink: CartLink? { get set }
}

enum CartLink: Hashable { }

struct CartFlowCoordinator<State: CartFlowStateProtocol, Content: View>: View {

    @ObservedObject var state: State
    let content: () -> Content

    var body: some View {
        content()
    }
}
