//
//  CharacterListContentView.swift
//  RickAndMorty
//
//  Created by Daniel Castro muñoz on 1/5/24.
//

import SwiftUI

struct CharacterListContentView<ViewModel: CharacterListViewModel>: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 5) {
                ForEach(viewModel.chacractersList.characters, id: \.id) { chacractersListItemViewModel in
                    CharacterListItem(
                        viewModel: chacractersListItemViewModel,
                        onTap: {
                            // presenter.loadPokemonDetail(id: pokemonListItemViewModel.number)
                        }, onDelete: {}
                    )
                }
            }
            .padding(.all, 16)
        }
    }
}
/*
struct CharacterListContentView_Previews: PreviewProvider {
    static var previews: some View {
        let pokemonList = [Pokemon.mock()]
        let presenter: PokemonListPresenterMock = PokemonListPresenterMock(pokemonList: pokemonList)
        DevicesPreview {
            ZStack {
                PokemonListContentView<PokemonListPresenterMock>()
                    .environmentObject(presenter)
            }
        }
    }
     
}
 */
