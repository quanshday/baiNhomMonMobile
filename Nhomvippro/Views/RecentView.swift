import SwiftUI

struct RecentView: View {
	
	@ObservedObject var viewModel: DataViewModel
	@ObservedObject var statisticsViewModel: DataStatisticsViewModel
	@State var searchText = ""
	@State var isSearchVisible = false
		
	init(viewModel: DataViewModel, statisticsViewModel: DataStatisticsViewModel) {
		self.viewModel = viewModel
		self.statisticsViewModel = statisticsViewModel
	}
	
    var body: some View {
		NavigationView {
			VStack {
				if isSearchVisible {
					SearchView(searchText: $searchText)
				}
				
				CardView(
					worldData: viewModel.worldData.first ?? WorldData())
				
				HeaderView()
				
				List {
					ForEach(viewModel.countryData.filter {
						self.searchText.isEmpty ? true :
						$0.country!.lowercased().contains(self.searchText.lowercased())
					}, id: \.country) { countryData in
						NavigationLink(destination: CountryDetailView(viewModel: .init(detailedCountryData: .init()), countryName: countryData.country ?? "Unknown")) {
							CountryDataRowView(country: countryData)
						}
					}
				}.listStyle(PlainListStyle())
				
				FooterView(lastUpdate: viewModel.worldData.first?.lastUpdate ?? WorldData().lastUpdate)
			}
			.navigationBarTitle("COVID-19 State", displayMode: .inline)
			.navigationBarItems(
				trailing: Button(
					action: {
						self.isSearchVisible.toggle()
						if !self.isSearchVisible {
							self.searchText = ""
						}
					}, label: {
						Image(systemName: "magnifyingglass")
					}))
		}
	}
}

struct RecentView_Previews: PreviewProvider {
    static var previews: some View {
		RecentView(viewModel: .init(), statisticsViewModel: .init(detailedCountryData: .init())).colorScheme(.dark)
    }
}
