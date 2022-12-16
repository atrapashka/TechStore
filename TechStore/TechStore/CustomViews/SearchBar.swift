
import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    @State private var isEditing = false
    
    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .padding()
                .background(.white)
                .cornerRadius(50)
                .font(.custom("Mark-Light", size: 12))
            Spacer()
            Button(action: {
                print("Scan QR")
            }) {
                Image("qr")
            }
            .frame(width: 50, height: 50)
            .background(Color(hex: 0xFF6E4E))
            .clipShape(RoundedRectangle(cornerRadius: 25,
                                        style: .continuous))
        }
        .padding()
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}
