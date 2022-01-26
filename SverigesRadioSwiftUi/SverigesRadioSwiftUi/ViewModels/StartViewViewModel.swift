//
//  StartViewViewModel.swift
//  SverigesRadioSwiftUi
//
//  Created by Rahim Siahpoosh on 2022-01-12.
//

import Foundation
import SwiftUI
import Combine


class StartViewViewModel: ObservableObject {
    let programRepository: ProgramRepository
    let channelRepository: ChannelRepository

    @Published var index = 0
    @Published var programs: [ModelProgram] = []
    @Published var channels: [ModelChannel] = []

    @Published var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    var channelPublisher = PassthroughSubject<[ModelChannel], Never>()

    init(programRepository: ProgramRepository, channelRepository: ChannelRepository) {
        self.programRepository = programRepository
        self.channelRepository = channelRepository
    }

    func getPrograms() {
        programRepository.getPrograms { programs in
            DispatchQueue.main.async {
                self.programs = programs.compactMap {
                    ModelProgram(
                        id: $0.id,
                        name: $0.name,
                        programImage: Image(uiImage: $0.programimagewide?.loadURL() ?? UIImage())
                    )
                }
            }
        }
    }

    func getMainChannels() {
        channelRepository.getAllChannels { [self] channels in
            DispatchQueue.main.async {
                self.channels = self.channelRepository.getMainChannels(channels: channels)
                    .filter({ channel in channel.channelType == .main })
                    .sorted(by: { lhs, rhs in
                        return lhs.name < rhs.name
                    })
            }
        }
    }
}
