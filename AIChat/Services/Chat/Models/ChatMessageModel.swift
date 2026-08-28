//
//  ChatMessageModel.swift
//  AIChat
//
//  Created by Guillaume Richard on 27/08/2026.
//

import Foundation

struct ChatMessageModel {
    let id: String
    let chatId: String
    let authorId: String?
    let content: String?
    let seenByIds: [String]?
    let dateCreated: Date?

    init(
        id: String,
        chatId: String,
        authorId: String? = nil,
        content: String? = nil,
        seenByIds: [String]? = nil,
        dateCreated: Date? = nil
    ) {
        self.id = id
        self.chatId = chatId
        self.authorId = authorId
        self.content = content
        self.seenByIds = seenByIds
        self.dateCreated = dateCreated
    }


    func hasBeenSeenBy(userId: String) -> Bool {
        // make sure the array exists so that someone has already seen it
        guard let seenByIds else {return false}
        // si l'array existe dit moi si l'userId est dans le tableau seenById pour savoir si il l'a déjà vu.
        return seenByIds.contains(userId)
        // sinon ça sera false si il n'existe pas
    }

    static var mock: ChatMessageModel {
        mocks[0]
    }

    static var mocks: [ChatMessageModel] {
        return [
            ChatMessageModel(
                id: "msg1",
                chatId: "1",
                authorId: "user1",
                content: "Hello, how are you?",
                seenByIds: ["user2", "user3"],
                dateCreated: .now
            ),
            ChatMessageModel(
                id: "msg2",
                chatId: "2",
                authorId: "user2",
                content: "I'm doing well, thanks for asking!",
                seenByIds: ["user1"],
                dateCreated: .now.addingTimeInterval(minutes: -5)
            ),
            ChatMessageModel(
                id: "msg3",
                chatId: "3",
                authorId: "user3",
                content: "Anyone up for a game tonight?",
                seenByIds: ["user1", "user2", "user4"],
                dateCreated: .now.addingTimeInterval(hours: -1)
            ),
            ChatMessageModel(
                id: "msg4",
                chatId: "1",
                authorId: "user1",
                content: "Sure, count me in!",
                seenByIds: nil,
                dateCreated: .now.addingTimeInterval(hours: -2, minutes: -15)
            ),
        ]
    }

}
