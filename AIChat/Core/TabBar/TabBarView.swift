//
//  TabBarView.swift
//  AIChat
//
//  Created by Guillaume Richard on 12/07/2026.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            Tab("Explore", systemImage: "eyes") {
                ExploreView()
            }
            Tab("Chats", systemImage: "bubble.left.and.bubble.right.fill") {
                ChatsView()
            }
            Tab("Profile", systemImage: "person.fill") {
                ProfileView()
            }

        }
    }
}

#Preview {
    TabBarView()
}
