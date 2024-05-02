//
//  NavigationToolbar.swift
//  RickAndMorty
//
//  Created by Daniel Castro muñoz on 2/5/24.
//

import SwiftUI

private typealias builder = ToolbarItemsBuilder

struct NavigationToolbar: ViewModifier {
    
    let title: String
    let action: ((_ action: ToolbarAction) -> Void)?
    
    func body(content: Content) -> some View {
        NavigationView {
            content
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        builder.iconButton(
                            buttonImage: Image(systemName: "chevron.left"),
                            buttonAction: .goBack,
                            action: action,
                            paddingEdge: .all
                        )
                    }
                    ToolbarItem(placement: .principal) {
                        builder.toolbarTitle(title, color: .black)
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - Previews

struct NavigationToolbarTestView: View {
    
    var body: some View {
        ZStack {
            Text("NavigationToolbar")
        }
        .toolbar(.backButton) { action in
            print(action)
        }
    }
}

struct NavigationToolbarTestView_Previews: PreviewProvider {
    static var previews: some View {
        DevicesPreview {
            NavigationToolbarTestView()
        }
    }
}
