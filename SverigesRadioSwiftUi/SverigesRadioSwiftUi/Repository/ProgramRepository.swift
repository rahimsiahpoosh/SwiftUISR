//
//  ProgramRepository.swift
//  SverigesRadioSwiftUi
//
//  Created by Rahim Siahpoosh on 2022-01-10.
//

import Foundation
import UIKit
import Combine

protocol ProgramRepositoryProtocol {
    func getPrograms(completion: @escaping([APIProgram]) -> Void)
}

class ProgramRepository: ProgramRepositoryProtocol {

    func getPrograms(completion: @escaping ([APIProgram]) -> Void) {

        guard let url = URL(string: API.programEndPoint) else {
            return
        }

        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { data, _, error in
            if error != nil {
                return
            }

            guard let apiData = data else { return }

            do {
                let programCollection = try JSONDecoder().decode(APIProgramCollection.self, from: apiData)
                completion(programCollection.programs)
            } catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }
}
