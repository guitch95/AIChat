//
//  AppView.swift
//  AIChat
//
//  Created by Guillaume Richard on 11/07/2026.
//
import SwiftUI

// tabbar --> signed in
// onboarding --> signed out
struct AppView: View {
    // gonna store if the user has already signed in.
    @State var appState: AppState = AppState()
    var body: some View {
        AppViewBuilder(
            showTabBar: appState.showTabBar,
            tabbarView: {
                TabBarView()
            },
            onboardingView: {
                WelcomeView()
            }
        )
        .environment(appState)
    }
}

#Preview("Tabbar") {
    AppViewBuilder(
        showTabBar: true,
        tabbarView: { TabBarView() },
        onboardingView: {
            WelcomeView()
        }
    )
}

#Preview("Onboarding") {
    AppViewBuilder(
        showTabBar: false,
        tabbarView: { TabBarView() },
        onboardingView: { WelcomeView() }
    )
}
