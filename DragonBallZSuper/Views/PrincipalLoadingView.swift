//
//  PrincipalLoadingView.swift
//  DragonBallZSuper
//
//  Created by Alfonso Dominguez on 29/10/24.
//

import SwiftUI

struct PrincipalLoadingView: View {
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .clipped()
            VStack{
                ProgressView()
                    .padding(.top, 20)
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(2)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                Text("Loading...")
                    .bold()
                    .font(.title2)
                    .foregroundStyle(.white)
                    .padding()
                Spacer()
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                
        }.ignoresSafeArea()
    }
}

#Preview {
    PrincipalLoadingView()
}
