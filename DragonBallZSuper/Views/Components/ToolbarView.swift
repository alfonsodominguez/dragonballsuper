//
//  ToolbarView.swift
//  DragonBallZSuper
//
//  Created by Alfonso Dominguez on 20/11/24.
//

import SwiftUI

struct ToolbarView: View {
    @Binding var showActionSheet: Bool
    var showSearchButton: Bool = false
    var body: some View {
        ZStack{
            HStack {
                Image(.icon)
                    .resizable()
                    .frame(width: 200, height: 100, alignment: .center)
            }
            .frame(maxWidth: .infinity)
            if showSearchButton {
                HStack{
                    Button(action:{
                        showActionSheet = true
                    }, label: {
                        Image(systemName: "magnifyingglass.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.primaryOrange)
                            .frame(height: 35)
                    })
                
             
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .topTrailing)
        }
           
            
        }
    }
}

#Preview {
}
