import Foundation

class DataStatisticsViewModel: ObservableObject {
	
	@Published private(set) var detailedCountryData: DetailedCountryData
	
	init(detailedCountryData: DetailedCountryData) {
		self.detailedCountryData = detailedCountryData
	}
	
	func fetchStateByCountry(country: String) {
		guard let url = URL(string: API_URL_STATISTICS + country) else { return }
		var request = URLRequest(url: url)
	
		request.httpMethod = "GET"
		request.addValue(API_HOST_STATISTICS, forHTTPHeaderField: "x-rapidapi-host")
		request.addValue(API_KEY, forHTTPHeaderField: "x-rapidapi-key")
		
		URLSession.shared.dataTask(with: request) { ( data, resp, err ) in
			DispatchQueue.main.async {
				if let result = data {
					if let json = try? JSONSerialization.jsonObject(with: result, options: []) as? [String:Any] {
						if let response = json["response"] as? [[String:Any]] {
							_ = response.compactMap {dictionary in
								let country = dictionary["country"] as? String
								let deaths = dictionary["deaths"] as? [String:Any]
								let tests = dictionary["tests"] as? [String:Any]
								let cases = dictionary["cases"] as? [String:Any]
								let day = dictionary["day"] as? String
								let time = dictionary["time"] as? String
								
								if let deathsDictionary = deaths {
									if let newDeaths = deathsDictionary["new"] as? String {
										self.detailedCountryData.newDeaths = Int64(newDeaths)
									}
									self.detailedCountryData.deaths = deathsDictionary["total"] as? Int64
								}
								
								if let testsDictionary = tests {
									self.detailedCountryData.testsDone = testsDictionary["total"] as? Int64
								}
								
								if let casesDictionary = cases {
									if let newCases = casesDictionary["new"] as? String {
										self.detailedCountryData.newCases = Int64(newCases)
									}
									self.detailedCountryData.criticalCases = casesDictionary["critical"] as? Int64
									self.detailedCountryData.confirmedCases = casesDictionary["total"] as? Int64
									self.detailedCountryData.activeCases = casesDictionary["active"] as? Int64
									self.detailedCountryData.recoveredCases = casesDictionary["recovered"] as? Int64
								}
								
								self.detailedCountryData.country = country
								self.detailedCountryData.day = day
								self.detailedCountryData.time = time								
							}
						}
					}
				}
			}
		}.resume()
	}
}
