//
//  MyServicesView.swift
//  Tchê Conecta
//
//  Created by Yago Pereira on 25/5/24.
//

import SwiftUI

struct MyServicesView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    
    @State private var showingAlert = false
    @State private var isAccepting = false
    @State private var currentNotification: Notification?

    @State private var recentServices: [RecentService] = [
        RecentService(date: "sexta-feira, 25 de maio de 2024", services: [
            Service(name: "Serviço #123", priceOrTime: "R$ 31.23"),
            Service(name: "Serviço #795", priceOrTime: "01:00 hora")
        ]),
        RecentService(date: "quinta-feira, 24 de maio de 2024", services: [
            Service(name: "Serviço #143", priceOrTime: "R$ 52.90"),
            Service(name: "Serviço #712", priceOrTime: "06:00 horas")
        ])
    ]

    private let professions: [Profession] = [
        Profession(id: 1, title: "Pedreiro", area: "Paredes e Estrutura"),
        Profession(id: 2, title: "Pedreiro", area: "Instalação Portas e Janelas"),
        Profession(id: 3, title: "Pedreiro", area: "Pisos em geral"),
        Profession(id: 4, title: "Pedreiro", area: "Instalação Telhado e Telhas"),
        Profession(id: 5, title: "Eletricista", area: "Sistemas prediais"),
        Profession(id: 6, title: "Eletricista", area: "Sistemas industriais"),
        Profession(id: 7, title: "Cabeleireira", area: "Serviços de Beleza"),
        Profession(id: 8, title: "Manicure", area: "Manutenção e Limpeza"),
    ]

    @State private var notifications: [Notification] = []

    init() {
        let notificationPersons: [Person] = [
            .init(id: 1, name: "Mário", profession: professions[0], image: Image(systemName: "person.crop.circle.fill"), rank: 3),
            .init(id: 2, name: "Elias", profession: professions[7], image: Image(systemName: "person.crop.circle.fill"), rank: 2),
            .init(id: 3, name: "Amara", profession: professions[2], image: Image(systemName: "person.crop.circle.fill"), rank: 1),
            .init(id: 4, name: "Cristiana", profession: professions[6], image: Image(systemName: "person.crop.circle.fill"), rank: 4),
            .init(id: 5, name: "Daniel", profession: professions[5], image: Image(systemName: "person.crop.circle.fill"), rank: 5)
        ]

        _notifications = State(initialValue: [
            Notification(serviceName: "Design de Parede", location: "Porto Alegre, RS, Brasil", status: "pending", sender: notificationPersons[0]),
            Notification(serviceName: "Design de Parede", location: "Caxias do Sul, RS, Brasil", status: "pending", sender: notificationPersons[1]),
            Notification(serviceName: "Design de Piso", location: "Pelotas, RS, Brasil", status: "pending", sender: notificationPersons[2]),
            Notification(serviceName: "Design de Piso", location: "Santa Maria, RS, Brasil", status: "pending", sender: notificationPersons[3])
        ])
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24) {
                recentServicesSection
                tradesSection
                notificationsSection
            }
        }
        .navigationBarTitle("Meus Serviços", displayMode: .inline)
        .padding()
        .alert(isPresented: $showingAlert) {
            if isAccepting {
                return Alert(
                    title: Text("Aceitar Serviço"),
                    message: Text("Deseja iniciar o serviço agora?"),
                    primaryButton: .default(Text("Iniciar")) {
                        acceptService()
                    },
                    secondaryButton: .cancel()
                )
            } else {
                return Alert(
                    title: Text("Rejeitar Serviço"),
                    message: Text("Tem certeza que deseja rejeitar?"),
                    primaryButton: .destructive(Text("Rejeitar")) {
                        declineService()
                    },
                    secondaryButton: .cancel()
                )
            }
        }
    }

    private var recentServicesSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Solicitações Recentes")
                    .font(.system(size: 18, weight: .bold))
                Spacer()
                Text("Ver todos")
                    .foregroundColor(.blue)
            }
            .padding(.horizontal, 8)
            
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(recentServices) { recentService in
                        VStack(alignment: .leading, spacing: 8) {
                            GeometryReader { geometry in
                                Text(recentService.date)
                                    .font(.system(size: 14, weight: .bold))
                                    .foregroundColor(.blue)
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 8)
                                    .frame(width: geometry.size.width, alignment: .leading)
                                    .background(Color(.systemGray6))
                                    .cornerRadius(8)
                            }
                            .frame(height: 40)
                            
                            ForEach(recentService.services) { service in
                                VStack {
                                    HStack {
                                        Image(systemName: "ticket.fill")
                                            .foregroundColor(.blue)
                                            .padding(.horizontal, 8)

                                        Text(service.name)
                                        Spacer()
                                        Text(service.priceOrTime)
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                    Divider()
                                }

                            }
                        }
                        .padding(.bottom)
                    }
                }
                .padding(.horizontal, 8)
            }
            .frame(maxHeight: 200)
        }
    }

    private var tradesSection: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Trocas")
                .font(.system(size: 18, weight: .bold))
            
            GeometryReader { geometry in
                HStack {
                    ZStack {
                        Circle()
                            .trim(from: 0, to: 0.3)
                            .stroke(Color.orange, lineWidth: 8)
                            .frame(width: 50, height: 50)
                            .rotationEffect(.degrees(-90))
                        
                        Circle()
                            .trim(from: 0.3, to: 1)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 8)
                            .frame(width: 50, height: 50)
                            .rotationEffect(.degrees(-90))
                        
                        Text("30%")
                            .font(.caption)
                    }
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Você usou 30% das suas trocas disponíveis neste mês")
                            .font(.caption)
                            .padding(.horizontal)
                        Text("3 de 10 trocas")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                    }
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .frame(width: geometry.size.width, alignment: .leading)
                .background(Color(.systemGray6))
                .cornerRadius(8)
            }
            .frame(height: 80)
            
            HStack {
                VStack {
                    Circle()
                        .fill(Color.orange)
                        .frame(width: 16, height: 16)
                    Text("Usadas")
                        .font(.caption)
                }
                VStack {
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 16, height: 16)
                    Text("Disponíveis")
                        .font(.caption)
                }
            }
        }
    }

    private var notificationsSection: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Notificações")
                .font(.system(size: 18, weight: .bold))

            ForEach(notifications) { notification in
                makeNotificationCard(notification)
            }
        }
    }

    private func makeNotificationCard(_ notification: Notification) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(notification.sender.name)
                    .font(.system(size: 16, weight: .bold))
                
                Text(notification.serviceName)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)

                Text(notification.location)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                
                HStack {
                    Button(action: {
                        showAcceptAlert(notification: notification)
                    }) {
                        Text("aceitar")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.blue)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(4)
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(8)
                    
                    Button(action: {
                        showDeclineAlert(notification: notification)
                    }) {
                        Text("negar")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.red)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(4)
                    .background(Color.red.opacity(0.1))
                    .cornerRadius(8)
                }
            }
            Spacer()
            Button(action: {
                coordinator.showChat(person: notification.sender, message: "Bom dia")
            }) {
                Image(systemName: "ellipsis.bubble.fill")
                    .font(.system(size: 24))
                    .foregroundColor(.blue)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(8)
    }

    private func showAcceptAlert(notification: Notification) {
        currentNotification = notification
        isAccepting = true
        showingAlert = true
    }

    private func showDeclineAlert(notification: Notification) {
        currentNotification = notification
        isAccepting = false
        showingAlert = true
    }

    private func acceptService() {
        guard let currentNotification = currentNotification else { return }
        
        // Adicionar serviço aceito à lista de serviços recentes
        let newService = Service(name: currentNotification.serviceName, priceOrTime: "R$ 200,00")
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "pt_BR")
        let currentDate = dateFormatter.string(from: Date())
        
        if let index = recentServices.firstIndex(where: { $0.date == currentDate }) {
            recentServices[index].services.append(newService)
        } else {
            let newRecentService = RecentService(date: currentDate, services: [newService])
            recentServices.insert(newRecentService, at: 0) // Adiciona no topo
        }
        
        // Remover notificação
        notifications.removeAll { $0.id == currentNotification.id }
        
        // Limpar estado atual
        self.currentNotification = nil
        self.showingAlert = false
    }

    private func declineService() {
        guard let currentNotification = currentNotification else { return }
        
        // Remover notificação
        notifications.removeAll { $0.id == currentNotification.id }
        
        // Limpar estado atual
        self.currentNotification = nil
        self.showingAlert = false
    }
}

#Preview {
    MyServicesView()
}
