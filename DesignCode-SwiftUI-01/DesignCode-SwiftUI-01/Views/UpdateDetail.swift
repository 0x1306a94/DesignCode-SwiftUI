//
//  UpdateDetail.swift
//  DesignCode-SwiftUI-01
//
//  Created by king on 2020/6/29.
//

import SwiftUI

struct UpdateDetail: View {
	var update: Update

    var body: some View {
		List {
			VStack {
				Image(update.image)
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(maxWidth: .infinity)

				Text(update.text)
					.frame(maxWidth: .infinity, alignment: .leading)
			}
			.navigationBarTitle(update.title)
		}
		.listStyle(PlainListStyle())
    }
}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetail(update: updateData[0])
    }
}
