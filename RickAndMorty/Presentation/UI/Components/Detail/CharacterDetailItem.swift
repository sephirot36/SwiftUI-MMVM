//
//  CharacterDetailItem.swift
//  RickAndMorty
//
//  Created by Daniel Castro muñoz on 2/5/24.
//

import SwiftUI

struct CharacterDetailItem: View {
    
    private let pokemonImageSize: CGFloat = 250
    private let imagePlaceholderOpacity: CGFloat = 0.5
    private let backgroundImageSize: CGFloat = 300
    private let backgroundImageOpacity: CGFloat = 0.3
    private let dataContainerHeight: CGFloat = 0.4
    private let backgroundOpacity: CGFloat = 0.5
    
    let viewModel: CharacterDetailItemViewModel
    
    var body: some View {
        GeometryReader { metrics in
            ZStack(alignment: .top) {
                backgroundImage
                VStack(alignment: .center, spacing: 0) {
                    characterImage
                    name
                    Spacer()
                }
                
                VStack {
                    Spacer()
                    ZStack {
                        Rectangle()
                            .foregroundColor(.white)
                            .ignoresSafeArea()
                        .padding(.top, Theme.Spacing.space_8)
                        stats
                    }
                    .frame(height: metrics.size.height * dataContainerHeight)
                }
                
            }
            .background(.gray.opacity(backgroundOpacity))
        }
    }
    
    var name: some View {
        Text(viewModel.name.firstUppercased)
            .font(Theme.Font.bold35)
            .foregroundColor(.black)
    }
    
    var backgroundImage: some View {
        Image("pokeball")
            .resizable()
            .renderingMode(.template)
            .foregroundColor(.white)
            .frame(width: backgroundImageSize, height: backgroundImageSize)
            .opacity(backgroundImageOpacity)
    }
    
    var stats: some View {
        HStack(alignment: .center) {
            Spacer()
        }
    }
    
    var characterImage: some View {
        Image.cachedURL(URL(string: viewModel.image))
            .placeholder {
                Image("pokeball")
                    .resizable()
                    .opacity(imagePlaceholderOpacity)
                    .frame(width: pokemonImageSize, height: pokemonImageSize)
            }
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: pokemonImageSize, height: pokemonImageSize)
    }

}

