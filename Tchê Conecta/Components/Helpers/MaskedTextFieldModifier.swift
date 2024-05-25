//
//  MaskedTextFieldModifier.swift
//  Tchê Conecta
//
//  Created by Yago Pereira on 25/5/24.
//

import SwiftUI

enum TextFieldType {
    case normal
    case document
}

struct MaskedTextFieldModifier: ViewModifier {
    @Binding var text: String

    func body(content: Content) -> some View {
        content
            .keyboardType(.numberPad)
            .onChange(of: text) { newValue in
                applyMask(&text)
            }
    }

    private func applyMask(_ text: inout String) {
        let cleanText = text.replacingOccurrences(of: "\\D", with: "", options: .regularExpression)
        let mask = cleanText.count > 11 ? "##.###.###/####-##" : "###.###.###-##"
        var result = ""
        var index = cleanText.startIndex
        for ch in mask where index < cleanText.endIndex {
            if ch == "#" {
                result.append(cleanText[index])
                index = cleanText.index(after: index)
            } else {
                result.append(ch)
            }
        }
        text = result
    }
}

extension View {
    func maskedTextField(text: Binding<String>) -> some View {
        self.modifier(MaskedTextFieldModifier(text: text))
    }
}
