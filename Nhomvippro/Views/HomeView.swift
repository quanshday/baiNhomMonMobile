import SwiftUI

struct HomeView: View {
	
    var body: some View {
		TabView {
			RecentView(viewModel: .init(), statisticsViewModel: .init(detailedCountryData: .init()))
				.tabItem {
					TabContentView(imageName: "chart.bar", text: LABEL_TAB_RECENT)
				}
				.tag(0)
			MapContainerView(viewModel: .init())
				.edgesIgnoringSafeArea(.vertical)
				.tabItem {
					TabContentView(imageName: "map", text: LABEL_TAB_MAP)
				}
				.tag(1)
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		HomeView().colorScheme(.dark)
    }
}
