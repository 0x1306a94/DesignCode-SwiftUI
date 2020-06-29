//
//  UpdateStore.swift
//  DesignCode-SwiftUI-01
//
//  Created by king on 2020/6/29.
//

import Combine
import SwiftUI

class UpdateStore: ObservableObject {
	@Published var updates: [Update] = updateData
}
