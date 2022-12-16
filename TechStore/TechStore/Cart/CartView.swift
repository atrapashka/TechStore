
import SwiftUI

struct CartView<VM: CartViewModelProtocol & CartFlowStateProtocol>: View {

    @StateObject var viewModel: VM
    
    @Environment(\.presentationMode) var presentation

    var body: some View {
        CartFlowCoordinator(state: viewModel, content: content)
    }

    @ViewBuilder private func content() -> some View {
        VStack {
            HStack {
                Button(action: {
                    self.presentation.wrappedValue.dismiss()
                }) {
                    Image("back")
                }
                .frame(width: 37, height: 37)
                .background(Color(hex: 0x010035))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Spacer()
                
                Text("Add adress")
                    .font(.custom("Mark-Regular", size: 15))
                
                Button(action: {
                    
                }) {
                    Image("location")
                        .colorInvert()
                }
                .frame(width: 37, height: 37)
                .background(Color(hex: 0xFF6E4E))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding()
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text("My Cart")
                    .font(.custom("Mark-Bold", size: 35))
                    .foregroundColor(Color(hex: 0x010035))
                    .frame(width: 300, height: 50, alignment: .leading)
            }
            
            Spacer()
            
            VStack {
                
                Spacer()
                
                VStack {
                    HStack {
                        Text("")
                            .frame(width: 89, height: 89)
                            .background(AsyncImage(url: URL(string: "https://shop.gadgetufa.ru/images/upload/52534-smartfon-samsung-galaxy-s20-ultra-12-128-chernyj_1024.jpg")) { image in image.resizable() } placeholder: { Color.gray })
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            Text("Galaxy Note 20 Ultra")
                                .foregroundColor(.white)
                            Text("$3000.00")
                                .foregroundColor(Color(hex: 0xFF6E4E))
                        }
                        .font(.custom("Mark-Bold", size: 20))
                        
                        Spacer()
                        
                        VStack {
                            Button("-") {
                                
                            }
                            Text("2")
                            Button("+") {
                                
                            }
                        }
                        .frame(width: 26, height: 75)
                        .background(Color(hex: 0x282843))
                        .font(.custom("Mark-Bold", size: 20))
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 26))
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    
                    HStack {
                        Text("")
                            .frame(width: 89, height: 89)
                            .background(AsyncImage(url: URL(string: "https://shop.gadgetufa.ru/images/upload/52534-smartfon-samsung-galaxy-s20-ultra-12-128-chernyj_1024.jpg")) { image in image.resizable() } placeholder: { Color.gray })
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            Text("Galaxy Note 20 Ultra")
                                .foregroundColor(.white)
                            Text("$3000.00")
                                .foregroundColor(Color(hex: 0xFF6E4E))
                        }
                        .font(.custom("Mark-Bold", size: 20))
                        
                        Spacer()
                        
                        VStack {
                            Spacer()
                            Button("-") {
                                
                            }
                            Text("2")
                            Button("+") {
                                
                            }
                            Spacer()
                        }
                        .frame(width: 26, height: 75)
                        .background(Color(hex: 0x282843))
                        .font(.custom("Mark-Bold", size: 20))
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 26))
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                }
                
                Spacer()
                Divider()
                    .background(.white)
                
                VStack {
                    HStack {
                        Text("Total")
                        Spacer()
                        Text("$6000")
                    }
                    
                    HStack {
                        Text("Delivery")
                        Spacer()
                        Text("Free")
                    }
                }
                .padding()
                .font(.custom("Mark-Bold", size: 15))
                .foregroundColor(Color(hex: 0xFFFFFF))
                .padding()
                
                Divider()
                    .background(.white)
                Spacer()
                
                Button(action: {
                    
                }) {
                    Text("Checkout")
                        .font(.custom("Mark-Bold", size: 15))
                        .foregroundColor(Color(hex: 0xFFFFFF))
                }
                .frame(width: 326, height: 54)
                .background(Color(hex: 0xFF6E4E))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 600)
            .background(Color(hex: 0x010035))
            .clipShape(RoundedRectangle(cornerRadius: 30))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex: 0xFFFFFF))
    }
}
