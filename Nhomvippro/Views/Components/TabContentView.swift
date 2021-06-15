import SwiftUI

struct TabContentView : View {
	
	let imageName: String
	let text: String
	
	var body: some View {
		VStack {
			Image(systemName: imageName)
			Text(text)
		}
	}
	
}
