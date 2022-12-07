
import SwiftUI

struct CartView<VM: CartViewModelProtocol & CartFlowStateProtocol>: View {

    @StateObject var viewModel: VM

    var body: some View {
        CartFlowCoordinator(state: viewModel, content: content)
    }

    @ViewBuilder private func content() -> some View {
        ZStack {
            Color.yellow.ignoresSafeArea()
            Text(viewModel.text)
        }
    }
}
