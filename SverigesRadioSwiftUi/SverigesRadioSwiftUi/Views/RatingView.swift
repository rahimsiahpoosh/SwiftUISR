//
//  RatingView.swift
//  SverigesRadioSwiftUi
//
//  Created by Rahim Siahpoosh on 2022-01-18.
//

import SwiftUI

struct RatingView: View {
    @ObservedObject var viewModel: RatingViewViewModel

    var body: some View {
        HStack {
            ForEach(1...5, id: \.self) { number in
                viewModel.image(for: number)
                    .foregroundColor(number > viewModel.rating ? Color.gray : Color.yellow)
                    .onTapGesture {
                        viewModel.rating = number
                    }
            }
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(viewModel: RatingViewViewModel(rating: .constant(4)))
    }
}
