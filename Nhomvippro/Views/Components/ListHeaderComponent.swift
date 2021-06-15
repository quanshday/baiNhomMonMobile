import SwiftUI

struct HeaderView: View {
    var body: some View {
		HStack {
			TextHeaderView(headerName: "Country")
				.frame(width: 100, height: 40, alignment: .leading)
				.padding(.leading, 10)
			Spacer()
			TextHeaderView(headerName: "Confirmed")
				.frame(height: 40, alignment: .trailing)
			Spacer()
			TextHeaderView(headerName: "Death")
				.frame(height: 40, alignment: .trailing)
				.padding(.trailing, 10)
		}
		.background(Color("cardBackground"))
		.padding(10)
    }
}

struct ListHeaderComponent_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
