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
    @AppStorage("showTabbarView") var showTabBar: Bool = false
    
    var body: some View {
        AppViewBuilder(
            showTabBar: showTabBar,
            tabbarView: {
                TabBarView()
            },
            onboardingView: {
                WelcomeView()
            }
        )
    }
}


#Preview("Tabbar") {
    AppViewBuilder(
        showTabBar: true,
        tabbarView: { TabBarView() },
        onboardingView: { WelcomeView() }
    )
}

#Preview("Onboarding") {
    AppViewBuilder(
        showTabBar: false,
        tabbarView: { TabBarView() },
        onboardingView: { WelcomeView() }
    )
}
