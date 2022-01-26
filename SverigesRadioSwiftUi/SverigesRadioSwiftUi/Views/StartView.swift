//
//  StartView.swift
//  SverigesRadioSwiftUi
//
//  Created by Rahim Siahpoosh on 2022-01-11.
//

import SwiftUI

struct StartView: View {

    @StateObject var viewModel = StartViewViewModel(
        programRepository: ProgramRepository(),
        channelRepository: ChannelRepository()
    )

    var body: some View {
        NavigationView {
            VStack {
                Divider()
                    .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack {
                        HeaderView(viewModel: HeaderViewViewModel(headerTitle: "This is 🔥"))
                            .padding(.horizontal)

                        if viewModel.programs.isEmpty {
                            EmptyView()
                        } else {
                            TabView(selection: self.$viewModel.index) {
                                ForEach(0...5, id: \.self) { index in
                                    viewModel.programs[index].programImage
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: self.viewModel.index == index ? 230 : 180)
                                        .cornerRadius(15)
                                        .padding(.horizontal)
                                        .tag(index)
                                }
                            }
                            .frame(height: 230)
                            .padding(.top, 25)
                            .tabViewStyle(PageTabViewStyle())
                            .animation(.easeOut)
                        }

                        HStack {
                            HeaderView(viewModel: HeaderViewViewModel(headerTitle: "Popular 🤩"))

                            Button {
                                if self.viewModel.columns.count == 2 {
                                    self.viewModel.columns.removeLast()
                                } else {
                                    self.viewModel.columns.append(GridItem(.flexible(), spacing: 15))
                                }
                            } label: {
                                Image(systemName: self.viewModel.columns.count == 2 ? "rectangle.grid.1x2" : "square.grid.2x2")
                                    .font(.system(size: 24))
                                    .foregroundColor(.black)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 25)

                        LazyVGrid(columns: self.viewModel.columns, spacing: 25) {
                            ForEach($viewModel.channels, id: \.self) { $channel in
                                GridView(viewModel: GridViewViewModel(liked: $channel.liked, rating: $channel.rating, name: channel.name), columns: self.$viewModel.columns)
                                    .contextMenu {
                                        Button(action: {
                                        }) {
                                            HStack {
                                                Text("Follow")
                                                Image(systemName: "heart")
                                            }
                                        }
                                        Button(action: {
                                        }) {
                                            HStack {
                                                Text("Rate")
                                                Image(systemName: "star")
                                            }
                                        }
                                    }
                            }
                        }
                        .padding([.horizontal, .top])
                        HeaderView(viewModel: HeaderViewViewModel(headerTitle: "Discovery 👀"))
                            .padding(.horizontal)
                            .padding(.top, 25)

//                        AnimationCardList(programs: $viewModel.programs)
                        AnimationCardList(viewModel: AnimationCardListViewViewModel(programs: $viewModel.programs))
                    }
                    .padding(.vertical)
                }
                Spacer()
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            .navigationBarTitle(Text(""), displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("logo")
                }
            }
        }
        .onAppear {
            viewModel.getPrograms()
            viewModel.getMainChannels()
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}

