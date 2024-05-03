//
//  Theme.swift
//  RickAndMorty
//
//  Created by Daniel Castro muñoz on 2/5/24.
//

import SwiftUI

enum Theme {
    // Fonts
    enum Font {
        static var normal12: SwiftUI.Font = .system(size: 12, weight: .regular)
        static var normal14: SwiftUI.Font = .system(size: 14, weight: .regular)
        static var normal20: SwiftUI.Font = .system(size: 20, weight: .regular)
        static var bold12: SwiftUI.Font = .system(size: 12, weight: .bold)
        static var bold15: SwiftUI.Font = .system(size: 15, weight: .bold)
        static var bold25: SwiftUI.Font = .system(size: 25, weight: .bold)
        static var bold35: SwiftUI.Font = .system(size: 35, weight: .bold)
        static var bold85: SwiftUI.Font = .system(size: 85, weight: .bold)
        static var bold15monospaced: SwiftUI.Font = .system(size: 15, weight: .bold, design: .monospaced)
        static var bold30monospaced: SwiftUI.Font = .system(size: 30, weight: .bold, design: .monospaced)
        static var bold25monospaced: SwiftUI.Font = .system(size: 25, weight: .bold, design: .monospaced)
        
        
    }
    
    // Button
    enum Button {
        
        static var normalHeight: CGFloat = 48
        static var smallHeight: CGFloat = 40
        static var radius: CGFloat = 8
        static var chipRadius: CGFloat = 64
        static var foregroundOpacity: CGFloat = 0.38
        static var firstShadowOpacity: CGFloat = 0.15
        static var secondShadowOpacity: CGFloat = 0.3
        static var firstShadowRadius: CGFloat = 3
        static var secondShadowRadius: CGFloat = 2
        static var loadingOpacity: CGFloat = 0.5
    }
    
    // Spacing
    enum Spacing {
        /// 2
        static var space_0_25: CGFloat = 2
        /// 4
        static var space_0_5: CGFloat = 4
        /// 8
        static var space_1: CGFloat = 8
        /// 12
        static var space_1_5: CGFloat = 12
        /// 16
        static var space_2: CGFloat = 16
        /// 24
        static var space_3: CGFloat = 24
        /// 32
        static var space_4: CGFloat = 32
        /// 40
        static var space_5: CGFloat = 40
        /// 48
        static var space_6: CGFloat = 48
        /// 64
        static var space_8: CGFloat = 64
        /// 80
        static var space_10: CGFloat = 80
    }
    
    // Radius
    enum Radius {
        /// 4
        static var extraSmall: CGFloat = 4
        /// 8
        static var small: CGFloat = 8
        /// 16
        static var medium: CGFloat = 16
        /// 24
        static var large: CGFloat = 24
        /// 32
        static var extraLarge: CGFloat = 32
    }
    
    // Elevation
    enum Elevation {
        
        static var baseShadowOpacity: CGFloat = 0.3
        static var baseShadowRadius: CGFloat = 1

        static func shadowRadius(_ elevation: ElevationModifier.Level) -> CGFloat {
            let radius: CGFloat
            switch elevation {
            case .e1:
                radius = 1
            case .e2:
                radius = 5
            case .e3:
                radius = 12
            case .e4:
                radius = 18
            case .e5:
                radius = 28
            default:
                radius = 0
            }
            return radius
        }

        static func shadowOffset(_ elevation: ElevationModifier.Level) -> (CGFloat, CGFloat) {
            let offset: (CGFloat, CGFloat)
            switch elevation {
            case .e1:
                offset = (0, 1)
            case .e2:
                offset = (0, 3)
            case .e3:
                offset = (0, 8)
            case .e4:
                offset = (0, 10)
            case .e5:
                offset = (0, 18)
            default:
                offset = (0, 0)
            }
            return offset
        }

        static func shadowOpacity(_ elevation: ElevationModifier.Level) -> CGFloat {
            let opacity: CGFloat
            switch elevation {
            case .e1:
                opacity = 0.25
            case .e2:
                opacity = 0.20
            case .e3, .e4, .e5:
                opacity = 0.15
            default:
                opacity = 0
            }
            return opacity
        }
    }
    
    // Toolbar
    enum Toolbar {
        
        static var iconPadding: CGFloat = 10
        static var iconSize: CGFloat = 24
        static var logoWidth: CGFloat = 47
        static var logoHeigh: CGFloat = 40
        static var buttonItemSize: CGFloat = 24
        static var buttonItemPadding: CGFloat = 12
        static var imageIconSize: CGFloat = 32
        static var menuButtonSize: CGFloat = 44
        static var paddingCorrector: CGFloat = 8
    }
}

