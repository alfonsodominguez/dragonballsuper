//
//  PrincipalView.swift
//  DragonBallZSuper
//
//  Created by Alfonso Dominguez on 20/11/24.
//

import SwiftUI

struct PrincipalView: View {
    @State var itemsCharacter: ItemsCharacter?
    
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        VStack{
            TabView(selection: $selectedIndex) {
                HomeView(itemCharacter: itemsCharacter)
                    .tabItem {
                        Image(systemName: "person.3")
                        Text("Personajes")
                    }
                    .tag(0)
                TransformationsView()
                    .tabItem {
                        Image(systemName: "figure.stand.line.dotted.figure.stand")
                        Text("Transformaciones")
                    }
                    .tag(1)
                
                PlanetsView()
                    .tabItem {
                        Image(systemName: "globe.americas.fill")
                        Text("Planetas")
                    }
                    .tag(2)
                
                
            }
            .accentColor(.primaryOrange)
            .foregroundColor(.primaryBlack)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ContentView()
}
