import SwiftUI

struct TotalDataCardView: View {
	
	var number: String = "Err"
	var name: String = "Confirmed"
	var color: Color = .primary
	
    var body: some View {
		GeometryReader { geometry in
			VStack {
				Text(self.number)
					.lineLimit(1)
					.minimumScaleFactor(0.7)
					.font(.subheadline)
					.padding(5)
					.foregroundColor(self.color)
				Text(self.name)
					.lineLimit(1)
					.minimumScaleFactor(0.7)
					.font(.body)
					.padding(.leading, 10)
					.padding(.trailing, 10)
					.foregroundColor(self.color)
			}
			.frame(width: geometry.size.width, height: 80.0, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
			.background(Color("cardBackground"))
			.cornerRadius(4.0)
		}
    }
}

struct TotalDataCard_Previews: PreviewProvider {
    static var previews: some View {
		TotalDataCardView()
    }
}
