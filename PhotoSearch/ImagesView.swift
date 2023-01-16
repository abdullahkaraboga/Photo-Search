//
//  ImagesView.swift
//  PhotoSearch
//
//  Created by Abdullah Karaboğa on 16.01.2023.
//

import SwiftUI

struct ImagesView: View {
    
    var feed : Feed = feedData[0]
    var body: some View {
        Image(feed.image)
            .resizable()
            .aspectRatio(contentMode: .fill)
    }
}

struct ImagesView_Previews: PreviewProvider {
    static var previews: some View {
        ImagesView()
    }
}
