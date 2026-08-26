//
//  ExploreView.swift
//  AIChat
//
//  Created by Guillaume Richard on 12/07/2026.
//

import SwiftUI

struct ExploreView: View {
    let avatar = AvatarModel.mock
    @State private var featuredAvatars: [AvatarModel] = AvatarModel.mocks
    @State private var categories: [CharacterOption] = CharacterOption.allCases
    @State private var popularAvatars: [AvatarModel] = AvatarModel.mocks

    var body: some View {
        NavigationStack {
            List {
                featuredSection
                categorySection
                popularSection


            }
        }
        .navigationTitle("Explore")
    }

    private var featuredSection: some View {
        Section {
            CarouselView(items: featuredAvatars) { avatar in
                HeroCellView(
                    title: avatar.name,
                    subtitle: avatar.characterDescription,
                    imageName: avatar.profileImageName
                )
                .anyButton {
                    // action
                }
            }
            // remove the native formatting of List
            .removeListRowFormatting()
        } header: {
            Text("Featured Avatars")
        }
    }

    private var categorySection: some View {
        Section {
            ScrollView(.horizontal) {
                HStack(spacing: 12) {
                    ForEach(categories, id: \.self) { category in
                        CategoryCellView(
                            title: category.rawValue.capitalized,
                            imageName: Constants.randomImage
                        )
                        .anyButton{
                            // action
                        }
                    }
                }
            }
            .frame(height: 140)
            .scrollIndicators(.hidden)
            .scrollTargetLayout()
            // viewAligned les éléments de la scrollview s'aligne
            .scrollTargetBehavior(.viewAligned)
            .removeListRowFormatting()

        } header: {
            Text("Categories")
        }
    }

    private var popularSection: some View {
        Section {
            ForEach(popularAvatars, id: \.self) { avatar in
                CustomListCellView(
                    imageName: avatar.profileImageName,
                    title: avatar.name,
                    subtitle: avatar.characterDescription
                )
                .anyButton(.highlight, action: {
                    // action
                })
                .removeListRowFormatting()
            }

        } header: {
            Text("Popular")
        }
    }
}


#Preview {
    ExploreView()
}
