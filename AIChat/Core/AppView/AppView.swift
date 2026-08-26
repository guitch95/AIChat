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
    AppView(appState: AppState(showTabBar: true))
}

#Preview("Onboarding") {
    AppView(appState: AppState(showTabBar: false))

}
