
import Foundation

protocol CartViewModelProtocol: ObservableObject {
    var text: String { get }
}

final class CartViewModel: CartViewModelProtocol, CartFlowStateProtocol {

    @Published var activeLink: CartLink?

    @Published var text: String

    init(text: String) {
        self.text = "Sheet view with \(text)"
    }
}
