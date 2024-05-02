//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Daniel Castro muñoz on 1/5/24.
//

import SwiftUI
import SwiftData

struct CharacterListView<ViewModel: CharacterListViewModel>: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            switch viewModel.screenState {
            case .loading:
                loading
            case .error:
                emptyList // PokemonListErrorView<Presenter>()
            case .empty:
                emptyList
            case .content:
                CharacterListContentView<ViewModel>()
            }
        }
    }
    
    var loading: some View {
        VStack {
            Text("Loading")
                .font(.system(size: 15, weight: .bold))
                .foregroundColor(.black)
        }
    }
    
    var emptyList: some View {
        VStack {
            Text("There are not Pokemons on the list")
                .font(.system(size: 15, weight: .bold))
                .foregroundColor(.black)
        }
    }

}

#Preview {
    ZStack{
        
    }
}
