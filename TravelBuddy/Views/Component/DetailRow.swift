import SwiftUI

struct DetailRow: View {
    let title: String
    let value: String
    
    var body : some View {
        HStack {
            Text(title)
                .fontWeight(.semibold)
            
            Spacer()
            
            Text(value)
                .foregroundStyle(.gray)
        }
        .padding()
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
#Preview {
    DetailRow(title: "Budget", value: "15000")
}
