//
//  GridView.swift
//  SverigesRadioSwiftUi
//
//  Created by Rahim Siahpoosh on 2022-01-13.
//

import SwiftUI

struct GridView: View {

    @ObservedObject var viewModel: GridViewViewModel
    @Binding var columns: [GridItem]

    var body: some View {
        VStack {
            if self.columns.count == 2 {
                VStack(spacing: 15) {
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                        Image(viewModel.name)
                            .renderingMode(.original)
                            .resizable()
                            .frame(height: 160)
                            .cornerRadius(15)
                        Button {
                            viewModel.liked.toggle()
                        } label: {
                            if viewModel.liked {
                                Image(systemName: "heart.fill")
                                    .foregroundColor(.red)
                                    .padding(.all, 10)
                                    .background(.white)
                                    .clipShape(Circle())
                            } else {
                                Image(systemName: "heart")
                                    .foregroundColor(.red)
                                    .padding(.all, 10)
                                    .background(.white)
                                    .clipShape(Circle())
                            }
                        }
                        .padding(.all, 10)
                    }
                    Text(viewModel.name)
                        .fontWeight(.bold)
                        .lineLimit(1)
                }
            } else {
                HStack(spacing: 15) {
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                        Image(viewModel.name)
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: (UIScreen.main.bounds.width - 45) / 2, height: 160)
                            .cornerRadius(15)

                        Button {
                            viewModel.liked.toggle()
                        } label: {
                            if viewModel.liked {
                                Image(systemName: "heart.fill")
                                    .foregroundColor(.red)
                                    .padding(.all, 10)
                                    .background(.white)
                                    .clipShape(Circle())
                            } else {
                                Image(systemName: "heart")
                                    .foregroundColor(.red)
                                    .padding(.all, 10)
                                    .background(.white)
                                    .clipShape(Circle())
                            }
                        }
                        .padding(.all, 10)
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        Text(viewModel.name)
                            .fontWeight(.bold)
                        HStack(spacing: 10) {
                            RatingView(viewModel: RatingViewViewModel(rating: $viewModel.rating))
                            Spacer(minLength: 0)
                        }
                    }
                }
                .padding(.trailing)
                .background(.white)
                .cornerRadius(15)
            }
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(viewModel: GridViewViewModel(liked: .constant(true), rating: .constant(3), name: "P2"), columns: .constant(Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)))
    }
}
