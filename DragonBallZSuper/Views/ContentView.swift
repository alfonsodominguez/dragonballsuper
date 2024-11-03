//
//  ContentView.swift
//  DragonBallZSuper
//
//  Created by Alfonso Dominguez on 29/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isActive = false
    @State var itemCharacter: ItemsCharacter?
    
    var body: some View {
        VStack{
            if let itemCharacter = itemCharacter{
                HomeView(itemCharacter: itemCharacter)
                    .transition(.opacity)
            } else {
                PrincipalLoadingView().onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        isActive.toggle()
                        Task {
                            let itemsCharacter = await ContentViewModel().getAllCharacter()
                            withAnimation {
                                itemCharacter = itemsCharacter
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
