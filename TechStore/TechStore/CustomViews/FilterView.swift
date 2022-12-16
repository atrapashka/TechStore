//
//  FilterView.swift
//  TechStore
//
//  Created by Alehandro on 14.12.22.
//

import SwiftUI

struct FilterView: View {
    
    @State private var brand = "Select Brand"
    
    static let brands = ["Apple", "Samsung", "Sony"]
    static let prices = ["200 - 300", "400 - 500", "600 - 700"]
    static let sizes = ["4.5 - 5.4", "5.5 - 6.4", "6.5 - 7.4"]
    
    var body: some View {
        VStack {
            HStack {
                Button("✕") {
                    
                }
                .frame(width: 37, height: 37)
                .background(Color(hex: 0x010035))
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                Spacer()
                Text("Filter Options")
                Spacer()
                Button("Done") {
                    
                }
                .frame(width: 86, height: 37)
                .background(Color(hex: 0xFF6E4E))
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            }
            .font(.custom("Mark-Medium",
                      size: 18))
            .padding()
            Form {
                Text("Brand")
                Picker("Select brand", selection: $brand) {
                    ForEach(FilterView.brands, id: \.self) {
                        Text($0)
                    }
                }
                Text("Price")
                Picker("Choose price", selection: $brand) {
                    ForEach(FilterView.prices, id: \.self) {
                        Text($0)
                    }
                }
                Text("Size")
                Picker("Screen size", selection: $brand) {
                    ForEach(FilterView.sizes, id: \.self) {
                        Text($0)
                    }
                }
            }
            .font(.custom("Mark-Regular",
                          size: 18))
            .frame(maxWidth: .infinity)
        }
        .background(.white)
        .frame(maxWidth: .infinity)
        .frame(height: 400)
        .clipShape(RoundedRectangle(cornerRadius: 30,
                                    style: .continuous))
        .shadow(radius: 30)
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}

// ебануть 2 скролл вью для итемсов и бест селлера
