//
//  CharacterDetailView.swift
//  RickAndMorty
//
//  Created by Daniel Castro muñoz on 2/5/24.
//

import SwiftUI
import SwiftData

struct CharacterDetailView<ViewModel: CharacterDetailViewModel>: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            Color("R&M-Orange").ignoresSafeArea()
            switch viewModel.screenState {
            case .loading:
                loading
            case .error:
                emptyList
            case .empty:
                emptyList
            case .content:
                CharacterDetailContentView<ViewModel>()
            }
        }
        .toolbar(.backButton, title: "") { _ in
            viewModel.goBack()
        }
    }
    
    var loading: some View {
        VStack {
            Image("loading")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.white)
                .frame(width: 60)
                .opacity(0.8)
            Text("Loading")
                .font(.system(size: 15, weight: .bold))
                .foregroundColor(.black)
        }
    }
    
    var emptyList: some View {
        VStack {
            Text("There are not Character info")
                .font(.system(size: 15, weight: .bold))
                .foregroundColor(.black)
        }
    }

}

#Preview {
    ZStack{
        
    }
}

