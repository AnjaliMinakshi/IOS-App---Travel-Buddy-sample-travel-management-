import SwiftUI

struct CustomTextField: View {
    
    let title: String
    @Binding var text: String
    
    var body: some View {
        TextField(title, text: $text)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .autocapitalization(.none)
    }
}

#Preview {
    CustomTextField(title: "Email", text: .constant(""))
        .padding()
}
