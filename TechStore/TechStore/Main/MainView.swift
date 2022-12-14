
import SwiftUI

struct MainView<VM: MainViewModelProtocol & MainFlowStateProtocol>: View {

    @StateObject var viewModel: VM
    @State var showFilter = false

    var body: some View {
        MainFlowCoordinator(state: viewModel, content: content)
    }

    @ViewBuilder private func content() -> some View {
        NavigationView {
            Text("")
                .navigationTitle("⚲ Location  ⌵")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: Button("Filter") {
                    self.showFilter.toggle()
                })
        }
        
        FilterView()
            .offset(y: showFilter ? 175 : 600)
//        ZStack {
//            Color.white.ignoresSafeArea()
//            Text(viewModel.text)
//                .padding(.bottom, 200)
//
//            VStack {
//                HStack {
//                    Button("Product details view", action: viewModel.transitToProductDetails)
////                        .padding(.horizontal, 50)
//                        .background(.yellow)
//                        .frame(width: 250)
//                    Button("Cart View", action: viewModel.transitToCart)
//                        .background(.pink)
//                        .frame(width: 250)
//                }
//            }
//        }
    }
}
