
import SwiftUI

struct ProductDetailsView<VM: ProductDetailsViewModelProtocol & ProductDetailsFlowStateProtocol>: View {

    @StateObject var viewModel: VM

    var body: some View {
        ProductDetailsFlowCoordinator(state: viewModel, content: content)
    }

    @ViewBuilder private func content() -> some View {
        ZStack {
            Color.green.ignoresSafeArea()
            Text(viewModel.text)
        }
    }
}
