//
//  RatingViewViewModel.swift
//  SverigesRadioSwiftUi
//
//  Created by Rahim Siahpoosh on 2022-01-19.
//

import Foundation
import SwiftUI

class RatingViewViewModel: ObservableObject {

    @Binding var rating: Int
    func image(for number: Int) -> Image {
            return Image(systemName: "star.fill")
    }

    init(rating: Binding<Int>) {
        self._rating = rating
    }
}
