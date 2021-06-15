import SwiftUI

struct HeaderView: View {
    var body: some View {
		HStack {
			TextHeaderView(headerName: LABEL_COUNTRY)
				.frame(width: 100, height: 40, alignment: .leading)
				.padding(.leading, 10)
			Spacer()
			TextHeaderView(headerName: LABEL_HEADER_CONFIRMED)
				.frame(height: 50, alignment: .trailing)
			Spacer()
			TextHeaderView(headerName: LABEL_DEATHS)
				.frame(height: 50, alignment: .trailing)
			Spacer()
			TextHeaderView(headerName: LABEL_HEADER_RECOVERED)
				.frame(height: 50, alignment: .trailing)
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
