//
//  View+EXT.swift
//  AIChat
//
//  Created by Guillaume Richard on 12/07/2026.
//

import Foundation

import SwiftUI

extension View {
    func callToActionButton() -> some View {
        self
            .font(.headline)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(.accent, in: .rect(cornerRadius: 16))
    }
}
