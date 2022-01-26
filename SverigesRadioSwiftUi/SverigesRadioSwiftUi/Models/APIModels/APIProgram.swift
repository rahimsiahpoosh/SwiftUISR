//
//  APIProgram.swift
//  SverigesRadioSwiftUi
//
//  Created by Rahim Siahpoosh on 2022-01-10.
//

import Foundation

struct APIProgram: Decodable {
    let id: Int
    let name: String
    let description: String?
    let email: String?
    let phone: String?
    let broadcastInfo: String?
    let programurl: URL?
    let programslug: String?
    let programimage: URL?
    let programimagetemplate: URL?
    let programimagewide: URL?
    let programimagetemplatewide: URL?
    let socialimage: URL?
    let socialimagetemplate: URL?
    let archived: Bool?
    let hasondemand: Bool?
    let haspod: Bool?
    let responsibleeditor: String?
}

