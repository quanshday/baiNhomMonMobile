import SwiftUI

struct TextHeaderView: View {
	
	let headerName: String
	
    var body: some View {
		Text(headerName)
			.fontWeight(.bold)
			.font(.subheadline)
			.lineLimit(1)
    }
}

struct TextHeaderComponent_Previews: PreviewProvider {
    static var previews: some View {
		TextHeaderView(headerName: "")
    }
}
