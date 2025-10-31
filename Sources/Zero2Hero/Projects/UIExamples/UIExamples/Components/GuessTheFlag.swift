//
//  GuessTheFlag.swift
//  UIExamples
//
//  Created by Manoj 2DO on 31/10/25.
//

import SwiftUI

struct GuessTheFlag: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"]
   @State private var correctAnswer = Int.random(in: 0...2)
   @State private var score = 0
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700).ignoresSafeArea()
            VStack {
                Spacer()
                Text("Guess the Flag")
                       .font(.largeTitle.weight(.bold))
                       .foregroundStyle(.white)
                
                VStack {
                    Text("Tap the flag of").font(.headline.weight(.bold)).foregroundStyle(.white)
                    Text(countries[correctAnswer]).font(.largeTitle.weight(.semibold)).foregroundStyle(.white)
                    
                    VStack(spacing: 15) {
                        ForEach(0..<3) { number in
                            Button {
                                flagTapped(number)
                            } label: {
                                Image(countries[number]).clipShape(.capsule).shadow(radius: 2)
                            }.alert(scoreTitle, isPresented: $showingScore) {
                                Button("Continue", action: askQuestion)
                            } message: {
                                Text("Your score is ???").font(.title.bold())
                            }
                        }
                    }
                }.frame(maxWidth: .infinity)
                    .padding(.vertical, 40)
                    .background(.ultraThinMaterial)
                    .clipShape(.rect(cornerRadius: 20))
                Text("Score: ???")
                    .font(.title)
                       .foregroundStyle(.white)
                Spacer()
            }.padding(20)
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func flagTapped(_ num: Int) {
        if num == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
}

#Preview {
    GuessTheFlag()
}
