//
//  CharacterDetailItem.swift
//  RickAndMorty
//
//  Created by Daniel Castro muñoz on 2/5/24.
//

import SwiftUI

struct CharacterDetailItem: View {
    
    private let characterImageContainerSize: CGFloat = 210
    private let characterImageSize: CGFloat = 150
    private let imagePlaceholderOpacity: CGFloat = 0.5
    private let backgroundImageOpacity: CGFloat = 0.3
    private let dataContainerHeight: CGFloat = 0.4
    private let backgroundOpacity: CGFloat = 0.5
    
    let viewModel: CharacterDetailItemViewModel
    
    var body: some View {
        VStack(alignment: .center) {
            ZStack(alignment: .top) {
                characterImage
                tapeTopLeft
            }
            .frame(width:characterImageContainerSize, height: characterImageContainerSize)
            name
            Spacer()
            
           
            profileInformation
        }
    }
    
    var name: some View {
        Text(viewModel.name.firstUppercased)
            .font(Theme.Font.bold30monospaced)
            .foregroundColor(Color("R&M-Brown"))
    }
    
    var profileInformation: some View {
        VStack {
            Text("Profile information")
                .font(Theme.Font.bold25monospaced)
                .padding(.top, Theme.Spacing.space_3)
                .foregroundColor(Color("R&M-Brown"))
                .overlay(
                                Rectangle()
                                    .frame(height: 4)
                                    .foregroundColor(Color("R&M-Brown")),
                                alignment: .top
                        )
            List{
                status
                gender
            }
            .listRowSpacing(20.0)
            .scrollContentBackground(.hidden)
            .background(.clear)
           
        }
        //.background(Color("R&M-Yellow"))
    }
    
    var status: some View {
        HStack(alignment: .center) {
            Image(viewModel.status.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                 .clipShape(Circle())
            Text(viewModel.status.rawValue.capitalized)
                .font(Theme.Font.bold25monospaced)
        }
    }
    
    var gender: some View {
        HStack(alignment: .center) {
            Image("\(viewModel.species.rawValue.lowercased())-\(viewModel.gender.rawValue.lowercased())")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                 .clipShape(Circle())
            Text("\(viewModel.gender.rawValue.capitalized) - \(viewModel.species.rawValue)")
                .font(Theme.Font.bold25monospaced)
        }
    }
    
    
    var characterImage: some View {
            Image.cachedURL(URL(string: viewModel.image))
                .placeholder {
                    Image("loading")
                        .resizable()
                        .opacity(imagePlaceholderOpacity)
                        .frame(width: characterImageSize, height: characterImageSize)
                }
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: characterImageSize, height: characterImageSize)
                .border(Color("R&M-Brown"), width: 5)
    }
    
    var tapeTopLeft: some View {
        Image("tape")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: characterImageSize, height: characterImageSize)
            .rotationEffect(Angle(degrees: 230))
            .padding(.horizontal, -1 * characterImageSize + 10)
            .padding(.vertical, -1 * (characterImageSize / 2) + 10)
    }
}

struct CharacterDetailItem_Previews: PreviewProvider {
    static var previews: some View {
        DevicesPreview {
            ZStack {
                CharacterDetailItem(
                    viewModel: CharacterDetailItemViewModel.mock()
                )
            }
        }
    }
}
