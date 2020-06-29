//
//  HomeView.swift
//  DesignCode-SwiftUI-01
//
//  Created by king on 2020/6/29.
//

import SwiftUI

struct HomeView: View {
	@Binding var showProfile: Bool
	@State var showUpdate = false

	var body: some View {
		VStack {
			HStack {
				Text("Watching")
					.font(.system(size: 28, weight: .bold))

				Spacer()

				AvatarView(showProfile: $showProfile)

				Button(
					action: { self.showUpdate.toggle() },
					label: {
						Image(systemName: "bell")
							.renderingMode(.original)
							.font(.system(size: 16, weight: .medium))
							.frame(width: 36, height: 36)
							.background(Color.white)
							.clipShape(Circle())
							.shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
							.shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
					}
				)
				.sheet(isPresented: $showUpdate) {
					UpdateList()
				}
			}
			.padding(.horizontal)
			.padding(.leading, 14)
			.padding(.top, 30)

			ScrollView(.horizontal, showsIndicators: false) {
				HStack(spacing: 30) {
					ForEach(sectionData) { section in
						GeometryReader {
							SectionView(section: section)
								.rotation3DEffect(
									.degrees(Double(($0.frame(in: .global).minX - 30) / -20)),
									axis: (x: 0.0, y: 10.0, z: 0.0)
								)
						}
						.frame(width: 275, height: 275)
					}
				}
				.padding(30)
				.padding(.bottom, 30)
			}

			Spacer()
		}
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView(showProfile: .constant(false))
	}
}

struct SectionView: View {
	var section: Section

	var body: some View {
		VStack {
			HStack(alignment: .top) {
				Text(section.tittle)
					.font(.system(size: 24, weight: .bold))
					.frame(width: 160, alignment: .leading)
					.foregroundColor(.white)

				Spacer()

				Image(section.logo)
			}

			Text(section.text.uppercased())
				.frame(maxWidth: .infinity, alignment: .leading)

			section.image
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 210)
		}
		.padding(.top, 20)
		.padding(.horizontal, 20)
		.frame(width: 275, height: 275)
		.background(section.color)
		.clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
		.shadow(color: section.color.opacity(0.3), radius: 20, x: 0, y: 20)
	}
}

struct Section: Identifiable {
	var id = UUID()
	var tittle: String
	var text: String
	var logo: String
	var image: Image
	var color: Color
}

let sectionData = [
	Section(tittle: "Prototype design in SwiftUI", text: "18 Section", logo: "Logo1", image: Image("Card4"), color: Color("card1")),
	Section(tittle: "Build a SwiftUI app", text: "20 Section", logo: "Logo1", image: Image("Card3"), color: Color("card2")),
	Section(tittle: "SwiftUI Advanced", text: "20 Section", logo: "Logo1", image: Image("Card2"), color: Color("card3"))
]
