import SwiftUI
import UIKit
import MapKit
import Foundation

class CovidCaseAnnotation: NSObject, MKAnnotation {
	
	let title: String?
	let coordinate: CLLocationCoordinate2D
	
	init(title: String?, coordinate: CLLocationCoordinate2D) {
		self.title = title
		self.coordinate = coordinate
	}
	
}
