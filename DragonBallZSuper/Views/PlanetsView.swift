//
//  PlanetsView.swift
//  DragonBallZSuper
//
//  Created by Alfonso Dominguez on 20/11/24.
//

import SwiftUI
struct PlanetsView: View {
    @State private var showActionSheet = false
    @State var itemsPlanet: ItemsPlanet? = nil
    @State var currentCharacter: Int = 0
    
    var body: some View {
        ZStack {
            Image("planetBackgroud") // Asegúrate de usar el nombre de la imagen como string
                .resizable()
                .opacity(0.5)
                .background(.black)
            
            VStack{
                ToolbarView(showActionSheet: $showActionSheet, showSearchButton: false)
                
                VStack {
                    if let itemsPlanet = itemsPlanet, !itemsPlanet.items.isEmpty, currentCharacter < itemsPlanet.items.count {
                        let planet = itemsPlanet.items[currentCharacter]
                        
                        ImageView(characterImage: planet.image, totalItems: itemsPlanet.items.count, currentCharacter: $currentCharacter)
                        
                        VStack {
                            Text(planet.name)
                                .font(Font.custom("Aldrich", size: 40))
                                .textCase(.uppercase)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.horizontal)
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                            
                            Text(planet.description)
                                .font(Font.custom("Aldrich", size: 15))
                                .foregroundColor(.white)
                                .frame(maxHeight: 190, alignment: .topLeading)
                                .padding(.horizontal)
                        }
                    } else {
                        Text("Cargando planetas...")
                            .foregroundColor(.gray)
                            .font(.headline)
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() ) {
                    Task {
                        let resourceItemsPlanet = await PlanetViewModel().getAllPlanet()
                        withAnimation {
                            itemsPlanet = resourceItemsPlanet.getData()
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
    PlanetsView()
}
