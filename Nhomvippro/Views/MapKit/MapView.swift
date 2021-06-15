import SwiftUI
import UIKit
import MapKit

struct MapView: UIViewRepresentable {
	
	var countryData: [CountryData]
	
	func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
		var allAnnotations: [CovidCaseAnnotation] = []
		
		for item in countryData {
			let country = item.country ?? "Unknown"
			let confirmed = formatNumber(number: item.confirmed) ?? "Unknown"
			let deaths = formatNumber(number: item.deaths) ?? "Unknown"
			let latitude = item.latitude ?? 0.0
			let longitude = item.longitude ?? 0.0
			
			let title = country + "\n Confirmed " + confirmed + "\n Death " + deaths
			let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
			
			allAnnotations.append(CovidCaseAnnotation(title: title, coordinate: coordinate))
		}
		
		//	MARK: Remover as anotações antes
		uiView.annotations.forEach { uiView.removeAnnotation($0) }
		
		//	MARK: Adiciona minhas anotações no mapa
		uiView.addAnnotations(allAnnotations)
	}
	
	func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
		return MKMapView()
	}
	
}
