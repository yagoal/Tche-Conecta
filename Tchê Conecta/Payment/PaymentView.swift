//
//  PaymentView.swift
//  Tchê Conecta
//
//  Created by Yago Pereira on 26/5/24.
//

import SwiftUI

struct PaymentView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    @State private var selectedPeriod: String? = nil
    @State private var searchText = ""
    
    let periods = ["Todos", "Mês", "Dia", "Semana"]
    let balance = "R$ 2.020,99"

    var transfers: [Transfer] {
        [
            Transfer(person: persons[0], email: "email@fakedomain.net", amount: "R$ 200,00", date: formatDate(-2)),
            Transfer(person: persons[1], email: "email@fakedomain.net", amount: "R$ 150,00", date: formatDate(0)),
            Transfer(person: persons[2], email: "email@fakedomain.net", amount: "R$ 180,00", date: formatDate(-30)),
            Transfer(person: persons[3], email: "djpark@gmail.com", amount: "R$ 220,00", date: formatDate(-15)),
            Transfer(person: persons[4], email: "rojasmar@skiff.com", amount: "R$ 170,00", date: formatDate(-10)),
            Transfer(person: persons[5], email: "rojasmar@skiff.com", amount: "R$ 320,00", date: formatDate(-17))
        ]
    }

    var filteredTransfers: [Transfer] {
        let calendar = Calendar.current
        let now = Date()
        
        switch selectedPeriod {
        case "Dia":
            return transfers.filter { calendar.isDate($0.dateRaw, inSameDayAs: now) }
        case "Semana":
            return transfers.filter { calendar.isDate($0.dateRaw, equalTo: now, toGranularity: .weekOfYear) }
        case "Mês":
            return transfers.filter { calendar.isDate($0.dateRaw, equalTo: now, toGranularity: .month) }
        case "Todos":
            return transfers.sorted { $0.dateRaw > $1.dateRaw }
        default:
            return transfers
        }
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                HStack {
                    ForEach(periods, id: \.self) { period in
                        Button(action: {
                            withAnimation {
                                selectedPeriod = selectedPeriod == period ? nil : period
                            }
                        }) {
                            Text(period)
                                .font(.system(size: 14, weight: .bold))
                                .padding()
                                .background(selectedPeriod == period ? Color.blue : Color.gray.opacity(0.2))
                                .foregroundColor(selectedPeriod == period ? Color.white : Color.black)
                                .cornerRadius(8)
                        }
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("Saldo")
                        .font(.system(size: 16, weight: .bold))
                    Text(balance)
                        .font(.system(size: 24, weight: .bold))
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Transferências Recentes")
                        .font(.system(size: 16, weight: .bold))
                    
                    if filteredTransfers.isEmpty {
                        Text("Você não tem transferências para este \(selectedPeriod?.lowercased() ?? "período").")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                            .padding()
                    } else {
                        ForEach(filteredTransfers) { transfer in
                            HStack {
                                transfer.person.image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                VStack(alignment: .leading) {
                                    Text(transfer.person.name)
                                        .font(.system(size: 14, weight: .bold))
                                    Text(transfer.email)
                                        .font(.system(size: 14))
                                        .foregroundColor(.gray)
                                    Text(transfer.date)
                                        .font(.system(size: 12))
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                Text(transfer.amount)
                                    .font(.system(size: 14))
                                    .foregroundColor(.black)
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Forma de Pagamento")
                        .font(.system(size: 16, weight: .bold))
                    
                    HStack {
                        Spacer()
                        Image("paypal")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 50)
                        Spacer()
                        Image("applepay")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 50)
                        Spacer()
                        Image("pix")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 50)
                        Spacer()
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            }
            .padding()
        }
        .navigationBarTitle("Pagamento", displayMode: .inline)
    }
    
    private func formatDate(_ daysAgo: Int) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd 'de' MMMM 'de' yyyy"
        formatter.locale = Locale(identifier: "pt_BR")
        guard let date = Calendar.current.date(byAdding: .day, value: daysAgo, to: Date()) else { return "" }
        return formatter.string(from: date)
    }
}

struct Transfer: Identifiable {
    let id = UUID()
    let person: Person
    let email: String
    let amount: String
    let date: String
    var dateRaw: Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd 'de' MMMM 'de' yyyy"
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter.date(from: date) ?? Date()
    }
}

#Preview {
    PaymentView()
}
