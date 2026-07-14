//
//  OnboardingCompletedView.swift
//  AIChat
//
//  Created by Guillaume Richard on 12/07/2026.
//

import SwiftUI

struct OnboardingCompletedView: View {
    @Environment(AppState.self) private var root
    
    var body: some View {
        VStack {
            Text("Onboarding Completed!")
                .frame(maxHeight: .infinity)
            Button {
                // finish onboarding and enter app!
                onFinishButtonPressed()
            } label: {
                Text("Finish")
                    .callToActionButton()
            }
        }
        .padding()
    }
    
    func onFinishButtonPressed() {
        // other logic to completed onboarding
        root.updateViewState(showTabBarView: true)
    }
}

#Preview {
    OnboardingCompletedView()
        .environment(AppState())
}
