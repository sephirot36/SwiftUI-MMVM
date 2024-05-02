//
//  LoadingView.swift
//  RickAndMorty
//
//  Created by Daniel Castro muñoz on 2/5/24.
//

import SwiftUI

struct LoadingView: View {
    
    @State private var isRotating = 0.0
    
    var body: some View {
        VStack(spacing: Theme.Spacing.space_2) {
            ZStack {
                Image("loading")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60)
                    .rotationEffect(.degrees(isRotating))
                    .onAppear {
                        withAnimation(.linear(duration: 1)
                            .speed(0.75).repeatForever(autoreverses: true)) {
                                isRotating = 360.0
                            }
                    }
            }
            .padding(.top, Theme.Spacing.space_2)
            Text("Loading")
                .font(Theme.Font.bold25)
                .foregroundColor(Color("R&M-Brown"))
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(Color("R&M-Orange"))
                    .edgesIgnoringSafeArea(.all)
    }
}
