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
    
    var body: some View {
        VStack {
            HStack {
                Button("Close") {
                    
                }
                Text("Filter Options")
                    
                Button("Filter Close") {
                    
                }
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
                    ForEach(FilterView.brands, id: \.self) {
                        Text($0)
                    }
                }
                Text("Size")
                Picker("Screen size", selection: $brand) {
                    ForEach(FilterView.brands, id: \.self) {
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
