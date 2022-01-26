//
//  HeaderView.swift
//  SverigesRadioSwiftUi
//
//  Created by Rahim Siahpoosh on 2022-01-14.
//

import Foundation
import SwiftUI
import Combine

struct HeaderView: View {
    @ObservedObject var viewModel: HeaderViewViewModel
    
    var body: some View {
        HStack {
            Text(viewModel.headerTitle)
                .font(.title)
                .fontWeight(.bold)
            Spacer()
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(viewModel: HeaderViewViewModel(headerTitle: "Discovery"))
    }
}
