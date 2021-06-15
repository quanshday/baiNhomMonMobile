import Foundation

struct DetailedCountryData {
	
	var country: String?
	var deaths: Int64?
	var newDeaths: Int64?
	var testsDone: Int64?
	var criticalCases: Int64?
	var confirmedCases: Int64?
	var recoveredCases: Int64?
	var activeCases: Int64?
	var newCases: Int64?
	var day: String?
	var time: String?
	
}

extension DetailedCountryData {

	var fatalityRate: Double {
		guard let deaths = deaths else { return 0.0 }
		guard let confirmed = confirmedCases else { return 0.0 }
		return (100.00 * Double(deaths)) / Double(confirmed)
	}

	var recoveredRate: Double {
		guard let recovered = recoveredCases else { return 0.0 }
		guard let confirmed = confirmedCases else { return 0.0 }
		return (100.00 * Double(recovered)) / Double(confirmed)
	}

}
