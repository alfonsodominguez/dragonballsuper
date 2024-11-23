//
//  CarouselImageView.swift
//  DragonBallZSuper
//
//  Created by Alfonso Dominguez on 23/11/24.
//

import SwiftUI

struct CarouselImageView: View {
    let characterImage: String
    let totalItems: Int
    @Binding var currentCharacter: Int
    var body: some View {
        HStack{
            ZStack{
                AsyncImage(url: URL(string: characterImage)) { image in
                    image.image?
                        .resizable()
                        .scaledToFit()
                        .frame(height: 400)
                        .clipped()
                }.frame(minHeight: 400, maxHeight: 400)
                Button(action:{
                    currentCharacter -= 1
                    if currentCharacter < 0{
                        currentCharacter = totalItems - 1
                    }
                }, label: {
                    VStack{
                        Image(systemName: "chevron.left")
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 20)
                            .foregroundColor(.white)
                    }
                }).frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)
                
                Button(action:{
                    currentCharacter += 1
                    if currentCharacter >= totalItems  {
                        currentCharacter = 0
                    }
                }, label: {
                    VStack{
                        Image(systemName: "chevron.right")
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 20)
                            .foregroundColor(.white)
                    }
                }).frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 20)
            }.padding(.top,5)
            
        }
    }
}

#Preview {
    @State var currentCharacter: Int = 0
    CarouselImageView(characterImage: "https://dragonball-api.com/characters/goku_normal.webp", totalItems: 1, currentCharacter: $currentCharacter)
}
