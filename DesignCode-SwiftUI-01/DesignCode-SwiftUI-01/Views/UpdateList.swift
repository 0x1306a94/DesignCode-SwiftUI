//
//  UpdateList.swift
//  DesignCode-SwiftUI-01
//
//  Created by king on 2020/6/29.
//

import SwiftUI

struct UpdateList: View {
	@ObservedObject var store = UpdateStore()

	var body: some View {
		NavigationView {
			List {
				ForEach(store.updates) { update in
					NavigationLink(destination: UpdateDetail(update: update)) {
						UpdateRowView(update: update)
					}
				}
				.onDelete { indexSet in
					guard let index = indexSet.first else { return }
					self.store.updates.remove(at: index)
				}
				.onMove { indecies, newOffset in
					self.store.updates.move(fromOffsets: indecies, toOffset: newOffset)
				}
			}
			.navigationBarTitle(
				Text("Updates")
			)
			.navigationBarItems(leading: Button(action: addUpdate) {
				Text("Add Update")
			}, trailing: EditButton())
		}
	}

	func addUpdate() {
		store.updates.append(Update(image: "Card1", title: "New item", text: "textdttahakfja", date: "Jan 1"))
	}
}

struct UpdateList_Previews: PreviewProvider {
	static var previews: some View {
		UpdateList()
	}
}

struct Update: Identifiable {
	var id = UUID()
	var image: String
	var title: String
	var text: String
	var date: String
}

let updateData = [
	Update(image: "Card1", title: "SwiftUI Advance", text: "SwiftUI Advance SwiftUI Advance Text SwiftUI Advance SwiftUI Advance Text SwiftUI Advance SwiftUI Advance Text", date: "Jun 1"),
	Update(image: "Card2", title: "Webflow", text: "Webflow Webflow Webflow WebflowText Webflow Webflow Webflow WebflowText Webflow Webflow Webflow WebflowText Webflow Webflow Webflow WebflowText", date: "Jun 2"),
	Update(image: "Card3", title: "ProtoPie", text: "ProtoPie ProtoPie ProtoPie ProtoPieText", date: "Jun 3"),
	Update(image: "Card4", title: "SwiftUI", text: "SwiftUI SwiftUI SwiftUI SwiftUI Text SwiftUI Advance SwiftUI Advance Text", date: "Jun 3"),
	Update(image: "Card5", title: "Framer Playground", text: "Framer Playground Framer Playground Text", date: "Jun 4")
]

struct UpdateRowView: View {
	var update: Update

	var body: some View {
		HStack {
			Image(update.image)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 80, height: 80)
				.background(Color.black)
				.clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
				.padding(.trailing, 4)

			VStack(alignment: .leading, spacing: 8) {
				Text(update.title)
					.font(.system(size: 20, weight: .bold))

				Text(update.text)
					.lineLimit(2)
					.font(.subheadline)
					.foregroundColor(Color(#colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)))

				Text(update.date)
					.font(.caption)
					.fontWeight(.bold)
					.foregroundColor(.secondary)
			}
		}
		.padding(.vertical, 8)
	}
}
