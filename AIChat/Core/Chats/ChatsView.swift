//
//  ChatsView.swift
//  AIChat
//
//  Created by Guillaume Richard on 12/07/2026.
//

import SwiftUI

struct ChatsView: View {
    @State private var chats: [ChatModel] = ChatModel.mocks
    var body: some View {
        NavigationStack {
            List {
                ForEach(chats) { chat in
                    ChatRowCellViewBuilder(
                        currentUserId: nil,  //FIXME: Add current user id
                        chat: chat,
                        getAvatar: {
                            try? await Task.sleep(for: .seconds(1))
                            return .mock
                        },
                        getLastChatMessage: {
                            try? await Task.sleep(for: .seconds(1))
                            return .mock
                        }
                    )
                    .anyButton(.highlight) {

                    }
                    .removeListRowFormatting()

                }
            }
            .navigationTitle("Chats")
        }
    }
}

#Preview {
    ChatsView()
}
