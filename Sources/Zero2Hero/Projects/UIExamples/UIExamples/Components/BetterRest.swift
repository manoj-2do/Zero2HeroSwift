//
//  BetterRest.swift
//  UIExamples
//
//  Created by Manoj 2DO on 04/11/25.
//

import SwiftUI
import CoreML

struct BetterRest: View {
    @State private var sleepAmountInHrs = 8.0
    @State private var coffeeAmount = 1
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    @State private var wakeUp = defaultWakeUpTime
    
    static var defaultWakeUpTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var body: some View {
        NavigationStack {
            Form {
                HStack {
                    Text("When do you want to wake up?").font(.headline)
                    Spacer()
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute).labelsHidden()
                }
                
                VStack(alignment: .leading) {
                    Text("Desire amount of sleep").font(.headline)
                    Stepper("\(sleepAmountInHrs.formatted()) hrs", value: $sleepAmountInHrs, in: 4...12, step: 0.25)
                }
               
                VStack(alignment: .leading) {
                    Text("Daily coffee intake").font(.headline)
                    Stepper("\(coffeeAmount) cup(s)", value: $coffeeAmount, in: 1...20)
                }
            }
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK") {
                    
                }
            } message: {
                Text(alertMessage)
            }
            .navigationTitle("BetterRest")
            .toolbar {
                Button("Calculate", action: calculateBedTime)
            }
        }
        
    }
    
    func calculateBedTime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmountInHrs, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            alertTitle = "Your ideal bedtime is…"
            alertMessage = sleepTime.formatted(date:.omitted, time: .shortened)

        } catch {
            print("Something went wrong")
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        
        showingAlert = true
    }
}

#Preview {
    BetterRest()
}

//        let components = Calendar.current.dateComponents([.hour, .minute], from: .now)
//        let hour = components.hour ?? 0
//        let minute = components.minute ?? 0
//        print(components)
