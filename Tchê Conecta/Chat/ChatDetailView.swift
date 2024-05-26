//
//  ChatDetailView.swift
//  Tchê Conecta
//
//  Created by mateusdias on 25/05/24.
//

import SwiftUI


struct ChatDetailView: View {
    
    @EnvironmentObject var coordinator: AppCoordinator
    @State private var textMessage: [String] = []
    @State private var newMessage:  String = ""
    var person: Person
    var message: String = ""
    
    init(person: Person, message: String?) {
        self.person = person
        self.message = message ?? ""
    }
    
    var body: some View {
        
        VStack  {
            
            ScrollView {
                if message.count > 0 {
                Text(message)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                Spacer()
                VStack (alignment: .leading){
                    ForEach(textMessage, id: \.self) { message in
                        Text(message)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        
                    }
                }
                
            }.padding(10)
            
            
            HStack(spacing: 10){
                TextField("Digite sua mensagem aqui...", text: $newMessage)
                    .padding()
                    .cornerRadius(10)
                    .background(.clear)
                
                
                
                
                Button(action: {
                    //
                }, label: {
                    Image(systemName: "paperclip")
                    
                    
                })
                
                Button(action: {
                    addMessage()
                }, label: {
                    Image(systemName: "paperplane.circle.fill")
                    
                    
                })
            }.padding(20)
            
            
        }.padding(.bottom, 20)
        
            .navigationBarItems(
                leading:
                    HStack{
                        person.image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                        Text(person.name)
                    },
                trailing: HStack {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "phone")
                    }
                    Button(action: {
                        
                    }) {
                        Image(systemName: "video")
                    }
                }.padding(5)
            )
    }
    
    private func hasAMessage() -> Bool{
        if (message.count > 0) {
            return true
        }
        return false
    }
    
    private func addMessage() {
        if !newMessage.isEmpty {
            textMessage.append(newMessage)
            newMessage = ""
        }
    }
}
//
//#Preview {
//    ChatDetailView(person: Person(id: 1, name: "Fabio", profession: Profession(id: 1, title: "Engenheiro", area: "Mecanica"), image: im, rank: <#T##Int#>))
//}
