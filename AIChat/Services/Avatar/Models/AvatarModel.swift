//
//  AvatarModel.swift
//  AIChat
//
//  Created by Guillaume Richard on 18/07/2026.
//

import Foundation
import SwiftUI

// Struct are Sendable because of how they are managed in Memory (Value Types)
// Much easier to work with Struct in an async/await context due to the fact that they are sendable.
// - Vérité ailleurs (serveur, base) → let, le modèle est une photographie
// - Vérité ici (l'utilisateur édite) → var
// STRUCT with "let" -> Immutable STRUCT.
struct AvatarModel: Hashable {
    // avec "let" les valeurs par défaut doivent être passé dans l'init. Si c'était passé comme avec des "var" directement au moment la déclaration du type ça serait figé car c'est une constant "let".
    let avatarId: String
    let name: String?
    let characterOption: CharacterOption?
    let characterAction: CharacterAction?
    let characterLocation: CharacterLocation?
    let profileImageName: String?
    let authorId: String?
    let dateCreated: Date?

    // la définition de valeur par défaut dans l'init (ici nil) permets de réattribuer plus tard si jamais on a besoin de lui donner une autre valeur. Ça "permet" de contourner le "problème" de la constant "let".
    init(
        avatarId: String,
        name: String? = nil,
        characterOption: CharacterOption? = nil,
        characterAction: CharacterAction? = nil,
        characterLocation: CharacterLocation? = nil,
        profileImageName: String? = nil,
        authorId: String? = nil,
        dateCreated: Date? = nil
    ) {
        self.avatarId = avatarId
        self.name = name
        self.characterOption = characterOption
        self.characterAction = characterAction
        self.characterLocation = characterLocation
        self.profileImageName = profileImageName
        self.authorId = authorId
        self.dateCreated = dateCreated
    }

    var characterDescription: String {
        AvatarDescriptionBuilder(avatar: self).characterDescription
    }

    static var mock: AvatarModel { mocks[0] }

    // MOCK DATA
    static var mocks: [AvatarModel] {
        [
            // option + enter to autocomplete for the optional
            AvatarModel(
                avatarId: UUID().uuidString,
                name: "Alpha",
                characterOption: .alien,
                characterAction: .smiling,
                characterLocation: .park,
                profileImageName: Constants.randomImage,
                authorId: UUID().uuidString,
                dateCreated: .now
            ),

            AvatarModel(
                avatarId: UUID().uuidString,
                name: "Beta",
                characterOption: .dog,
                characterAction: .eating,
                characterLocation: .forest,
                profileImageName: Constants.randomImage,
                authorId: UUID().uuidString,
                dateCreated: .now
            ),

            AvatarModel(
                avatarId: UUID().uuidString,
                name: "Gamma",
                characterOption: .cat,
                characterAction: .drinking,
                characterLocation: .museum,
                profileImageName: Constants.randomImage,
                authorId: UUID().uuidString,
                dateCreated: .now
            ),

            AvatarModel(
                avatarId: UUID().uuidString,
                name: "Delta",
                characterOption: .woman,
                characterAction: .shopping,
                characterLocation: .park,
                profileImageName: Constants.randomImage,
                authorId: UUID().uuidString,
                dateCreated: .now
            ),
        ]
    }

}

struct AvatarDescriptionBuilder {
    let characterOption: CharacterOption
    let characterAction: CharacterAction
    let characterLocation: CharacterLocation

    // Dès que tu écris un init personnalisé dans une struct, Swift SUPPRIME le memberwise init automatique.
    init(
        characterOption: CharacterOption,
        characterAction: CharacterAction,
        characterLocation: CharacterLocation
    ) {
        self.characterOption = characterOption
        self.characterAction = characterAction
        self.characterLocation = characterLocation
    }
    // Ici init personnalisé donc l'init au dessus est nécessaire
    init(avatar: AvatarModel) {
        self.characterOption = avatar.characterOption ?? .default
        self.characterAction = avatar.characterAction ?? .default
        self.characterLocation = avatar.characterLocation ?? .default
    }

    var characterDescription: String {
        let prefix = characterOption.startWithVowel ? "An" : "A"
        return
            "\(prefix) \(characterOption.rawValue) that is \(characterAction.rawValue) in the \(characterLocation.rawValue)."
    }
}

enum CharacterOption: String, Hashable, CaseIterable {
    case man, woman, alien, dog, cat

    // default is already a keyword used in Swift so backtick allows to use the word even if it's a keyword in Swift.
    static var `default`: Self {
        .man
    }

    var startWithVowel: Bool {
        switch self {
        case .alien:
            return true
        default:
            return false
        }
    }
}

enum CharacterAction: String {
    case smiling, sitting, eating, drinking, walking, shopping, studying,
        working, relaxing, fighting, crying

    static var `default`: Self {
        .smiling
    }
}

enum CharacterLocation: String {
    case park, mall, museum, city, desert, forest, space

    static var `default`: Self {
        .park
    }
}
