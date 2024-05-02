//
//  ElevationModifier.swift
//  RickAndMorty
//
//  Created by Daniel Castro muñoz on 2/5/24.
//

import SwiftUI

extension View {
    /// Visual effect that adds depth and hierarchy to UI elements, based on drop shadows.
    /// - Parameter level: The visual level of "depth" for the element.
    /// - Returns: A View with the ``ElevationModifier`` applied.
    func elevation(_ level: ElevationModifier.Level) -> some View {
        modifier(ElevationModifier(level: level))
    }
}

/// Visual effect that adds depth and hierarchy to UI elements, based on drop shadows.
struct ElevationModifier: ViewModifier {
    enum Level: CaseIterable {
        case e0, e1, e2, e3, e4, e5

        var shadowRadius: CGFloat {
            Theme.Elevation.shadowRadius(self)
        }

        var shadowOffset: (CGFloat, CGFloat) {
            Theme.Elevation.shadowOffset(self)
        }

        var shadowOpacity: CGFloat {
            Theme.Elevation.shadowOpacity(self)
        }
    }

    let level: Level

    func body(content: Content) -> some View {
        if level == .e0 {
            content
        } else {
            content
                .shadow(
                    color: .black.opacity(Theme.Elevation.baseShadowOpacity),
                    radius: Theme.Elevation.baseShadowRadius
                )
                .shadow(
                    color: .black.opacity(level.shadowOpacity),
                    radius: level.shadowRadius,
                    x: level.shadowOffset.0,
                    y: level.shadowOffset.1
                )
        }
    }
}

struct Elevation_Previews: PreviewProvider {

    struct Elevation: View {
        let width: CGFloat = 200
        let height: CGFloat = 200
        let elevationLevels = Array(ElevationModifier.Level.allCases.enumerated())

        var body: some View {
            ScrollView(.horizontal) {
                HStack(spacing: Theme.Spacing.space_8) {
                    ForEach(elevationLevels, id: \.element) { index, elevation in
                        Text("e\(index + 1)")
                            .frame(width: width, height: height)
                            .background(.black)
                            .elevation(elevation)
                    }
                }
                .frame(maxHeight: .infinity)
                .padding(.all, Theme.Spacing.space_8)
            }
        }
    }

    static var previews: some View {
       /* DevicesPreview {
            Elevation()
        }
        */
        EmptyView()
    }
}
