//
//  ContentView.swift
//  Conversion App
//
//  Created by Joan May on 16/09/24.
//

import SwiftUI

struct ContentView: View {
    
    
    // Lists of all units
    let temperatures: [String] = ["Celsius", "Fahrenheit", "Kelvin"]
    let lengthUnits: [String] = ["meters", "kilometers", "feet","yards","miles"]
    let timeUnits: [String] = ["seconds", "minutes", "hours", "days"]
    let volumeUnits: [String] = ["mililiters", "liters", "cups", "pits","gallons"]
    
    @State private var temperature: String = "Celsius"
    @State private var lengthUnit: String = "meters"
    
    @State private var volumeUnit: String = "liters"
    
    @State private var timeUnit: String = "seconds"
    
    
    // Unit input
    @State private var unit: Double = 0.0
    // Result
    @State private var result: Double = 0.0
    
    // Unit converted
    
    
    var body: some View {
        NavigationStack {
            
            
            Form {
                //Time conversion: users choose seconds, minutes, hours, or days.
                Section("Time conversion"){
                    TextField("Unit: ", value: $unit, format: .number)
                        .keyboardType(.numberPad)
                    Picker("Time unit", selection: $timeUnit){
                        ForEach(timeUnits, id:\.self) { timeUnit in
                            Text(timeUnit)
                        }
                    }
                    
                }

            // Temperature conversion: users choose Celsius, Fahrenheit, or Kelvin.

                Section("Temperature Conversion"){
                    
                    Picker("Temperature unit: ", selection: $temperature) {
                        ForEach(temperatures, id: \.self) { temperature in
                            Text(temperature)
                        }
                    }
                }
                // Length conversion: users choose meters, kilometers, feet, yards, miles.
                Section("Length conversion") {
                    Picker("Length Unit: ",selection: $lengthUnit) {
                        ForEach(lengthUnits, id: \.self) { lengthUnit in
                            Text(lengthUnit)
                        }
                    }
                }
                
                
                // Volume conversion: users choose milliliters, liters, cups, pints, or gallons.
                Section("Volume conversion"){
                    Picker("Volume unit", selection: $volumeUnit){
                        ForEach(volumeUnits, id:\.self) { volumeUnit in
                            Text(volumeUnit)
                        }
                    }
                }
            }
      
            .navigationTitle("Convert your Units")
        }
    
    }
}

#Preview {
    ContentView()
}
