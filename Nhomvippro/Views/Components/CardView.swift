import SwiftUI

struct CardView: View {
	
	var worldData: WorldData
	
	init(worldData: WorldData) {
		self.worldData = worldData
	}
	
    var body: some View {
		VStack {
			HStack {
				TotalDataCardView(
					number: formatNumber(number: worldData.confirmed) ?? "-",
					name: LABEL_CONFIRMED)
				TotalDataCardView(
					number: formatNumber(number: worldData.critical) ?? "-",
					name: LABEL_CRITICAL,
					color: .yellow)
				TotalDataCardView(
					number: formatNumber(number: worldData.deaths) ?? "-",
					name: LABEL_DEATHS,
					color: .red)
			}
			HStack {
				TotalDataCardView(
					number: String(format: "%.2f", worldData.fatalityRate),
					name: LABEL_DEATHS + " %",
					color: .red)
				TotalDataCardView(
					number: formatNumber(number: worldData.recovered) ?? "-",
					name: LABEL_RECOVERED,
					color: .green)
				TotalDataCardView(
					number: String(format: "%.2f", worldData.recoveredRate),
					name: LABEL_RECOVERED + " %",
					color: .green)
			}
		}
		.frame(height: 170)
		.padding(10)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
		CardView(worldData: .init())
    }
}
