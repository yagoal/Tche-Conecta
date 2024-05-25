//
//  HomeView.swift
//  Tchê Conecta
//
//  Created by mateusdias on 25/05/24.
//

import SwiftUI

struct HomeView: View {
    @State private var showAlert = false
    @EnvironmentObject var coordinator: AppCoordinator
    
    let menu: [Menu] = [
        .init(id: "1", title: "Solicitar Serviço", image: "wrench.and.screwdriver.fill"),
        .init(id: "2", title: "Meus Serviços", image: "person.crop.rectangle.stack.fill"),
        .init(id: "3", title: "Chat", image: "ellipsis.bubble.fill"),
        .init(id: "4", title: "Pagamento", image: "creditcard.fill"),
        .init(id: "5", title: "Ranking", image: "person.3.fill")
    ]

    var body: some View {
        VStack(spacing: 50){
            Image("profile")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            
            Text("Fernanda Anjos Rosario")
                .font(.system(size: 16, weight: .semibold))

            VStack {
                ForEach(menu) { menuItem in
                    menuBtn(menu: menuItem, triggerNextView: action(for: menuItem))
                }
            }
            .padding(20)

            VStack(spacing: 20){
                Divider()
                menuBtnLogout(title: "Sair", btncolor: .black, titleColor: .white)
            }
            .padding(20)
        }
        .navigationTitle("Meu Perfil")
        .navigationBarBackButtonHidden(true)
    }

    private func action(for menu: Menu) -> () -> Void {
        switch menu.id {
        case "1", "2", "3", "4", "5":
            return coordinator.showRequestServices
        default:
            return coordinator.showRequestServices
        }
    }

    func menuBtnLogout(title: String, btncolor: Color, titleColor: Color) -> some View {
        Button(action: {
            showAlert = true
        }, label: {
            Label(
                title: { Text(title) },
                icon: { Image(systemName: "") }
            )
            .font(.system(size: 17, weight: .bold))
            .frame(maxWidth: .infinity, alignment: .center)
            .foregroundStyle(titleColor)
            
        })
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
        .tint(btncolor)
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Atenção!"),
                message: Text("Tem certeza que deseja sair do aplicativo ?"),
                primaryButton: .default(Text("Sair")) {
                    coordinator.popToRoot()
                },
                secondaryButton: .default(Text("Não"))
            )
        }
    }
}

extension View {
    func menuBtn(
        menu: Menu,
        btncolor: Color = .menu,
        titleColor: Color = .black,
        triggerNextView: @escaping () -> Void
    ) -> some View {
        return  Button(action: triggerNextView, label: {
            Label(
                title: { Text(menu.title) },
                icon: { Image(systemName: menu.image) }
            )
            .font(.system(size: 17, weight: .bold))
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundStyle(titleColor)
            
            Image(systemName: "chevron.right")
                .foregroundStyle(.black)
            
        })
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
        .tint(btncolor)
        
    }
}

#Preview {
    HomeView()
}
