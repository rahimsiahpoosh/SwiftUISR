//
//  HeaderViewViewModel.swift
//  SverigesRadioSwiftUi
//
//  Created by Rahim Siahpoosh on 2022-01-14.
//

import SwiftUI
import Combine

class HeaderViewViewModel: ObservableObject {
    @Published public var headerTitle: String

    init(headerTitle: String) {
        self.headerTitle = headerTitle
    }
}


