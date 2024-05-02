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
            Color("R&M-Pink").ignoresSafeArea()
            switch viewModel.screenState {
            case .loading:
                LoadingView()
            case .error:
                emptyList
            case .empty:
                emptyList
            case .content:
                CharacterListContentView<ViewModel>().padding(.top, 40)
            }
        }
        .toolbar(.logo)
        
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
