
import SwiftUI

struct MainView<VM: MainViewModelProtocol & MainFlowStateProtocol>: View {

    @StateObject var viewModel: VM
    @State var showFilter = false
    @State var selected = 0
    @State var categories = ["Phones", "Computers", "Health", "Books", "Travel", "Auto"]
    @State var info = [HomeStore]()
    @State var bestInfo = [BestSeller]()
    
    let layout = [GridItem(.flexible(maximum: 80))]
    let layoutBest = [GridItem(.adaptive(minimum: 145))]

    var body: some View {
        
        MainFlowCoordinator(state: viewModel, content: content)
    }

    @ViewBuilder private func content() -> some View {
        
        VStack {
            
            ScrollView(.vertical) {
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
                    
                    HStack {
                        ScrollView(.horizontal) {
                            LazyHGrid(rows: layout, spacing: 20) {
                                ForEach(info, id: \.id) { item in
                                    VStack {
                                        if item.isNew == true {
                                            Text("NEW")
                                                .underline()
                                                .frame(width: 27, height: 27)
                                                .font(.custom("Mark-Bold", size: 10))
                                                .foregroundColor(Color(hex: 0xFFFFFF))
                                                .background(Color(hex: 0xFF6E4E))
                                                .clipShape(Circle())
                                        } else {
                                            Text("")
                                                .frame(width: 27, height: 27)
                                                .background(Color.clear)
                                                .clipShape(Circle())
                                        }
                                        
                                        Spacer()
                                        
                                        Text(item.title)
                                            .foregroundColor(Color(hex: 0xFFFFFF))
                                            .font(.custom("Mark-Bold", size: 25))
                                            .underline()
                                        Text(item.subtitle)
                                            .foregroundColor(Color(hex: 0xFFFFFF))
                                            .font(.custom("Mark-Regular", size: 11))
                                            .underline()
                                        
                                        Spacer()
                                        
                                        Button(action: {
                                            
                                        }) {
                                            Text("Buy now!")
                                                .font(.custom("Mark-Bold", size: 11))
                                                .foregroundColor(Color(hex: 0x010035))
                                                .underline()
                                        }
                                        .frame(width: 98, height: 23)
                                        .background(Color(hex: 0xFFFFFF))
                                        .clipShape(RoundedRectangle(cornerRadius: 5))
                                    }
                                    .padding()
                                    .frame(width: 378, height: 182, alignment: .leading)
                                    .background(AsyncImage(url: URL(string: item.picture)) { image in image.resizable() } placeholder: { Color.gray })
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                }
                            }
                            .padding(.horizontal)
                            .task {
                                await loadHomeStoreData()
                            }
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
                        LazyVGrid(columns: layoutBest, spacing: 20) {
                            ForEach(bestInfo, id: \.id) { item in
                                VStack {
                                    Text("")
                                    .frame(width: 181, height: 181)
                                    .background(AsyncImage(url: URL(string: item.picture)) { image in image.resizable() } placeholder: { Color.gray })
                                    HStack {
                                        Text("$\(item.discountPrice)")
                                            .font(.custom("Mark-Bold", size: 16))
                                        Text("$\(item.priceWithoutDiscount)")
                                            .font(.custom("Mark-Medium", size: 10))
                                            .foregroundColor(.gray)
                                    }
                                    Text(item.title)
                                        .font(.custom("Mark-Regular", size: 10))
                                    Spacer()
                                }
                                .background(Color(hex: 0xFFFFFF))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .onTapGesture {
                                    viewModel.transitToProductDetails()
                                }
                            }
                        }
                        .padding(.horizontal)
                        .task {
                            await loadBestSellerData()
                        }
                    }
                }
                
                Spacer(minLength: 135)
            }

            
        }
        .background(Color(hex: 0xF5F5F5))
        .navigationBarTitle("⚲ Zihuatanejo, Gro  ⌵", displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            self.showFilter.toggle()
        }) {
            Image("filter")
        })
        
        VStack() {
            
            Spacer()
            
            VStack() {
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
        }

        FilterView()
            .offset(y: showFilter ? 185 : 700)
            .animation(.spring(response: 0.5,
                               dampingFraction: 0.6,
                               blendDuration: 0))
    }
    
    func loadHomeStoreData() async {
        guard let url = URL(string: "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            
            if let decodedResponce = try? decoder.decode(ProductInfoResponse.self, from: data) {
                info = decodedResponce.homeStore
            }
        } catch {
            print("Invalid data")
        }
    }
    
    func loadBestSellerData() async {
        guard let url = URL(string: "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            
            if let decodedResponce = try? decoder.decode(ProductInfoResponse.self, from: data) {
                bestInfo = decodedResponce.bestSeller
            }
        } catch {
            print("Invalid data")
        }
    }
}
