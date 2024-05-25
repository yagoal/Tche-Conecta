//
//  ServiceRequestDetailView.swift
//  Tchê Conecta
//
//  Created by Yago Pereira on 25/5/24.
//

import SwiftUI

struct ServiceRequestDetailView: View {
    @EnvironmentObject var coordinator: AppCoordinator

    let testimonials: [Testimonial] = [
        Testimonial(name: "Beatriz Gonçalves", daysAgo: 2, rating: 4.0, comment: "Tudo certo"),
        Testimonial(name: "Alex Taiua", daysAgo: 2, rating: 5.0, comment: "Ótimo serviço"),
        Testimonial(name: "João Félix", daysAgo: 3, rating: 4.5, comment: "Muito educado")
    ]

    let name: String
    let profession: String
    let rankingPosition: Int

    var body: some View {
        VStack {
            userInfoSection
            ScrollView {
                testimonialsSection
                ratingsSection
            }
            .padding(.horizontal)
            actionButtons
        }
        .navigationBarTitle("Solicitar Serviço", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }

    private var userInfoSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Dados do Profissional")
                .font(.system(size: 18, weight: .bold))
                .padding(.horizontal)
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    infoRow(label: "Nome:", value: name)
                    infoRow(label: "Área:", value: profession)
                }
                .padding()
                Spacer()
                VStack {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .padding()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.blue)
                }
            }
            .padding(.horizontal)
            .background(Color(.systemGray6))
            .cornerRadius(8)
        }
        .padding()
    }
    
    private func infoRow(label: String, value: String) -> some View {
        HStack {
            Text(label)
                .font(.system(size: 16, weight: .bold))
            Text(value)
                .font(.system(size: 16))
        }
    }

    private var testimonialsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Depoimentos:")
                .font(.system(size: 18, weight: .bold))
                .padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(Array(testimonials.enumerated()), id: \.element.id) { index, testimonial in
                        testimonialCard(testimonial, index: index)
                    }
                }
                .padding()
            }
        }
    }

    private var ratingsSection: some View {
        let totalStars = Double(testimonials.count * 5)
        let totalRating = testimonials.reduce(0) { $0 + $1.rating }
        let satisfaction = (totalRating / totalStars) * 100
        
        let ratings: [Rating] = [
            Rating(icon: "star.fill", value: String(format: "%.1f", totalRating / Double(testimonials.count)), description: "Avaliações"),
            Rating(icon: "person.fill", value: String(format: "%.0f%%", satisfaction), description: "Satisfação"),
            Rating(icon: "trophy.fill", value: "#\(rankingPosition)", description: "Ranking")
        ]
        
        return VStack(alignment: .leading, spacing: 8) {
            Text("Pontuação Geral:")
                .font(.system(size: 18, weight: .bold))
                .padding(.horizontal)
            HStack(spacing: 16) {
                ForEach(ratings) { rating in
                    ratingCard(rating)
                }
            }
            .padding(.horizontal)
        }
        .padding(.vertical)
    }

    private var actionButtons: some View {
        VStack(spacing: 16) {
            Button(action: {
                // Action for "Solicitar Serviço"
            }) {
                Text("Solicitar Serviço")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(.systemBlue))
                    .cornerRadius(8)
            }
            Button(action: {
                // Action for "Falar no Chat"
            }) {
                Text("Falar no Chat")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.blue)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(.systemBlue), lineWidth: 2)
                    )
            }
        }
        .padding()
    }
    
    private func testimonialCard(_ testimonial: Testimonial, index: Int) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(testimonial.name)
                .font(.system(size: 14, weight: .bold))
            HStack {
                ForEach(0..<5) { starIndex in
                    starType(index: starIndex, rating: testimonial.rating)
                        .foregroundColor(.yellow)
                        .font(.system(size: 12))
                }
                Text("\(testimonial.daysAgo) dias atrás")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            }
            Text(testimonial.comment)
                .font(.system(size: 14))
        }
        .padding()
        .background(index % 2 == 0 ? Color.white : Color(.systemGray6))
        .cornerRadius(8)
        .shadow(radius: 2)
    }

    private func starType(index: Int, rating: Double) -> Image {
        let filledStarThreshold = Double(index) + 0.5
        if rating >= Double(index + 1) {
            return Image(systemName: "star.fill")
        } else if rating >= filledStarThreshold {
            return Image(systemName: "star.leadinghalf.filled")
        } else {
            return Image(systemName: "star")
        }
    }
    
    private func ratingCard(_ rating: Rating) -> some View {
        VStack {
            Image(systemName: rating.icon)
                .font(.system(size: 24))
                .foregroundColor(.blue)
            Text(rating.value)
                .font(.system(size: 16, weight: .bold))
            Text(rating.description)
                .font(.system(size: 12))
                .foregroundColor(.gray)
        }
        .frame(width: 70, height: 70)
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(8)
    }
    
    private var backButton: some View {
        Button(action: {
            // Action for back button
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(.blue)
        }
    }
}

//#Preview {
//    ServiceRequestDetailView(name: "João da Silva", area: "Pedreiro",, profession: <#String#> rankingPosition: 5)
//}
