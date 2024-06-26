//
//  SignupView.swift
//  Tchê Conecta
//
//  Created by Yago Pereira on 25/5/24.
//

import SwiftUI

struct SignupView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    @StateObject private var viewModel = SignupViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                skillView
                formView
                registerButton
                termsAndServiceView
            }
            .padding(EdgeInsets(top: 0, leading: 24, bottom: 27, trailing: 24))
            .frame(width: 375, alignment: .leading)
            .navigationBarTitle("Cadastre-se", displayMode: .inline)
            .padding(.top, 50)
        }
    }

    private var skillView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Selecione sua habilidade")
                .font(.system(size: 16, weight: .semibold, design: .default))
                .foregroundColor(.black)
            
            SearchableDropdown(
                searchText: $viewModel.searchText,
                placeholder: "Profissão",
                suggestions: professions,
                selectedProfession: $viewModel.selectedProfession
            )
            .zIndex(1)
        }
    }

    private var formView: some View {
        VStack(spacing: 25) {
            CustomTextField(
                placeholder: "E-mail",
                text: $viewModel.email,
                keyboardType: .emailAddress
            )
            .zIndex(0)

            CustomTextField(placeholder: "Usuário", text: $viewModel.username)
                .zIndex(0)
            
            CustomTextField(
                placeholder: "CPF/CNPJ",
                text: $viewModel.document,
                keyboardType : .numberPad,
                type: .document
            )
            .zIndex(0)

            CustomPasswordField(placeholder: "Senha", text: $viewModel.password)
                .zIndex(0)

            CustomPasswordField(placeholder: "Confirme sua senha", text: $viewModel.confirmPassword)
                .zIndex(0)
        }
    }

    private var registerButton: some View {
        Button(action: {
            viewModel.register()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                coordinator.showSuccess()
            }
        }) {
            HStack {
                Spacer()
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                } else {
                    Text("Cadastrar")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white)
                }
                Spacer()
            }
        }
        .customButtonStyle()
    }


    private var termsAndServiceView: some View {
        Button(action: {
            // Ação para o botão "Termos de Serviço e Política de Privacidade"
        }) {
            Text("Ao clicar, você concorda com nossos Termos de Serviço e Política de Privacidade")
                .font(.system(size: 14, design: .default))
                .foregroundColor(.blue)
                .multilineTextAlignment(.center)
        }
        .padding(.top, 8)
    }
}

#Preview {
    SignupView()
}
