
import SwiftUI

struct ProductDetailsView<VM: ProductDetailsViewModelProtocol & ProductDetailsFlowStateProtocol>: View {

    @StateObject var viewModel: VM
    
    @Environment(\.presentationMode) var presentation

    var body: some View {
        ProductDetailsFlowCoordinator(state: viewModel, content: content)
    }

    @ViewBuilder private func content() -> some View {
        VStack {
            Text("")
                .frame(width: 300, height: 300)
                .background(AsyncImage(url: URL(string: "https://shop.gadgetufa.ru/images/upload/52534-smartfon-samsung-galaxy-s20-ultra-12-128-chernyj_1024.jpg")) { image in image.resizable() } placeholder: { Color.white })
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            Spacer()
            
            VStack {
                HStack {
                    Text("Galaxy Note 20 Ultra")
                        .font(.custom("Mark-Medium", size: 24))
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Image("heart")
                    }
                    .frame(width: 37, height: 37)
                    .background(Color(hex: 0x010035))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .padding()
                
                Text("★ ★ ★ ★ ★")
                    .frame(width: 340, height: 20, alignment: .leading)
                    .font(.custom("Mark-Regular", size: 20))
                    .foregroundColor(Color(hex: 0xFFB800))
                
                Spacer()
                
                HStack {
                    Text("Shop")
                        .foregroundColor(Color(hex: 0x010035))
                        .underline()
                    Spacer()
                    Text("Details")
                        .foregroundColor(Color.gray)
                    Spacer()
                    Text("Features")
                        .foregroundColor(Color.gray)
                }
                .padding()
                .font(.custom("Mark-Bold", size: 20))
                
                HStack {
                    VStack {
                        Image("feature")
                            .frame(width: 28, height: 28)
                        Text("Exynos 990")
                            .font(.custom("Mark-Regular", size: 11))
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    VStack {
                        Image("feature")
                            .frame(width: 28, height: 28)
                        Text("Exynos 990")
                            .font(.custom("Mark-Regular", size: 11))
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    VStack {
                        Image("feature")
                            .frame(width: 28, height: 28)
                        Text("Exynos 990")
                            .font(.custom("Mark-Regular", size: 11))
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    VStack {
                        Image("feature")
                            .frame(width: 28, height: 28)
                        Text("Exynos 990")
                            .font(.custom("Mark-Regular", size: 11))
                            .foregroundColor(.gray)
                    }
                }
                .padding()
                
                Text("Select color and capacity")
                    .frame(width: 340, height: 40, alignment: .leading)
                    .font(.custom("Mark-Regular", size: 16))
                    .foregroundColor(Color(hex: 0x010035))
                
                HStack {
                    Button(action: {
                        
                    }) {
                        Text("✓")
                            .font(.custom("Mark-Bold", size: 15))
                            .foregroundColor(.white)
                    }
                    .frame(width: 40, height: 40)
                    .background(Color(hex: 0x772D03))
                    .clipShape(Circle())
                    
                    Button(action: {
                        
                    }) {
                        Text("")
                    }
                    .frame(width: 40, height: 40)
                    .background(Color(hex: 0x010035))
                    .clipShape(Circle())
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        Text("128 GB")
                            .font(.custom("Mark-Bold", size: 15))
                            .foregroundColor(.white)
                    }
                    .frame(width: 75, height: 30)
                    .background(Color(hex: 0xFF6E4E))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    
                    Button(action: {
                        
                    }) {
                        Text("256 GB")
                            .font(.custom("Mark-Bold", size: 15))
                            .foregroundColor(.gray)
                    }
                    .frame(width: 75, height: 30)
                }
                .padding()
                
                Button(action: {
                    
                }) {
                    HStack {
                        Text("Add to cart")
                        Spacer()
                        Text("$1500.00")
                    }
                    .padding()
                    .font(.custom("Mark-Bold", size: 20))
                    .foregroundColor(.white)
                }
                .frame(width: 355, height: 54)
                .background(Color(hex: 0xFF6E4E))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Spacer()
            }
            .frame(width: 375, height: 450)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex: 0xF5F5F5))
        .navigationBarTitle("Product Details", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(trailing: Button(action: {
            
        }) {
            Image("location")
                .colorInvert()
                .frame(width: 37, height: 37)
                .background(Color(hex: 0xFF6E4E))
                .clipShape(RoundedRectangle(cornerRadius: 10))
        })
        .navigationBarItems(leading: Button(action: {
            self.presentation.wrappedValue.dismiss()
        }) {
            Image("back")
                .frame(width: 37, height: 37)
                .background(Color(hex: 0x010035))
                .clipShape(RoundedRectangle(cornerRadius: 10))
        })
        
    }
}
