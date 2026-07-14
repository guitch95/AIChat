//
//  OnboardingCompletedView.swift
//  AIChat
//
//  Created by Guillaume Richard on 12/07/2026.
//

import SwiftUI

struct OnboardingCompletedView: View {
    @Environment(AppState.self) private var root
    @State private var isCompletingProfileSetup: Bool = false
    var selectedColor: Color = .orange

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Setup Complete!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(selectedColor)

            Text(
                "We've set up your profile and you're ready to start chatting."
            )
            .font(.title)
            .fontWeight(.medium)
            .foregroundStyle(.secondary)
        }
        .frame(maxHeight: .infinity)

        .safeAreaInset(edge: .bottom) {
            ctaButton
        }
        .padding(24)
        .toolbar(.hidden, for: .navigationBar)
    }

    private var ctaButton: some View {
        Button {
            // finish onboarding and enter app!
            onFinishButtonPressed()
        } label: {
            ZStack {
                if isCompletingProfileSetup {
                    ProgressView()
                        .tint(.white)
                } else {
                    Text("Finish")
                }
            }
            .callToActionButton()
        }
        // disabled the button in order to avoid mutliple registration by clicking mutliple times on it.
        .disabled(isCompletingProfileSetup)
    }

    func onFinishButtonPressed() {
        isCompletingProfileSetup = true
        Task {
            try await Task.sleep(for: .seconds(3))
            isCompletingProfileSetup = false
            //            try await saveUserProfileColor(color: selectedColor)
            root.updateViewState(showTabBarView: true)
        }
    }
}

#Preview {
    OnboardingCompletedView(selectedColor: .mint)
        .environment(AppState())
}
