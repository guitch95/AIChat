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
    // gonna store if the user already signed in.
    @AppStorage("showTabbarView") var showTabBar: Bool = false
    var body: some View {
        AppViewBuilder(
            showTabBar: showTabBar,
            tabbarView: {
                ZStack {
                    Color.red.ignoresSafeArea()
                    Text("TabBar")
                }
            },
            onboardingView: {
                ZStack {
                    Color.blue.ignoresSafeArea()
                    Text("Onboarding")
                }
            }
        )
    }
}


#Preview("AppView - Tabbar"){
    AppView(showTabBar: true)
}

#Preview("AppView - Onboarding"){
    AppView(showTabBar: false)
}
