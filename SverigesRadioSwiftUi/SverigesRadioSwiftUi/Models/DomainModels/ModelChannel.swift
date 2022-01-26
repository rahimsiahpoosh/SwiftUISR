//
//  ModelChannel.swift
//  SverigesRadioSwiftUi
//
//  Created by Rahim Siahpoosh on 2022-01-14.
//

import Foundation

struct ModelChannel: Hashable {

    public enum ChannelType {
        case main
        case local
        case minority
        case extra
        case web
        case unknown
    }

    let id: Int
    let name: String
    let channelType: ChannelType?
    var rating: Int
    var liked: Bool

    init(id: Int, name: String, channelType: ChannelType?, rating: Int = 0, liked: Bool = false) {
        self.id = id
        self.name = name
        self.channelType = channelType
        self.rating = rating
        self.liked = liked
    }

    init(channel: APIChannel) {
        let name: String
        let channelType: ChannelType

        if channel.id == Self.p2SpråkOchMusikId {
            name = "P2 Språk och musik"
            channelType = .minority
        } else if channel.id == Self.p2MusikId { // Main Cha
            name = "P2"
            channelType = .main
        } else if channel.id == Self.ekotId {
            name = "ekot"
            channelType = .main
        } else {
            name = channel.name
            switch channel.channeltype {
            case "Rikskanal": channelType = .main
            case "Lokal kanal": channelType = .local
            case "Minoritet och språk": channelType = .minority
            case "Extrakanaler": channelType = .extra
            case "Fler kanaler": channelType = .web
            default: channelType = .unknown
            }
        }

        self.init(id: channel.id, name: name, channelType: channelType)
      }

    public static let p1Id = 132
    public static let p2SpråkOchMusikId = 163
    public static let p2MusikId = 2562
    public static let p2VärldenId = 2619
    public static let p2KlassisktId = 1603
    public static let p3Id = 164
    public static let p4PlusId = 4951
    public static let p6Id = 166
    public static let sapmiId = 224
    public static let barnradionId = 2755
    public static let finnishId = 226
    public static let ekotId = 4540
    public static let radiosportenId = 179
    public static let p4RiksId = 158
    public static let scienceChannelId = 406
    public static let kidsChannelId = 1000
    public static let newsChannelId = 83

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
