import SwiftUI

struct SearchView: View {
	
	@Binding var searchText: String
	
    var body: some View {
		HStack {
			TextField(LABEL_SEARCH_COUNTRY, text: $searchText).padding()
		}
		.frame(height: 50)
		.background(Color("cardBackground"))
    }
}
