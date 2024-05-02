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
    @State private var isRotating = 0.0
    
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
        .toolbar(.logo)
    }
    
    var loading: some View {
        VStack(spacing: Theme.Spacing.space_2) {
            ZStack {
                Image("loading")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60)
                    .opacity(0.8)
                    .rotationEffect(.degrees(isRotating))
                                .onAppear {
                                    withAnimation(.linear(duration: 1)
                                            .speed(0.75).repeatForever(autoreverses: false)) {
                                        isRotating = 360.0
                                    }
                                }
            }
            .padding(.top, Theme.Spacing.space_2)
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
