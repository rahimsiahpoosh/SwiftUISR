//
//  APIChannel.swift
//  SverigesRadioSwiftUi
//
//  Created by Rahim Siahpoosh on 2022-01-14.
//

import Foundation

struct APIChannel: Decodable {
    let id: Int
    let name: String
    let channeltype: String
}
