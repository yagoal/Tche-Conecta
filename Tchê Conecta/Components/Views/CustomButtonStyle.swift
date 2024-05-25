//
//  CustomButtonStyle.swift
//  Tchê Conecta
//
//  Created by Yago Pereira on 25/5/24.
//

import SwiftUI

struct CustomButtonStyle: ViewModifier {
    var backgroundColor: Color
    var cornerRadius: CGFloat

    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
    }
}

extension View {
    func customButtonStyle(backgroundColor: Color = .black, cornerRadius: CGFloat = 8) -> some View {
        self.modifier(CustomButtonStyle(backgroundColor: backgroundColor, cornerRadius: cornerRadius))
    }
}
