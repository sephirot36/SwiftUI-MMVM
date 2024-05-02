//
//  MainLogoToolbar.swift
//  RickAndMorty
//
//  Created by Daniel Castro muñoz on 2/5/24.
//

import SwiftUI

private typealias builder = ToolbarItemsBuilder

struct MainLogoToolbar: ViewModifier {
    
    func body(content: Content) -> some View {
        NavigationView {
            content
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        builder.logoIcon(
                            logo: Image("logo")
                        )
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - Previews

struct MainLogoToolbarTestView: View {
    
    var body: some View {
        ZStack {
            Text("MainLogoToolbar")
        }
        .toolbar(.logo)
    }
}

struct MainToolbarTestView_Previews: PreviewProvider {
    static var previews: some View {
        DevicesPreview {
            MainLogoToolbarTestView()
        }
    }
}
