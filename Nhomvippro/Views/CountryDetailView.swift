import SwiftUI

struct CountryDetailView: View {
	
	@ObservedObject var viewModel: DataStatisticsViewModel
	var countryName: String
	
	init(viewModel: DataStatisticsViewModel, countryName: String) {
		self.viewModel = viewModel
		self.countryName = countryName
	}
	
    var body: some View {
		ScrollView {
			VStack {
				VStack {
					CountryDetailRowView(
						number: formatNumber(number: viewModel.detailedCountryData.confirmedCases) ?? "0",
						name: LABEL_CONFIRMED)
						.padding(.top)
					CountryDetailRowView(
						number: formatNumber(number: viewModel.detailedCountryData.activeCases) ?? "0",
						name: LABEL_ACTIVE_CASES)
					CountryDetailRowView(
						number: "+" + (formatNumber(number: viewModel.detailedCountryData.newCases) ?? "0"),
						name: LABEL_NEW_CASES)
					CountryDetailRowView(
						number: formatNumber(number: viewModel.detailedCountryData.recoveredCases) ?? "0",
						name: LABEL_RECOVERED_CASES,
						color: .green)
					CountryDetailRowView(
						number: formatNumber(number: viewModel.detailedCountryData.criticalCases) ?? "0",
						name: LABEL_CRITICAL_CASES,
						color: .yellow)
					CountryDetailRowView(
						number: formatNumber(number: viewModel.detailedCountryData.deaths) ?? "0",
						name: LABEL_DEATHS,
						color: .red)
					CountryDetailRowView(
						number: "+" + (formatNumber(number: viewModel.detailedCountryData.newDeaths) ?? "0"),
						name: LABEL_NEW_DEATHS,
						color: .red)
					CountryDetailRowView(
						number: "+" + (formatNumber(number: viewModel.detailedCountryData.testsDone) ?? "0"),
						name: LABEL_TESTS_DONE,
						color: .yellow)
					CountryDetailRowView(
						number: String(format: "%.2f", viewModel.detailedCountryData.fatalityRate) + "%",
						 name: LABEL_FATALITY_RATE,
						 color: .red)
					CountryDetailRowView(
						number: String(format: "%.2f", viewModel.detailedCountryData.recoveredRate) + "%",
						 name: LABEL_RECOVERED_RATE,
						 color: .green)
				}
				.background(Color("cardBackground"))
				.cornerRadius(4)
				.padding()
				
				Spacer()
			}
			.padding(.top, 20)
			.navigationBarTitle(countryName)
			.navigationBarBackButtonHidden(false)
			.onAppear() {
				//	Executa toda vez que a view aparece
				self.getStatistics()
			}
		}
		
		FooterView(lastUpdate: viewModel.detailedCountryData.time ?? "")
    }
	
	private func getStatistics() {
		self.viewModel.fetchStateByCountry(country: countryName.replacingOccurrences(of: " ", with: "-"))
	}
}
