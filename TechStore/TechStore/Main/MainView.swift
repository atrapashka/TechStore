
import SwiftUI

struct MainView<VM: MainViewModelProtocol & MainFlowStateProtocol>: View {

    @StateObject var viewModel: VM

    var body: some View {
        MainFlowCoordinator(state: viewModel, content: content)
    }

    @ViewBuilder private func content() -> some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Text("Location area")
                    .frame(width: 200, height: 30, alignment: .top)
                    .foregroundColor(.pink)
                    .font(.custom("Mark-Light", size: 30))
            }
//            .padding()

            VStack {
                Text(viewModel.text)
                
                
                Button("Product details view --->", action: viewModel.transitToProductDetails)
                Button("Cart View --->", action: viewModel.transitToCart)
            }
        }
//        .navigationBarTitle("Title", displayMode: .inline)
        .navigationBarHidden(true)
    }
}
