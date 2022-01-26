//
//  URL+Extensions.swift
//  SverigesRadioSwiftUi
//
//  Created by Rahim Siahpoosh on 2022-01-13.
//

import Foundation
import UIKit

extension URL {
    func loadURL() -> UIImage {
        do {
            let data = try Data(contentsOf: self)
            
            return UIImage(data: data) ?? UIImage()
        } catch {
        }
        return UIImage()
    }
}
