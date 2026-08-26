//
//  OnboardingIntroView.swift
//  AIChat
//
//  Created by Guillaume Richard on 14/07/2026.
//

import SwiftUI

struct OnboardingIntroView: View {
    var body: some View {
        VStack {
            Text(
                "Make your own \(Text("avatars").foregroundStyle(.accent).fontWeight(.semibold)) and chat with them!\n\nHave \(Text("real conversations").foregroundStyle(.accent).fontWeight(.semibold)) with AI generated responses."
            )

            .baselineOffset(6) // spacing between the line like lineSpacing.
            .frame(maxHeight: .infinity)
            .padding(24)

            NavigationLink {
                OnboardingColorView()
            } label: {
                Text("Continue")
                    .callToActionButton()
            }
        }
        .padding(24)
        .font(.title3)
        .toolbar(.hidden, for: .navigationBar)

    }
}

#Preview {
    NavigationStack {
        OnboardingIntroView()
    }
}
