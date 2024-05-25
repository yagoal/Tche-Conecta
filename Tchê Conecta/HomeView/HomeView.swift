//
//  HomeView.swift
//  Tchê Conecta
//
//  Created by mateusdias on 25/05/24.
//


import SwiftUI



struct HomeView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var showAlert = false
    
    
    let menu: [Menu] = [
        .init(title: "Solicitar Serviço", image: "wrench.and.screwdriver.fill"),
        .init(title: "Meus Serviços", image: "person.crop.rectangle.stack.fill"),
        .init(title: "Chat", image: "ellipsis.bubble.fill"),
        .init(title: "Pagamento", image: "creditcard.fill"),
        .init(title: "Ranking", image: "person.3.fill")
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
                
                menuBtn(title: menu[0].title, image: menu[0].image, btncolor: .menu, titleColor: .black, nextView: LoginView())
                menuBtn(title: menu[1].title, image: menu[1].image, btncolor: .menu, titleColor: .black, nextView: LoginView())
                menuBtn(title: menu[2].title, image: menu[2].image, btncolor: .menu, titleColor: .black, nextView: LoginView())
                menuBtn(title: menu[3].title, image: menu[3].image, btncolor: .menu, titleColor: .black, nextView: LoginView())
                menuBtn(title: menu[4].title, image: menu[4].image, btncolor: .menu, titleColor: .black, nextView: LoginView())
                
                
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
    
    func menuBtnLogout(title: String, btncolor: Color, titleColor: Color) -> some View {
        
        return  Button(action: {
            self.showAlert = true
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
                    self.presentationMode.wrappedValue.dismiss()
                },
                secondaryButton: .default(Text("Não"))
            )
        }
    }
    
    
    
}

extension View {
    func menuBtn(title: String, image: String, btncolor: Color, titleColor: Color, nextView: some View) -> some View {
        return NavigationLink(destination: nextView) {
            Label(
                title: { Text(title) },
                icon: { Image(systemName: image) }
            )
            .font(.system(size: 17, weight: .bold))
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundStyle(titleColor)
            
            Image(systemName: "chevron.right")
                .foregroundStyle(.black)
            
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
        .tint(btncolor)
    }
    
    
    
    
    
}


#Preview {
    HomeView()
}
