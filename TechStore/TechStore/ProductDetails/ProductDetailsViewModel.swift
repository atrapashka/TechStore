
import Foundation

protocol ProductDetailsViewModelProtocol: ObservableObject {
    var text: String { get }
}

final class ProductDetailsViewModel: ProductDetailsViewModelProtocol, ProductDetailsFlowStateProtocol {

    @Published var activeLink: ProductDetailsLink?

    @Published var text: String

    init(number: Int?) {
        if let number = number {
            self.text = "Second View with number: \(number)"
        } else {
            self.text = "Default Second View"
        }
    }
}
