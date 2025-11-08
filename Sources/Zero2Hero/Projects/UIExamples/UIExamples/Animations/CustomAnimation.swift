//
//  CustomAnimation.swift
//  UIExamples
//
//  Created by Manoj 2DO on 06/11/25.
//

import SwiftUI

struct CustomAnimation: View {
    @State private var animationAmount = 1.0
    var body: some View {
        Button("Customizing Animation") {
            //
        }
        .padding(10)
        .background(.blue)
        .foregroundStyle(.white)
        .clipShape(.capsule)
        .overlay {
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(.easeOut(duration: 1).repeatForever(autoreverses: false), value: animationAmount)
        }
        .onAppear() {
            animationAmount = 2
        }
    }
}

#Preview {
    CustomAnimation()
}

