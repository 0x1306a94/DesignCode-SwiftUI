//
//  ContentView.swift
//  DesignCode-SwiftUI-01
//
//  Created by king on 2020/6/28.
//

import UIKit
import SwiftUI

struct ContentView: View {
	@State var show = false
	@State var viewState = CGSize.zero

	var body: some View {
		ZStack {
			TitleView()
				.background(Color.white)
				.blur(radius: show ? 20 : 0)
				.animation(.default)

			BackgroundCardView()
				.frame(width: 320, height: 220)
				.background(show ? Color("card3") : Color("card4"))
				.cornerRadius(20)
				.shadow(radius: 20)
				.offset(x: 0, y: show ? -400 : -40)
				.offset(x: viewState.width, y: viewState.height)
				.scaleEffect(0.9)
				.rotationEffect(.degrees(show ? 0 : 10))
				.rotation3DEffect(
					.degrees(10),
					axis: (x: 10.0, y: 0.0, z: 0.0)
				)
				.blendMode(.hardLight)
				.animation(.easeInOut(duration: 0.5))

			BackgroundCardView()
				.frame(width: 320, height: 220)
				.background(show ? Color("card4") : Color("card3"))
				.cornerRadius(20)
				.shadow(radius: 20)
				.offset(x: 0, y: show ? -200 : -20)
				.offset(x: viewState.width, y: viewState.height)
				.scaleEffect(0.95)
				.rotationEffect(.degrees(show ? 0 : 5))
				.rotation3DEffect(
					.degrees(5),
					axis: (x: 10.0, y: 0.0, z: 0.0)
				)
				.blendMode(.hardLight)
				.animation(.easeInOut(duration: 0.3))

			CardView()
				.frame(width: 340, height: 220)
				.background(Color.black)
				.cornerRadius(20)
				.shadow(radius: 20)
				.offset(x: viewState.width, y: viewState.height)
				.blendMode(.hardLight)
				.animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
				.onTapGesture {
					self.show.toggle()
				}
				.gesture(
					DragGesture()
						.onChanged {
							self.viewState = $0.translation
							self.show = true
						}
						.onEnded { _ in
							self.viewState = CGSize.zero
							self.show = false
						}
				)

			ButtomCardView()
				.offset(x: 0, y: UIScreen.main.bounds.height * 0.7)
				.blur(radius: show ? 20 : 0)
				.animation(.default)

		}
	}
}

struct TitleView: View {
	var body: some View {
		VStack {
			HStack {
				Text("Certificates")
					.font(.largeTitle)
					.fontWeight(.bold)
				Spacer()
			}
			.padding()
			Image("Background1")
			Spacer()
		}
	}
}

struct BackgroundCardView: View {
	var body: some View {
		VStack {
			Spacer()
		}
	}
}

struct CardView: View {
	var body: some View {
		VStack {
			HStack {
				VStack(alignment: .leading) {
					Text("UI Design")
						.font(.title)
						.fontWeight(.semibold)
						.foregroundColor(Color.white)
					Text("Certificates")
						.foregroundColor(Color("accent"))
				}
				Spacer()
				Image("Logo1")
			}
			.padding()
			Spacer()
			Image("Card1")
				.resizable()
				.aspectRatio(contentMode: .fill)
				.frame(width: 300, height: 110, alignment: .top)
		}
	}
}

struct ButtomCardView: View {
	var body: some View {
		VStack(spacing: 20) {
			Rectangle()
				.frame(width: 40, height: 5)
				.cornerRadius(3)
				.opacity(0.1)

			Text("Design Code is fun. This is haoboxuxu learning SwiftUI to be pro. haoboxuxu has app on the App Store. Search Machine Learning hub")
				.foregroundColor(.black)
				.multilineTextAlignment(.center)
				.font(.subheadline)
				.lineSpacing(4)

			Spacer()
		}
		.padding(.top, 8)
		.padding(.horizontal, 20)
		.frame(maxWidth: .infinity)
		.background(Color.white)
		.cornerRadius(20)
		.shadow(radius: 20)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
