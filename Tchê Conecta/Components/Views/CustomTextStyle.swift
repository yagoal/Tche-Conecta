//
//  CustomTextStyle.swift
//  Tchê Conecta
//
//  Created by Yago Pereira on 25/5/24.
//

import SwiftUI

struct CustomTextStyle: ViewModifier {
    var size: CGFloat
    var weight: Font.Weight
    var lineSpacing: CGFloat
    var color: Color

    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: weight, design: .default))
            .lineSpacing(lineSpacing)
            .foregroundColor(color)
    }
}

extension View {
    func customTextStyle(size: CGFloat, weight: Font.Weight = .regular, lineSpacing: CGFloat = 0, color: Color = .black) -> some View {
        self.modifier(CustomTextStyle(size: size, weight: weight, lineSpacing: lineSpacing, color: color))
    }
}

