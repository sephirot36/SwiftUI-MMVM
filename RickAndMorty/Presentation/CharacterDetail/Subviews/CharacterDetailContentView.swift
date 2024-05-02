//
//  CharacterDetailContentView.swift
//  RickAndMorty
//
//  Created by Daniel Castro muñoz on 2/5/24.
//

import SwiftUI

struct CharacterDetailContentView<ViewModel: CharacterDetailViewModel>: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            CharacterDetailItem(viewModel: viewModel.characterDetail.character)
        }
    }
}
