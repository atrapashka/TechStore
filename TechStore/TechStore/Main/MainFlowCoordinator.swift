
import SwiftUI

protocol MainFlowStateProtocol: ObservableObject {
    var activeLink: MainLink? {get set}
}

enum MainLink: Hashable, Identifiable {
    case productDetailsLink
    case productDetailsLinkParametrized(number: Int)
    case cartLink(item: String)

    var navigationLink: MainLink {
        switch self {
        case .productDetailsLinkParametrized:
            return .productDetailsLink
        default:
            return self
        }
    }

    var cartItem: MainLink? {
        switch self {
        case .cartLink:
            return self
        default:
            return nil
        }
    }

    var id: String {
        switch self {
        case .productDetailsLink, .productDetailsLinkParametrized:
            return "productDetails"
        case let .cartLink(item):
            return item
        }
    }
}

struct MainFlowCoordinator<State: MainFlowStateProtocol, Content: View>: View {

    @ObservedObject var state: State
    let content: () -> Content

    private var activeLink: Binding<MainLink?> {
        $state.activeLink.map(get: { $0?.navigationLink }, set: { $0 })
    }

    private var cartItem: Binding<MainLink?> {
        $state.activeLink.map(get: { $0?.cartItem }, set: { $0 })
    }

    var body: some View {
        NavigationView {
            ZStack {
                content()
                    .sheet(item: cartItem, content: cartContent)

                navigationLinks
            }
        }
        .navigationViewStyle(.stack)
    }

    @ViewBuilder private var navigationLinks: some View {
        NavigationLink(tag: .productDetailsLink,
                       selection: activeLink,
                       destination: productDetailsDestination) { EmptyView() }
    }

    private func productDetailsDestination() -> some View {
        var number: Int?
        if case let .productDetailsLinkParametrized(param) = state.activeLink {
            number = param
        }

        let viewModel = ProductDetailsViewModel(number: number)
        let view = ProductDetailsView(viewModel: viewModel)
        return view
    }

    @ViewBuilder private func cartContent(cartItem: MainLink) -> some View {
        switch cartItem {
        case let .cartLink(item):
            CartView(viewModel: CartViewModel(text: item))
        default:
            EmptyView()
        }
    }
}

extension Binding {
    func map<T>(get: @escaping (Value) -> T?, set: @escaping (T?) -> Value) -> Binding<T?> {
        Binding<T?>(
            get: {
                get(wrappedValue)
            },
            set: {
                wrappedValue = set($0)
            }
        )
    }
}
