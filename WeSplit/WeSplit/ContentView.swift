//
//  ContentView.swift
//  WeSplit
//
//  Created by Mishoni Mihaylov on 2.11.24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkedAmount: Double = 0.0
    @State private var numberOfPeople:Int = 0
    @State private var tipPrecentage:Int = 20
    @FocusState private var focus:Bool
    var totalPerPercon:Double{
        let peopleCount = Double(numberOfPeople+2)
        let tipSelection = Double(tipPrecentage)
        let tip = checkedAmount * tipSelection/100
        let total = checkedAmount + tip
        return total/peopleCount
    }
    let tipPrecentages = [10, 15, 20, 25, 0]
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Enter the amount of the bill", value: $checkedAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad).focused($focus)
                    Picker("Number of people",selection: $numberOfPeople)
                    {
                        ForEach(2..<100){
                            Text("\($0) people")
                            
                        }
                    }
                    .pickerStyle(.navigationLink)
                    
                }
                Section("Tip percentage"){
                    
                    Picker("Tip percentage",selection: $tipPrecentage)
                    {
                        ForEach(tipPrecentages,id:\.self){
                            Text($0,format: .percent)
                            
                        }
                        
                    }.pickerStyle(.segmented)
                }
                Section{
                    Text(totalPerPercon,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationBarTitle("WeSplit")
            .toolbar{
                if focus{
                    Button("Done"){
                        focus = false
                    }
                }
            }
        }
       
        
        
        
    }
}

#Preview {
    ContentView()
}
