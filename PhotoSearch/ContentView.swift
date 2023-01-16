//
//  ContentView.swift
//  PhotoSearch
//
//  Created by Abdullah Karaboğa on 16.01.2023.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        FeedView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
