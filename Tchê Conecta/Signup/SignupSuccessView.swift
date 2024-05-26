//
//  SignupSuccessView.swift
//  Tchê Conecta
//
//  Created by Yago Pereira on 25/5/24.
//

import SwiftUI

struct SignupSuccessView: View {
    @EnvironmentObject var coordinator: AppCoordinator

    var body: some View {
        VStack(spacing: 30) {
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.green)
            
            VStack(spacing: 8) {
                Text("Enviamos um link para seu e-mail cadastrado")
                    .font(.system(size: 18, weight: .semibold))
                    .multilineTextAlignment(.center)
                
                Text("Cheque seu e-mail")
                    .font(.system(size: 16))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal, 40)
            
            Button(action: {
                coordinator.popToRoot()
            }) {
                Text("LOGIN")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 44)
                    .background(Color.black)
                    .cornerRadius(8)
                    .padding(.horizontal, 40)
            }
        }
        .navigationBarBackButtonHidden(true)
        .padding()
    }
}

#Preview {
    SignupSuccessView()
}
