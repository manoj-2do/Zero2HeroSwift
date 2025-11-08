//
//  AnimationModifier.swift
//  UIExamples
//
//  Created by Manoj 2DO on 06/11/25.
//

import SwiftUI

struct AnimationModifier: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        print(animationAmount)
        
        return VStack {
            //These binding animations use a similar animation() modifier that we use on view
            Stepper("Scale Amount", value: $animationAmount.animation(
                .easeInOut(duration: 2).repeatCount(2)
            ), in: 1...10)
            Spacer()
            
            Button("Click Me") {
                animationAmount += 0.1
            }
            .padding(10)
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(.capsule)
            .scaleEffect(animationAmount)
        }
    }
}

#Preview {
    AnimationModifier()
}

