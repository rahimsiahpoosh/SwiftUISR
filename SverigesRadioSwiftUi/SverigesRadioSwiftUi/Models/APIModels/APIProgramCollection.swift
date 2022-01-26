//
//  ProgramCollection.swift
//  SverigesRadioSwiftUi
//
//  Created by Rahim Siahpoosh on 2022-01-11.
//

import Foundation

struct APIProgramCollection: Decodable {
    let programs: [APIProgram]

    enum CodingKeys: String, CodingKey {
        case programs
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.programs = try container.decode([APIProgram].self, forKey: .programs)
    }
}
