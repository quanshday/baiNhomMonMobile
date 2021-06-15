import Foundation

struct WorldData: Identifiable, Decodable {
	
	let id = UUID()
	var confirmed: Int64?
	var critical: Int64?
	var deaths: Int64?
	var recovered: Int64?
	var lastChange: String?
	var lastUpdate: String?
	
}

extension WorldData {
	
	var fatalityRate: Double {
		guard let deaths = deaths else { return 0.0 }
		guard let confirmed = confirmed else { return 0.0 }
		return (100.00 * Double(deaths)) / Double(confirmed)
	}
	
	var recoveredRate: Double {
		guard let recovered = recovered else { return 0.0 }
		guard let confirmed = confirmed else { return 0.0 }
		return (100.00 * Double(recovered)) / Double(confirmed)
	}
	
}
