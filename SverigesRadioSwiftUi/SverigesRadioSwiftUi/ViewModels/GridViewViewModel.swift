//
//  GridViewViewModel.swift
//  SverigesRadioSwiftUi
//
//  Created by Rahim Siahpoosh on 2022-01-18.
//

import Foundation

import Combine
import SwiftUI

class GridViewViewModel: ObservableObject {
    @Binding public var liked: Bool
    @Binding public var rating: Int
    @Published var name: String



    init(liked: Binding<Bool>, rating: Binding<Int>, name: String) {
        self._liked = liked
        self._rating = rating
        self.name = name
    }
}
