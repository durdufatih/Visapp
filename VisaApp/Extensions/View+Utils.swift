//
//  View+Utils.swift
//  VisaApp
//
//  Created by Abdulalim OZAY on 17.01.2023.
//

import SwiftUI

extension View {
    
    func vAlign(_ alignment: Alignment) -> some View {
        self
            .frame(maxHeight: .infinity, alignment: alignment)
    }
    
    func hAlignment(_ alignment: Alignment) -> some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }
    
    func border(_ width: CGFloat, color: Color = .gray.opacity(0.6)) -> some View {
        self
            .padding(.vertical, 10)
            .padding(.horizontal, 15)
            .background {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .stroke(color, lineWidth: width)
            }
    }
    
    func fillView(_ color: Color = .white) -> some View {
        self
            .padding(.vertical, 10)
            .padding(.horizontal, 15)
            .background {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(color)
            }
    }
}
