//
//  AnimationCardListViewViewModel.swift
//  SverigesRadioSwiftUi
//
//  Created by Rahim Siahpoosh on 2022-01-19.
//

import Foundation
import SwiftUI

class AnimationCardListViewViewModel: ObservableObject {
    @Binding var programs: [ModelProgram]

    init(programs: Binding<[ModelProgram]>) {
        self._programs = programs
    }
}
