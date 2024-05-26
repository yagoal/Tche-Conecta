//
//  MyServicesView.swift
//  Tchê Conecta
//
//  Created by Yago Pereira on 25/5/24.
//

import SwiftUI

struct Notification: Identifiable {
    let id = UUID()
    let serviceName: String
    let location: String
    let status: String
    let sender: String
}

struct RecentService: Identifiable {
    let id = UUID()
    let date: String
    let services: [Service]
}

struct Service: Identifiable {
    let id = UUID()
    let name: String
    let priceOrTime: String
}

struct MyServicesView: View {
    let recentServices: [RecentService] = [
        RecentService(date: "Sexta-feira - 17/06/2023", services: [
            Service(name: "Serviço #123", priceOrTime: "R$ 31.23"),
            Service(name: "Serviço #795", priceOrTime: "01:00 hora")
        ]),
        RecentService(date: "Sábado - 18/06/2023", services: [
            Service(name: "Serviço #143", priceOrTime: "R$ 52.90"),
            Service(name: "Serviço #712", priceOrTime: "06:00 horas")
        ])
    ]

    let notifications: [Notification] = [
        Notification(serviceName: "Serviço 1", location: "Porto Alegre, RS, Brasil", status: "pending", sender: "João da Silva"),
        Notification(serviceName: "Serviço 2", location: "Caxias do Sul, RS, Brasil", status: "pending", sender: "Maria Oliveira"),
        Notification(serviceName: "Serviço 3", location: "Pelotas, RS, Brasil", status: "pending", sender: "Carlos Souza"),
        Notification(serviceName: "Serviço 4", location: "Santa Maria, RS, Brasil", status: "pending", sender: "Ana Paula")
    ]

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24) {
                recentServicesSection
                notificationsSection
                startServiceSection
            }
        }
        .navigationBarTitle("Meus Serviços", displayMode: .inline)
        .padding()
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

    private var notificationsSection: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Notificações")
                .font(.system(size: 18, weight: .bold))
            VStack {
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
                        Text("Você tem mais 3 trocas nesse mês")
                            .font(.caption)
                            .padding(.horizontal)
                    }
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
                    .frame(width: geometry.size.width, alignment: .leading)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                }
            }

            Spacer(minLength: 24)

            ForEach(notifications) { notification in
                makeNotificationCard(notification)
            }
        }
    }

    private var startServiceSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Iniciar o serviço")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.gray)
            Text("Clique no menu")
                .font(.system(size: 14))
                .foregroundColor(.gray)
            Image(systemName: "map.fill")
                .font(.system(size: 24))
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(8)
    }

    private func makeNotificationCard(_ notification: Notification) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(notification.sender)
                    .font(.system(size: 16, weight: .bold))
                
                HStack {
                    Button(action: {
                        // Aceitar ação
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
                        // Negar ação
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
                
                Text(notification.location)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
            Spacer()
            Button(action: {
                // Chat action
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
}

#Preview {
    MyServicesView()
}
