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
    
    let space_16: CGFloat = 16
    
    let viewModel: CharacterListItemViewModel
    let onTap: () -> Void
    let onDelete: () -> Void
    
    var body: some View {
        ZStack {
            background
            content
        }
        .frame(maxWidth: .infinity)
        .onTapGesture {
            onTap()
        }
        .onLongPressGesture {
            onDelete()
        }
    }
    
    var background: some View {
        Rectangle()
            .foregroundColor(.gray)
            .frame(height: rowSizeHeight)
            // .cornerRadius(32)
    }
    
    var content: some View {
        HStack(spacing: space_16) {
            picture
            Spacer()
            name
            Spacer()
        }
        .frame(height: rowSizeHeight)
        .padding(.horizontal, space_16)
    }
    
    var name: some View {
        Text(viewModel.name)
            .font(.system(size: 12, weight: .bold))
            .foregroundColor(.white)
    }
    
    var picture: some View {
        Image.cachedURL(URL(string: viewModel.image))
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: avatarSize, height: avatarSize)
    }

}
