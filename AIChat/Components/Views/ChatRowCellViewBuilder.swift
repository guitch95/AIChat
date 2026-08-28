//
//  ChatRowCellViewBuilder.swift
//  AIChat
//
//  Created by Guillaume Richard on 28/08/2026.
//

import SwiftUI

struct ChatRowCellViewBuilder: View {
    var currentUserId: String? = ""
    var chat: ChatModel = .mock
    var getAvatar: () async -> AvatarModel?
    var getLastChatMessage: () async -> ChatMessageModel?
    @State private var avatar: AvatarModel?
    @State private var lastChatMessage: ChatMessageModel?
    @State private var didLoadAvatar: Bool = false
    @State private var didLoadChatMessage: Bool = false

    private var isLoading: Bool {
        if didLoadAvatar && didLoadChatMessage {
            return false
        }
        return true

    }

    private var hasNewChat: Bool {
        // make sure that the lastChatMessage is loaded and we have currentUserId
        guard let lastChatMessage, let currentUserId else { return false }
        return lastChatMessage.hasBeenSeenBy(userId: currentUserId)

    }

    private var subheadline: String? {
        if isLoading {
            return "xxxx xxxx xxxx xxxx"
        }

        if avatar == nil && lastChatMessage == nil {
            return "Error."
        }

        return lastChatMessage?.content
    }

    var body: some View {
        ChatRowCellView(
            imageName: avatar?.profileImageName,
            headline: isLoading ? "xxxx xxxx" : avatar?.name,
            subheadline: subheadline,
            hasNewChat: hasNewChat ? false : hasNewChat
        )
        .redacted(reason: isLoading ? .placeholder : [])
        .task {
            // get avatar
            avatar = await getAvatar()
            didLoadAvatar = true
        }
        .task {
            lastChatMessage = await getLastChatMessage()
            didLoadChatMessage = true
        }
    }
}

#Preview {
    VStack {
        ChatRowCellViewBuilder(
            chat: .mock,
            getAvatar: {
                try? await Task.sleep(for: .seconds(5))
                return .mock
            },
            getLastChatMessage: {
                try? await Task.sleep(for: .seconds(5))
                return .mock
            }
        )

        ChatRowCellViewBuilder(
            chat: .mock,
            getAvatar: {
                return .mock
            },
            getLastChatMessage: { return .mock }
        )
        ChatRowCellViewBuilder(
            chat: .mock,
            getAvatar: {
                nil
            },
            getLastChatMessage: { return nil }
        )
    }
}

/*
 Pourquoi créer un wrapper de View comme ici ?

 Firestore ne fait pas de jointures. Pour 50 chats il te faut 50 lectures supplémentaires avant d'afficher quoi que ce soit.
 Écran blanc pendant 2 secondes, puis tout d'un coup.
 Avec le builder : la liste s'affiche immédiatement, les avatars arrivent ligne par ligne, et seules les lignes visibles déclenchent une lecture.
 */
