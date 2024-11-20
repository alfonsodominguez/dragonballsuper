//
//  ContentView.swift
//  DragonBallZSuper
//
//  Created by Alfonso Dominguez on 29/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isActive = false
    @State var resource: Resource<ItemsCharacter>?
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.primaryBlack
        UITabBar.appearance().barTintColor = UIColor.primaryBlack
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
    }
    
    var body: some View {
        VStack{
            if let resource = resource{
                PrincipalView(itemsCharacter: resource.getData())
                    .transition(.opacity)
            } else {
                PrincipalLoadingView().onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        isActive.toggle()
                        Task {
                            let resourceItemsCharacter = await ContentViewModel().getAllCharacter()
                            withAnimation {
                                resource = resourceItemsCharacter
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
