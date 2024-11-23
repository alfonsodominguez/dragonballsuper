//
//  TransformationsView.swift
//  DragonBallZSuper
//
//  Created by Alfonso Dominguez on 20/11/24.
//

import SwiftUI

struct TransformationsView: View {
    @State private var showActionSheet = false
    @State var transformationCharacters: [TransformationCharacter]? = nil
    @State var currentCharacter: Int = 0
    
    var body: some View {
        ZStack {
            Image(.transformationBack)
                .resizable()
                .opacity(0.5)
                .background(.black)
            
            VStack{
                ToolbarView(showActionSheet: $showActionSheet, showSearchButton: false)
                
                VStack {
                    if let transformationCharacter = transformationCharacters, !transformationCharacter.isEmpty, currentCharacter < transformationCharacters!.count {
                        let transformationCharacter = transformationCharacters![currentCharacter]
                        
                        CarouselImageView(characterImage: transformationCharacter.image, totalItems: transformationCharacters!.count, currentCharacter: $currentCharacter)
                        
                        VStack {
                            Text(transformationCharacter.name)
                                .font(Font.custom("Aldrich", size: 40))
                                .textCase(.uppercase)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.horizontal)
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                            HStack {
                                Text("Ki: \(transformationCharacter.ki)")
                                    .font(Font.custom("Aldrich", size: 15))
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, maxHeight: 190, alignment: .topLeading)
                                    .padding(.horizontal)
                                
                            }
                        }
                    } else {
                        Text("Cargando Transformaciones...")
                            .foregroundColor(.gray)
                            .font(.headline)
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() ) {
                    Task {
                        let resourceTransformation = await TransformationViewModel().getTransformations()
                        withAnimation {
                            transformationCharacters = resourceTransformation.getData()
                        }
                    }
                }
            }
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    TransformationsView()
}
