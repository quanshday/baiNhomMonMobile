import Foundation

extension Double {
	
	func fatalityRate(_ deaths: Double, _ confirmed: Double) -> Double {
		return (100.00 * deaths) / confirmed
	}
	
	func recoveredRate(_ recovered: Double, _ confirmed: Double) -> Double{
		return (100.00 * recovered) / confirmed
	}
	
}
