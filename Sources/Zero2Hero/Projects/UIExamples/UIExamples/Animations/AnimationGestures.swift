//
//  AnimationGestures.swift
//  UIExamples
//
//  Created by Manoj 2DO on 06/11/25.
//

import SwiftUI

struct AnimationGestures: View {
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 200, height: 200)
            .clipShape(.rect(cornerRadius: 20))

    }
}

#Preview {
    AnimationGestures()
}
