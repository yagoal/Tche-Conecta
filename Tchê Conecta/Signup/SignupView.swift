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
                habilidadeView
                cadastroFormView
                registerButton
                termosDeServicoView
            }
            .padding(EdgeInsets(top: 0, leading: 24, bottom: 27, trailing: 24))
            .frame(width: 375, alignment: .leading)
            .navigationBarTitle("Cadastre-se", displayMode: .inline)
            .padding(.top, 50)
        }
    }

    private var habilidadeView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Selecione sua habilidade")
                .font(.system(size: 16, weight: .semibold, design: .default))
                .foregroundColor(.black)
            
            SearchableDropdown(searchText: $viewModel.searchText, placeholder: "Profissão", suggestions: viewModel.professions, selectedProfession: $viewModel.selectedProfession)
                .zIndex(1)
        }
    }

    private var cadastroFormView: some View {
        VStack(spacing: 25) {
            CustomTextField(placeholder: "E-mail", text: $viewModel.email)
                .zIndex(0)
            CustomTextField(placeholder: "Usuário", text: $viewModel.username)
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
        }) {
            HStack {
                Spacer()
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                } else {
                    Text("Cadastrar")
                        .font(.system(size: 16, weight: .medium, design: .default))
                        .foregroundColor(.white)
                }
                Spacer()
            }
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(
                title: Text("Sucesso"),
                message: Text("Cadastro realizado com sucesso!"),
                dismissButton: .default(Text("OK")) {
                    coordinator.popToRoot()
                }
            )
        }
        .customButtonStyle()
    }

    private var termosDeServicoView: some View {
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
