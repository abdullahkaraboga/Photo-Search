//
//  FeedView.swift
//  PhotoSearch
//
//  Created by Abdullah Karaboğa on 16.01.2023.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        GeometryReader { bounds in

            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: bounds.size.width / 3 - 1.2), spacing: 1.2)], spacing: 1) {
                    ForEach(feedData) { item in

                        ImagesView(feed: item)
                            .frame(width: bounds.size.width / 3 - 0.6, height: bounds.size.height / 3 - 0.6)
                            .clipped()
                    }
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
