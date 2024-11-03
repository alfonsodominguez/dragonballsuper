//
//  HomeView.swift
//  DragonBallZSuper
//
//  Created by Alfonso Dominguez on 29/10/24.
//

import SwiftUI

struct HomeView: View {
    @State var itemCharacter: ItemsCharacter
    @State var currentCharacter: Int = 0
    
    var body: some View {
        ZStack{
            let character = itemCharacter.items[currentCharacter]
            Image(.kamiHouse)
                .resizable()
                .opacity(0.3).background(.black)
            VStack{
                Image(.icon)
                    .resizable()
                    .frame(width: 200, height: 100, alignment: .center)
  
                VStack{
                    ImageView(characterImage: character.image, totalItems: itemCharacter.items.count, currentCharacter: $currentCharacter)
                    VStack{
                        HStack {
                            VStack{
                                Text(character.race)
                                    .font(Font.custom("Aldrich",size: 30))
                                    .textCase(.uppercase)
                                    .fontWeight(.bold)
                                    .foregroundColor(.primaryYellow)
                                    .padding(.top, 10)
                                    .padding(.horizontal)
                                    .frame(maxWidth: .infinity, alignment: .topLeading)  .lineLimit(1)
                                
                                    .minimumScaleFactor(0.5)
                                Text(character.name)
                                    .font(Font.custom("Aldrich",size: 40))
                                    .textCase(.uppercase)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.horizontal)
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.5)
                            }
                        }
                        Text(character.description)
                            .font(Font.custom("Aldrich",size: 15))
                            .foregroundColor(.white)
                            .frame(maxHeight: 100, alignment: .topLeading)
                            .padding(.horizontal)
                        
                        Button(action: {
                        }, label: {
                            Text("Ver mas")
                                .font(.title3)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 15)
                                .foregroundColor(.black)
                                .background(.primaryOrange)
                                .cornerRadius(4)
                        })
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.horizontal, 20)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                }
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(.top, 50)
            Spacer()
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
        
        
    }
}

struct ImageView: View {
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
                }.frame(minHeight: 400)
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
    ContentView()
}
