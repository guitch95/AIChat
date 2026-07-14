//
//  WelcomeView.swift
//  AIChat
//
//  Created by Guillaume Richard on 12/07/2026.
//

import SwiftUI

struct WelcomeView: View {
    @State var imageName: String = Constants.randomImage
    var body: some View {
        NavigationStack {
            VStack(spacing: 8) {
                ImageLoaderView(urlString: imageName)
                    .ignoresSafeArea()

                titleSection
                    .padding(.top, 24)

                ctaButton
                    .padding(16)
                
                policyLinks

            }
        }
    }
    
    /* Sinon les computed properties pour fragmenter les Views sont largement suffisantes par contre pour un morceau qui a son propre état, qui est réutilisé, ou lourd, préfère une sous-struct View (mieux isolée et optimisée).
    */

    private var titleSection: some View {
        VStack(spacing: 8) {
            Text("AI Chat 🤖")
                .font(.largeTitle)
                .fontWeight(.semibold)

            Text("Test")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }

    private var ctaButton: some View {
        VStack(spacing: 8) {
            NavigationLink {
                OnboardingIntroView()
            } label: {
                Text("Get started")
                    .callToActionButton()
            }

            Text("Already have an account? Sign in!")
                .underline()
                .font(.body)
                .padding(8)
                // can tap on the background otherwise only on the text.
                .tappableBackground()
                .onTapGesture {

                }
        }
    }

    private var policyLinks: some View {
        HStack {
            Link(
                destination: URL(string: Constants.termsOfServiceUrl)!
            ) {
                Text("Terms of Service")
            }
            Circle().foregroundStyle(.accent).frame(width: 4, height: 4)

            Link(destination: URL(string: Constants.privacyPolicyUrl)!) {
                Text("Privacy Policy")
            }
        }
    }
}

#Preview {
    WelcomeView()
        .environment(AppState())
}
