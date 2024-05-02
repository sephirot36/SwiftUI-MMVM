//
//  Toolbar.swift
//  RickAndMorty
//
//  Created by Daniel Castro muñoz on 2/5/24.
//

import SwiftUI

extension View {
    
    @ViewBuilder
    func toolbar(
        _ style: ToolbarStyle.Main,
        action: ((_ action: ToolbarAction) -> Void)? = nil
    ) -> some View {
        switch style {
        case .logo:
            modifier(MainLogoToolbar())
        }
    }
    
    @ViewBuilder
    func toolbar(
        _ style: ToolbarStyle.Navigation,
        title: String = "",
        action: ((_ action: ToolbarAction) -> Void)?
    ) -> some View {
        switch style {
        case .backButton:
            modifier(NavigationToolbar(title: title, action: action))
        }
    }
}

enum ToolbarItemsBuilder {
    
    static func iconButton(
        buttonImage: Image,
        buttonAction: ToolbarAction,
        action: ((_ action: ToolbarAction) -> Void)?,
        paddingEdge: Edge.Set,
        isOverDark: Bool = false
    ) -> some View {
        Button {
            action?(buttonAction)
        } label: {
            buttonImage
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.black)
        }
    }
    
    static func toolbarTitle(
        _ title: String,
        color: Color
    ) -> some View {
        Text(title)
            .fixedSize(horizontal: true, vertical: false)
            .font(Theme.Font.bold15)
            .foregroundColor(color)
    }
    
    static func logoIcon(
        logo: Image,
        isOverDark: Bool = false
    ) -> some View {
        logo
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: Theme.Toolbar.logoHeigh)
    }
}

enum ToolbarStyle {
    
    enum Main {
        
        case logo
    }
    
    enum Navigation {
        
        case backButton
    }
}

enum ToolbarAction {
    
    case goBack
}
