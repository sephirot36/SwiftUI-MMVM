//
//  CharacterListItem.swift
//  RickAndMorty
//
//  Created by Daniel Castro muñoz on 1/5/24.
//

import SwiftUI

struct CharacterListItem: View {

    private let avatarSize: CGFloat = 90
    private let rowSizeHeight: CGFloat = 90
    
    let viewModel: CharacterListItemViewModel
    let onTap: () -> Void
    
    var body: some View {
        ZStack {
            background
            content
        }
        .frame(maxWidth: .infinity)
        .onTapGesture {
            onTap()
        }
    }
    
    var background: some View {
        Rectangle()
            .foregroundColor(Color("R&M-Orange"))
            .frame(height: rowSizeHeight)
            .cornerRadius(avatarSize)
    }
    
    var content: some View {
        HStack(spacing: Theme.Spacing.space_2) {
            picture
            name
            Spacer()
            portal
        }
        .frame(height: rowSizeHeight)
    }
    
    var name: some View {
        Text(viewModel.name)
            .font(Theme.Font.bold15monospaced)
            .foregroundColor(Color("R&M-Brown"))
    }
    
    var picture: some View {
        Image.cachedURL(URL(string: viewModel.image))
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: avatarSize, height: avatarSize)
             .clipShape(Circle())
    }
    
    var portal: some View {
        Image("portal")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: avatarSize, height: avatarSize)
             .clipShape(Circle())
             .opacity(0.3)
    }

}

struct CharacterListItem_Previews: PreviewProvider {
    static var previews: some View {
        DevicesPreview {
            ZStack {
                CharacterListItem(
                    viewModel: CharacterListItemViewModel.mock(),
                    onTap: {}
                )
            }
        }
    }
}
