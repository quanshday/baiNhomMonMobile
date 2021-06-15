import SwiftUI

struct TextRowView: View {
	
	let text: String
	
    var body: some View {
		Text(text)
			.fontWeight(.medium)
			.font(.system(size: 14))
    }
}

struct TextRowView_Previews: PreviewProvider {
    static var previews: some View {
        TextRowView(text: "5,9000")
    }
}
