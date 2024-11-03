//
//  SearchView.swift
//  DragonBallZSuper
//
//  Created by Alfonso Dominguez on 29/10/24.
//

import SwiftUI

struct SearchView: View {
    @State var searchText: String = ""
    var body: some View {
        VStack{
            HStack(alignment: .top) {
              Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(.primaryOrange)
                TextField("", text: $searchText)
                    .foregroundColor(.white)
            }
            .padding()
            .overlay(
              RoundedRectangle(cornerRadius: 8)
                .stroke(.primaryOrange, lineWidth: 1)
            )
            .padding()
            .frame(alignment: .top)
            Spacer()
            VStack{
                
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.primaryBlue)
    }
}

#Preview {
    SearchView()
}
