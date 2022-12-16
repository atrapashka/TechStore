
import Foundation
import UIKit

protocol MainViewModelProtocol: ObservableObject {
    var text: String { get }

    func transitToProductDetails()
    func transitToCart()
}

final class MainViewModel: MainViewModelProtocol, MainFlowStateProtocol {

    // MARK: - Flow State
    @Published var activeLink: MainLink?

    // MARK: - View Model

    let text: String = "Main View"

    init() { }

    func transitToProductDetails() {
        activeLink = .productDetailsLinkParametrized(number: 200)
    }

    func transitToCart() {
        activeLink = .cartLink(item: "")
    }
}
