//
//  AnimationCardList.swift
//  SverigesRadioSwiftUi
//
//  Created by Rahim Siahpoosh on 2022-01-13.
//

import Foundation
import SwiftUI

struct AnimationCardList: View {

    @ObservedObject var viewModel: AnimationCardListViewViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(viewModel.programs, id: \.self) { program in
                    GeometryReader { geometry in
                        program.programImage
                            .resizable()
                            .cornerRadius(15)
                            .rotation3DEffect(
                                Angle(
                                    degrees: Double((geometry.frame(in: .global).minX - 20) / -20)
                                ),
                                axis: (x: 0, y: 1, z: 0),
                                anchor: .center,
                                anchorZ: 0.0,
                                perspective: 1.0
                            )
                    }
                    .frame(width: 300, height: 200)
                }
            }
            .padding()
        }
    }
}

struct AnimationCardList_Previews: PreviewProvider {
    static var previews: some View {
        AnimationCardList(viewModel: AnimationCardListViewViewModel(programs: .constant(
            [ModelProgram(id: 2, name: "",
                          programImage:
                            Image(systemName: "star.fill"))
            ]
        )))
    }
}
