//
//  CarouselView.swift
//  AIChat
//
//  Created by Guillaume Richard on 18/07/2026.
//

import SwiftUI

// Decoupled the cells that we pass (Content), can pass anything now and also from the datatype that we pass.(T)

struct CarouselView<Content: View, T: Hashable>: View {

    var items: [T]
    @ViewBuilder var content: (T) -> Content
    @State private var selection: T?

    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
                    ForEach(items, id: \.self) { item in
                        content(item)
                            .scrollTransition(
                                // as the user is scrolling and size is full when 95% on the screen.
                                .interactive.threshold(.visible(0.95)),
                                transition: { content, phase in
                                    content
                                        // size of the scale between the screens
                                        .scaleEffect(phase.isIdentity ? 1 : 0.9)
                                }
                            )
                            .containerRelativeFrame(
                                .horizontal,
                                alignment: .center
                            )
                            .id(item)
                    }
                }
            }
            .frame(height: 200)
            .scrollIndicators(.hidden)
            .scrollTargetLayout()
            .scrollTargetBehavior(.paging)
            .scrollPosition(id: $selection)
            .onChange(
                of: items.count,
                { _, _ in
                    updateSelectionIfNeeded()
                }
            )
            // in order to avoid that when launching the first dot is gray.
            .onAppear {
                updateSelectionIfNeeded()
            }

            HStack(spacing: 8) {
                ForEach(items, id: \.self) { item in
                    Circle()
                        .fill(
                            item == selection
                                ? .accent : .secondary.opacity(0.5)
                        )
                        .frame(width: 8, height: 8)

                }
            }
            .animation(.linear, value: selection)
        }
    }
    // in order to avoid that when launching the first dot is gray.
    private func updateSelectionIfNeeded() {
        if selection == nil || selection == items.last {
            selection = items.first
        }
    }
}

#Preview {
    CarouselView(items: AvatarModel.mocks) { item in
        HeroCellView(
            title: item.name,
            subtitle: item.characterDescription,
            imageName: item.profileImageName
        )
    }
    .padding()
}
