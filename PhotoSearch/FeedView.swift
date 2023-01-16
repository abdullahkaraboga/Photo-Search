//
//  FeedView.swift
//  PhotoSearch
//
//  Created by Abdullah Karaboğa on 16.01.2023.
//

import SwiftUI

struct FeedView: View {
    @State var searchText = ""
    @State var isSearching = false
    @State var showResult = false
    @State var loadSearch = false


    var tag = ["Weather", "Football", "Fishing", "Culture", "Politics", "Technology", "Dogs", "Lifestyle", "Food"]


    var body: some View {
        GeometryReader { bounds in

            ScrollView {

                SearchBar(searchText: $searchText, isSearching: $isSearching, showResult: $showResult, loadSearch: $loadSearch)
                    .padding(.top, 8)
                    .padding(.bottom, 2)


                ScrollView(.horizontal,showsIndicators: false){
                    HStack {
                        ForEach(tag.indices) {

                            Text(tag[$0])
                                .font(.subheadline)
                                .frame(height: 30)
                                .padding(.horizontal)
                                .overlay (
                                Capsule()
                                    .stroke(Color(.systemGray5), lineWidth: 1))

                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical,4)
                }
                .padding(.bottom,2)


                LazyVGrid(columns: [GridItem(.adaptive(minimum: bounds.size.width / 3 - 1.2), spacing: 1.2)], spacing: 1) {
                    ForEach(feedData.filter({"\($0)".contains(searchText.lowercased()) || searchText.isEmpty})) { item in

                        ImagesView(feed: item)
                            .frame(width: bounds.size.width / 3 - 0.6, height: bounds.size.height / 3 - 0.6)
                            .clipped()
                    }
                    .animation(.spring())
                }
            }
        }
            .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                loadSearch = true
            }
        })
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}

struct SearchBar: View {
    @Binding var searchText: String
    @Binding var isSearching: Bool
    @Binding var showResult: Bool
    @Binding var loadSearch: Bool

    var body: some View {

        HStack(spacing: 0) {
            HStack {
                TextField("Search Photo", text: $searchText)
                    .padding(.leading, 24)
            }
                .frame(height: 4)
                .padding()
                .background(Color(.systemGray5))
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                .padding(.horizontal)
                .onTapGesture(perform: {
                isSearching = true
                showResult = true
            })
                .overlay (
                HStack {
                    Image(systemName: "magnifyingglass")
                    Spacer()

                    Button (action: {
                        searchText = ""
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .padding(.vertical)
                            .foregroundColor(.gray)
                            .opacity(isSearching ? 1 : 0)
                    })

                }
                    .padding(.horizontal, 32)
                    .foregroundColor(.gray)
            )
                .animation(loadSearch ? .spring() : .none)


            if isSearching {
                Button(action: {
                    isSearching = false
                    searchText = ""
                    showResult = false

                    UIApplication.shared
                        .sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                },
                       label: {
                           Text("Cancel")
                               .padding(.trailing)
                               .padding(.leading, 0)
                       }
                )
                    .transition(.move(edge: .trailing))
                    .animation(.spring())
            }
        }
    }

}

