import Foundation

class DataViewModel : ObservableObject {
	
	@Published private(set) var worldData: [WorldData]
	@Published private(set) var countryData: [CountryData]
	
	init(worldData: [WorldData] = .init(), countryData: [CountryData] = .init()) {
		self.worldData = worldData
		self.countryData = countryData
		self.fetchWorldTotals()
		self.fetchAllCountriesTotals()
	}
	
	//	MARK: Busca da API os totais mundiais
	func fetchWorldTotals() {
		guard let url = URL(string: API_URL_WORLD) else { return }
		var request = URLRequest(url: url)
		
		request.httpMethod = "GET"
		request.addValue(API_HOST, forHTTPHeaderField: "x-rapidapi-host")
		request.addValue(API_KEY, forHTTPHeaderField: "x-rapidapi-key")
		
		URLSession.shared.dataTask(with: request) { ( data, resp, err ) in
			DispatchQueue.main.async {
				if let result = data {
					self.worldData = try! JSONDecoder().decode([WorldData].self, from: result)
				}
			}
		}.resume()
	}
	
	//	MARK: Busca da API os totais dos paises
	func fetchAllCountriesTotals() {
		guard let url = URL(string: API_URL_COUNTRIES) else { return }
		var request = URLRequest(url: url)
		
		request.httpMethod = "GET"
		request.addValue(API_HOST, forHTTPHeaderField: "x-rapidapi-host")
		request.addValue(API_KEY, forHTTPHeaderField: "x-rapidapi-key")
		
		URLSession.shared.dataTask(with: request) { ( data, resp, err ) in
			DispatchQueue.main.async {
				if let result = data {
					self.countryData = try! JSONDecoder().decode([CountryData].self, from: result)
					self.countryData = self.countryData.sorted(by: { $0.confirmed! > $1.confirmed! })
				}
			}
		}.resume()
	}
}
