import SwiftUI

struct FooterView: View {
	
	var lastUpdate: String?
	
    var body: some View {
		HStack {
			Text(LABEL_LAST_UPDATE)
				.lineLimit(1)
				.minimumScaleFactor(0.7)
				.font(.subheadline)
				.padding()
			Spacer()
			Text(getLastUpdate(lastUpdate: lastUpdate))
				.lineLimit(1)
				.minimumScaleFactor(0.7)
				.font(.subheadline)
				.padding()
				.foregroundColor(.blue)
		}
		.background(Color("cardBackground"))
    }
	
	private func getLastUpdate(lastUpdate: String?) -> String {
		var dateFormatted = "Unknown"
		let formatter = DateFormatter()
		
		formatter.locale = Locale(identifier: "en_US_POSIX")
		formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssXXXXX"
		
		if let lastUpdate = lastUpdate {
			if let date = formatter.date(from: lastUpdate) {
				formatter.dateFormat = "dd/MM/yyy HH:mm:ss"
				dateFormatted = formatter.string(from: date)
			}
		}
		return dateFormatted
	}
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
		FooterView()
    }
}
