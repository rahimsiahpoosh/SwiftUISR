//
//  TabbarView.swift
//  SverigesRadioSwiftUi
//
//  Created by Rahim Siahpoosh on 2022-01-11.
//

import SwiftUI

struct TabbarView: View {

    @StateObject var viewModel = TabbarViewViewModel()

    var body: some View {

        TabView(selection: $viewModel.selectedTab) {
            StartView()
                .tabItem {
                    Image("home_active")
                    Text("Start")
                }
                .tag(0)

        }
        .onAppear {
            UITabBar.appearance().backgroundColor = .white
        }
        .accentColor(.black)
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}

