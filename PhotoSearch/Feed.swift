//
//  Feed.swift
//  PhotoSearch
//
//  Created by Abdullah Karaboğa on 16.01.2023.
//

import SwiftUI

struct Feed: Identifiable {
    var id = UUID()
    var title : String
    var image : String
}



let feedData = [
    Feed(title: "car", image: "car"),
    Feed(title: "city", image: "city"),
    Feed(title: "dog", image: "dog"),
    Feed(title: "dog2", image: "dog2"),
    Feed(title: "fall", image: "fall"),
    Feed(title: "fireworks", image: "fireworks"),
    Feed(title: "forest", image: "forest"),
    Feed(title: "office", image: "office"),
    Feed(title: "people", image: "people"),
    Feed(title: "river", image: "river"),
    Feed(title: "skate", image: "skate"),
    Feed(title: "surf", image: "surf"),
    Feed(title: "waterfall", image: "waterfall"),
    Feed(title: "women 2", image: "women 2"),
    Feed(title: "women", image: "women"),

]
