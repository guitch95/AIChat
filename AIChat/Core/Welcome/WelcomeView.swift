//
//  WelcomeView.swift
//  AIChat
//
//  Created by Guillaume Richard on 12/07/2026.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome! ")
                    .frame(maxHeight: .infinity)
                NavigationLink {
                    OnboardingCompletedView()
                } label: {
                    Text("Get started")
                        .callToActionButton()
                }
            }
            .padding()
        }
    }
}

#Preview {
    WelcomeView()
}
