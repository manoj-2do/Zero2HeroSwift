//
//  ImplicitAnimation.swift
//  UIExamples
//
//  Created by Manoj 2DO on 06/11/25.
//
import SwiftUI

struct ImplicitAnimation: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Click Me") {
            animationAmount += 0.1
            //  OnTap the button will scale up but it won’t get redrawn at increasingly high resolutions, so as the button gets bigger you’ll see it gets a bit blurry, but that’s OK.
        }
        .padding(10)
        .background(.blue)
        .foregroundStyle(.white)
        .clipShape(.capsule)
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1.5) * 3)
        .animation(.default, value: animationAmount)
    }
}

#Preview {
    ImplicitAnimation()
}
