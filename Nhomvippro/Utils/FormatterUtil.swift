import Foundation

func formatNumber(number: Int64?) -> String? {
	let formatter = NumberFormatter()
	formatter.groupingSeparator = "."
	formatter.numberStyle = .decimal
	return formatter.string(from: NSNumber(value: number ?? 0))
}
