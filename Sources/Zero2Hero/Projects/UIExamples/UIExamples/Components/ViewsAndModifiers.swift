//
//  ViewsAndModifiers.swift
//  UIExamples
//
//  Created by Manoj 2DO on 03/11/25.
//

import SwiftUI

struct ViewsAndModifiers: View {
    @State private var useRedText = false
    var body: some View {
        VStack(spacing: 20) {
            stackedText
        }
    }
    
    @ViewBuilder var stackedText: some View {
       /**
        unlike the body property, Swift won’t automatically apply the @ViewBuilder attribute here. There are three ways to send back multiple view. There are three Options
        1. VStack
        2. Group
        3. @ViewBuilder
        */
        capsuleText(text: "View Composition")
        Text("Custom Modifiers").customTitleStyle()
        Color.blue.frame(width: 200, height: 200).customWatermarked(with: "Hacking with Swift")
        GridStack(rows: 2, columns: 3) { row, col in
            HStack {
                Image(systemName: "globe")
            }
        }
    }
}

//View Composition Example
struct capsuleText: View {
    var text: String
    
    var body: some View {
        Text(text).font(.title)
            .padding()
            .foregroundStyle(.white)
            .background(.blue)
            .clipShape(.capsule)
    }
}

//Custom Modifiers
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundStyle(.white)
            .padding()
            .background(.orange)
            .clipShape(.capsule)
    }
}

//Watermark
struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding()
                .background(.black)
        }
    }
}

//Custom Containers - Generics
struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}


extension View {
    func customTitleStyle() -> some View {
        modifier(Title())
    }
    
    func customWatermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

#Preview {
    ViewsAndModifiers()
}

/**
 UIHostingController -> Bridge between UIKit and SwiftUI
SwiftUI is written over UIKit
 
 How modifier works and why the order is important?
 ModifiedContent<OurThing, OurModifier>
  
 For Below Example It will print:  ModifiedContent<ModifiedContent<Button<Text>, _BackgroundStyleModifier<Color>>, _FrameLayout>
 
     Button("Click me") {
         print(type(of: self.body))
     }
     .background(.red)
     .frame(width: 200, height: 200)
 
 As you can see, we end with ModifiedContent types stacking up – each one takes a view to transform plus the actual change to make, rather than modifying the view directly.
 
 
 VStack fills the view with -> TupleView. So it can directly conform to View
 
 @ViewBuilder
 This is a result builder attribute — a special Swift feature that lets you write multiple views inside the body without explicit return statements or tuples. The compiler automatically wraps those two views in a container (like a TupleView or Group)
 
 
 Below example will throw error. Reason:  Swift doesn’t let us create one stored property that refers to other stored properties.
 let motto1 = Text("Draco daminous")
 let motto2 = Text("nunquan titillandus \(motto1)")
 */
