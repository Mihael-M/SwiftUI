//
//  ContentView.swift
//  BetterRest
//
//  Created by Mishoni Mihaylov on 11.12.24.
//
import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showAlert = false
   
    
    static var defaultWakeTime: Date{
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    
    private var recommendedBedtime: String {
            do {
                let config = MLModelConfiguration()
                let model = try SleepCalculator(configuration: config)
                
                let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
                let hour = (components.hour ?? 0) * 60 * 60
                let minute = (components.minute ?? 0) * 60
                
                let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
                let sleepTime = wakeUp - prediction.actualSleep
                return sleepTime.formatted(date: .omitted, time: .shortened)
            } catch {
                return "Error calculating bedtime"
            }
        }
    var body: some View {
        NavigationStack{
            Form {
                Section("When you should go to sleep") {
                                    Text(recommendedBedtime)
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .foregroundColor(.primary)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                }
                Section("When do you want to wake up?") {
                   
                    DatePicker("Please select a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                VStack{
                    Text("Desired amount of sleep.")
                        .font(.headline)
                    
                    Stepper("\(sleepAmount.formatted()) hours.",value: $sleepAmount,in: 4...12, step:0.25)
                }
                VStack{
                    Text("Daily coffee intake:")
                        .font(.headline)
                    
                    
                    Stepper("^[\(coffeeAmount) cup](inflect: true)",value: $coffeeAmount,in: 1...20)
                        
                }
            }
            .navigationTitle("BetterRest")
           
        }
    }

}

#Preview {
    ContentView()
}
