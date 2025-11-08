//
//  ExplicitAnimation.swift
//  UIExamples
//
//  Created by Manoj 2DO on 06/11/25.
//

import SwiftUI

struct ExplicitAnimation: View {
    @State private var animationAmount = 1.0
    @State private var isEnabled = false
    
    var body: some View {
        Button("Tap Me") {
            isEnabled.toggle()
            //Explicit Animation
            withAnimation(.spring(duration: 1, bounce: 0.5)) {
                animationAmount += 360
            }
        }
        .padding(50)
        .background(isEnabled ? .red : .blue)
        .animation(.default, value: isEnabled)
        .foregroundStyle(.white)
        .clipShape(.rect(cornerRadius: isEnabled ? 60 : 0))
        .animation(.spring(duration: 1, bounce: 0.6), value: isEnabled) //Implicit Animation
        .rotation3DEffect(.degrees(animationAmount), axis: (x:0, y:1, z:0))
    }
}

#Preview {
    ExplicitAnimation()
}
