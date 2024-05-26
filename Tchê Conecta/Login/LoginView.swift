//
//  ContentView.swift
//  Tchê Conecta
//
//  Created by Yago Pereira on 25/5/24.
//
import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isLoading = false
    @EnvironmentObject var coordinator: AppCoordinator

    var body: some View {
        VStack(spacing: 30) {
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 300, alignment: .leading)

            VStack(alignment: .leading, spacing: 8) {
                Text("Login")
                    .font(.system(size: 18, weight: .semibold, design: .default))
                    .foregroundColor(.black)
                    .frame(alignment: .leading)

                VStack(spacing: 30) {
                    CustomTextField(placeholder: "email@domain.com", text: $email)
                    CustomPasswordField(placeholder: "Password", text: $password)

                    Button(action: {
                        isLoading = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            isLoading = false
                            coordinator.showHome()
                        }
                    }) {
                        if isLoading {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
                                .background(.black)
                                .cornerRadius(8)
                        } else {
                            HStack {
                                Text("Entrar")
                                    .font(.system(size: 16, weight: .medium, design: .default))
                                    .lineSpacing(22.40)
                                    .foregroundColor(.white)
                            }
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                            .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
                            .background(.black)
                            .cornerRadius(8)
                        }
                    }

                    VStack(spacing: 8) {
                        Button(action: {
                            coordinator.showSignup()
                        }) {
                            Text("Não tem conta? Cadastre-se")
                                .font(.system(size: 14, design: .default))
                                .lineSpacing(21)
                                .foregroundColor(.blue)
                        }

                        Button(action: {
                            // Ação para o botão "Esqueci minha senha"
                        }) {
                            Text("Esqueci minha senha")
                                .font(.system(size: 14, design: .default))
                                .lineSpacing(21)
                                .foregroundColor(.black)
                        }
                    }
                }
            }
            .padding(EdgeInsets(top: 0, leading: 24, bottom: 27, trailing: 24))
            .frame(width: 375, alignment: .leading)
            Spacer()
        }
        .onAppear {
            email = ""
            password = ""
        }
    }
}

#Preview {
    LoginView()
}
