//
//  ContentView.swift
//  SverigesRadioSwiftUi
//
//  Created by Rahim Siahpoosh on 2022-01-10.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
        TabbarView()
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
