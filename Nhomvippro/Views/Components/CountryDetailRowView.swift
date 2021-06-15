import SwiftUI

struct CountryDetailRowView: View {
	
	var number: String = "0.00"
	var name: String = "Confirmed"
	var color: Color = .primary
	
    var body: some View {
		VStack {
			HStack {
				Text(self.name)
					.font(.body)
					.padding(5)
				Spacer()
				Text(self.number)
					.font(.subheadline)
					.padding(5)
					.foregroundColor(self.color)
			}
			Divider()
		}
		.padding(.leading)
		.padding(.trailing)
    }
}

struct CountryDetailRowView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailRowView()
    }
}
