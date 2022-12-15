
import SwiftUI

struct MainView<VM: MainViewModelProtocol & MainFlowStateProtocol>: View {

    @StateObject var viewModel: VM
    @State var showFilter = false
    @State var selected = 0
    @State var categories = ["Phones", "Computers", "Health", "Books", "Travel", "Auto"]
    let layout = [GridItem(.flexible(maximum: 80))]

    var body: some View {
        
        MainFlowCoordinator(state: viewModel, content: content)
    }

    @ViewBuilder private func content() -> some View {
        
        VStack() {
            
            Group {
                
                HStack {
                    Text("Select Category")
                        .font(.custom("Mark-Bold", size: 25))
                    Spacer()
                    Text("view all")
                        .foregroundColor(Color(hex: 0xFF6E4E))
                        .font(.custom("Mark-Light", size: 15))
                }
                .padding()

                HStack {
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: layout, spacing: 20) {
                            ForEach(categories, id: \.self) { item in
                                VStack {
                                    Image(item)
                                        .frame(width: 71, height: 71)
                                        .background(Color(hex: 0xFF6E4E))
                                        .clipShape(RoundedRectangle(cornerRadius: 35.5, style: .continuous))
                                    Text(item)
                                        .foregroundColor(.black)
                                        .font(.custom("Mark-Regular", size: 12))
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .frame(height: 100)

                HStack {
                    SearchBar(text: .constant(""))
                }
                .frame(height: 50)
            }
            
            Group {
                HStack {
                    Text("Hot Sales")
                        .font(.custom("Mark-Bold", size: 25))
                    Spacer()
                    Text("see more")
                        .foregroundColor(Color(hex: 0xFF6E4E))
                        .font(.custom("Mark-Light", size: 15))
                }
                .padding()
                
                
//                ZStack {
//                    Text("CAROUSEL")
//                }
//                .frame(maxWidth: .infinity)
//                .frame(height: 150)
////                .padding(.horizontal)
//                .background(.pink)
                
                HStack {
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: layout, spacing: 20) {
                            ForEach(categories, id: \.self) { item in
                                VStack {
                                    Text(item)
                                        .frame(width: 360, height: 150)
                                        .foregroundColor(.black)
                                        .background(.red)
                                        .font(.custom("Mark-Regular", size: 20))
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }

                HStack {
                    Text("Best Seller")
                        .font(.custom("Mark-Bold", size: 25))
                    Spacer()
                    Text("see more")
                        .foregroundColor(Color(hex: 0xFF6E4E))
                        .font(.custom("Mark-Light", size: 15))
                }
                .padding()

                HStack {
                    Text("COLLECTION VIEW")
                }
            }
//            .padding()
            
            Spacer()

            ZStack {
                HStack {
                    Spacer()
                    Text("●  Explore")
                        .foregroundColor(.white)
                        .font(.custom("Mark-Medium", size: 18))
                    Spacer()
                    Button(action: {
                        viewModel.transitToCart()
                    }) {
                        Image("cart")
                    }
                    Spacer()
                    Button(action: {
//                        viewModel.transitToCart()
                    }) {
                        Image("favorite")
                    }
                    Spacer()
                    Button(action: {
//                        viewModel.transitToCart()
                    }) {
                        Image("user")
                    }
                    Spacer()
                }
                .padding()
                .padding(.vertical, 10)
                .frame(height: 72, alignment: .bottom)
            }
            .padding()
            .background(Color(hex: 0x010035))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            
//            Spacer()
        }
        .background(Color(hex: 0xF5F5F5))
        .navigationBarTitle("⚲ Zihuatanejo, Gro  ⌵", displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            self.showFilter.toggle()
        }) {
            Image("filter")
        })
        
        FilterView()
            .offset(y: showFilter ? 175 : 600)
            .animation(.spring(response: 0.5,
                               dampingFraction: 0.6,
                               blendDuration: 0))
    }
}
