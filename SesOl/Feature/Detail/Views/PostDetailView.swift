//
//  PostDetailView.swift
//  SesOl
//
//  Created by Yunus Emre Berdibek on 8.05.2023.
//

import SwiftUI

struct PostDetailView: View {

    @Environment(\.dismiss) private var dismiss
    var unionPost: UnionPostResponseElement
    @StateObject private var detailViewModel = DetailViewModel()
    var body: some View {

        NavigationStack {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Image(systemName: "person.badge.shield.checkmark.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 25, height: 25)
                        .foregroundColor(.halloween_orange)

                    Text(unionPost.postPublisherName ?? "")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)

                    Text(unionPost.postTime ?? "Hata")
                        .foregroundColor(.spanish_gray)
                        .font(.caption)
                    Spacer()
                }
                    .padding([.top, .leading], PagePaddings.Normal.padding_20.rawValue)

                Text(unionPost.postContent ?? "")
                    .foregroundColor(.dark_liver)
                    .multilineTextAlignment(.leading)
                    .padding(.all, PagePaddings.Normal.padding_20.rawValue)
                    .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "arrow.left")
                                .foregroundColor(.halloween_orange)
                        }
                    }
                }
                Divider()
            }
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: Color.gray.opacity(1), radius: 2, x: 0, y: 2)
                .padding(.all, PagePaddings.Normal.padding_10.rawValue)
        }
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView(unionPost: UnionPostResponseElement(postID: 1, publisherUnionID: 8, postPublisherName: "AFAD", postContent: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum", postTime: "18:16"))
    }
}
