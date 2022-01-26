//
//  ModelProgram.swift
//  SverigesRadioSwiftUi
//
//  Created by Rahim Siahpoosh on 2022-01-12.
//

import Foundation
import SwiftUI

struct ModelProgram: Hashable {
    let id: Int
    let name: String
    let programImage: Image

    public init(id: Int, name: String, programImage: Image) {
        self.id = id
        self.name = name
        self.programImage = programImage
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
