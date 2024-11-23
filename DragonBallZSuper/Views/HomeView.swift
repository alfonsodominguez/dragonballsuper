//
//  HomeView.swift
//  DragonBallZSuper
//
//  Created by Alfonso Dominguez on 29/10/24.
//

import SwiftUI

struct HomeView: View {
    @State var itemCharacter: ItemsCharacter?
    @State var currentCharacter: Int = 0
    @State private var showActionSheet = false
    @State private var seeMore = false
    @State var searchFilter: String = ""
    @State var seeMoreText: String = "Ver más"
    
    var body: some View {
        ZStack{
            let character: Character = itemCharacter!.items[currentCharacter]
            Image(.kamiHouse)
                .resizable()
                .opacity(0.3).background(.black)
            
            VStack{
                ToolbarView(showActionSheet: $showActionSheet, showSearchButton: true)
                    .sheet(isPresented: $showActionSheet) {
                    SearchView(searchFilter: searchFilter)
                        .background(.white)
                }
                
                ScrollView {
                 
                    VStack{
                        ImageView(characterImage: character.image, totalItems: itemCharacter!.items.count, currentCharacter: $currentCharacter)
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
                                Button(action: {
                                    seeMore.toggle()
                                    seeMoreText = "Ver más"
                                    if seeMore {
                                        seeMoreText = "Ver menos"
                                    }
                                    
                                }, label: {
                                    Text(seeMoreText)
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
                            Text(character.description)
                                .font(Font.custom("Aldrich",size: 15))
                                .foregroundColor(.white)
                                .frame(maxHeight: seeMore ? 400 : 90, alignment: .topLeading)
                                .padding(.horizontal)
                            
                            if seeMore {
                                HStack{
                                    VStack{
                                        Text("Ki base:")
                                            .font(Font.custom("Aldrich",size: 20))
                                            .bold()
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity, maxHeight: 100, alignment: .leading)
                                            .padding(.horizontal)
                                        Text(character.ki)
                                            .font(Font.custom("Aldrich",size: 15))
                                            .foregroundColor(.primaryYellow)
                                            .frame(maxWidth: .infinity, maxHeight: 100, alignment: .leading)
                                            .padding(.horizontal)
                                    }
                                    VStack{
                                        Text("Max Ki:")
                                            .font(Font.custom("Aldrich",size: 20))
                                            .bold()
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity, maxHeight: 100, alignment: .leading)
                                            .padding(.horizontal)
                                        Text(character.maxKi)
                                            .font(Font.custom("Aldrich",size: 15))
                                            .foregroundColor(.primaryYellow)
                                            .frame(maxWidth: .infinity, maxHeight: 100, alignment: .leading)
                                            .padding(.horizontal)
                                    }
                                }
                                Text("Afiliación:")
                                    .font(Font.custom("Aldrich",size: 20))
                                    .bold()
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, maxHeight: 100, alignment: .leading)
                                    .padding(.horizontal)
                                Text(character.affiliation)
                                    .font(Font.custom("Aldrich",size: 15))
                                    .foregroundColor(.primaryYellow)
                                    .frame(maxWidth: .infinity, maxHeight: 100, alignment: .leading)
                                    .padding(.horizontal)
                                    .padding(.bottom, 100)
                            }
                            
                           
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    }.padding()
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

struct SearchView: View {
    var characterImage: String = "https://dragonball-api.com/characters/goku_normal.webp"
    @State var searchFilter: String
    @State private var groupCharacters: [[Character]] = [[]]
    @State private var errorSearch: String?
    var indexChar: Int = 0
    
    var body: some View {
        VStack {
            Text("Busca a tu personaje favorito")
                .font(.headline)
                .foregroundColor(.primaryOrange)
                .padding(.top, 15)
            
            TextField("Buscar...", text: $searchFilter)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .onChange(of: searchFilter){
                    Task{
                        if searchFilter.count > 2 {
                            Task {
                                groupCharacters = await searchCharacters(by: searchFilter)
                            }
                        }
                    }
                }
            ScrollView {
                VStack{
                    if errorSearch != nil {
                        Text(errorSearch!)
                            .font(.subheadline)
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        
                    } else {
                        ForEach(groupCharacters.indices, id: \.self) { index in
                            HStack{
                                ForEach(groupCharacters[index], id: \.self) { character in
                                    Button(action:{}, label: {
                                        VStack{
                                            HStack{
                                                ZStack{
                                                    Rectangle()
                                                        .foregroundColor(.primaryOrange)
                                                        .frame(width: 100, height: 120, alignment: .bottom)
                                                        .cornerRadius(4)
                                                    AsyncImage(url: URL(string: character.image)) { image in
                                                        image.image?
                                                            .resizable()
                                                            .scaledToFill()
                                                            .scaledToFit()
                                                            .frame(height: 150)
                                                            .clipped()
                                                    }
                                                }
                                            }
                                            Text(character.name)
                                                .font(Font.custom("Aldrich",size: 13))
                                                .textCase(.uppercase)
                                                .fontWeight(.bold)
                                                .foregroundColor(.black)
                                                .padding(.horizontal)
                                                .padding(.top, 0)
                                                .frame(width: 100, alignment: .center)
                                                .lineLimit(2)
                                                .fixedSize(horizontal: false, vertical: true)
                                            
                                        }
                                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                                        .padding(.horizontal)
                                    })
                                    
                                }.frame(alignment: .leading)
                            }.frame(maxHeight: .infinity)
                        }
                    }
                }
            }.frame(maxWidth: .infinity)
        }
        .presentationDetents([.large])
        .padding(5)
    }
    
    func searchCharacters(by name: String) async -> [[Character]] {
        let viewModel = HomeViewModel()
        let charsResource = await viewModel.getCharacterByName(name: name)
        if let error = charsResource.getError() {
            errorSearch = error.errorDescription
            return []
        }
        errorSearch = nil
        return viewModel.divideIntoGroups(charsResource.getData()!, groupSize: 3)
    }
    
    
}
#Preview {
    //    HomeView(itemCharacter: ItemsCharacter.sample)
    ContentView()
}
