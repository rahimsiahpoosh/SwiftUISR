//
//  ChannelRepository.swift
//  SverigesRadioSwiftUi
//
//  Created by Rahim Siahpoosh on 2022-01-14.
//

import Foundation

protocol ChannelRepositoryProtocol {
    func getAllChannels(completion: @escaping([APIChannel]) -> ())

    func getMainChannels(channels: [APIChannel]) -> [ModelChannel]

}

class ChannelRepository: ChannelRepositoryProtocol {
    func getAllChannels(completion: @escaping ([APIChannel]) -> ()) {
        guard let url = URL(string: API.channelsEndpoint) else { return }

        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { data, _, error in
            if error != nil {
                return
            }

            guard let apiData = data else { return }

            do {
                let channelCollection = try JSONDecoder().decode(APIChannelCollection.self, from: apiData)
                completion(channelCollection.channels)
            } catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }

    func getMainChannels(channels: [APIChannel]) -> [ModelChannel] {
        return channels
            .map { channel -> ModelChannel in
                return ModelChannel(channel: channel)
            }
    }
}
