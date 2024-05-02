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
                            viewModel.loadCharacterDetail(id: "\(chacractersListItemViewModel.id)")
                        }, onDelete: {}
                    )
                }
            }
            .padding(.all, 16)
        }
        .scrollIndicators(.hidden)
    }
}
