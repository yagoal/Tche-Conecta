//
//  CustomTextField.swift
//  Tchê Conecta
//
//  Created by Yago Pereira on 25/5/24.
//

import SwiftUI

struct CustomTextField: View {
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack(spacing: 16) {
            TextField(placeholder, text: $text)
                .font(.system(size: 14, design: .default))
                .lineSpacing(19.60)
                .foregroundColor(Color(red: 0.51, green: 0.51, blue: 0.51))
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
                .background(.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .inset(by: 0.50)
                        .stroke(Color(red: 0.88, green: 0.88, blue: 0.88), lineWidth: 0.50)
                )
        }
    }
}
