//
//  TabBar.swift
//  DesignCode-SwiftUI-01
//
//  Created by king on 2020/6/29.
//

import SwiftUI

struct TabBar: View {
	var body: some View {
		TabView {
			Home()
				.tabItem {
					Image(systemName: "play.circle.fill")
					Text("Home")
				}

			ContentView()
				.tabItem {
					Image(systemName: "rectangle.stack.fill")
					Text("Certificates")
				}
		}
	}
}

struct TabBar_Previews: PreviewProvider {
	static var previews: some View {
		TabBar()
	}
}
