//
//  ContentView.swift
//  Conversion App
//
//  Created by Joan May on 16/09/24.
//

import SwiftUI

struct ContentView: View {
    
    
    // Lists of all units
    let lengthUnits: [String] = ["meters", "kilometers", "feet","yards","miles"]
    let volumeUnits: [String] = ["mililiters", "liters", "cups", "pits","gallons"]
    
    @State private var temperature: String = "Celsius"
    @State private var lengthUnit: String = "meters"
    
    @State private var volumeUnit: String = "liters"
    
    


    // Unit Timer Input
    @State private var unitTimer: Double = 0.0
    @State private var timeUnit: TimerConverter.timeType = .seconds
    @State private var outputUnit: TimerConverter.timeType = .seconds
    // Unit Temperature Input
    @State private var unitTemperature: Double = 0.0
    @State private var temperatureInput: TemperatureConverter.temperatureType = .Celsius
    @State private var temperatureOut: TemperatureConverter.temperatureType = .Celsius
    
    // Result
//    @State private var result: Double = 0.0
    
    
    var body: some View {
        NavigationStack {
    
            
            Form {
                //Time conversion: users choose seconds, minutes, hours, or days.
                Section("Time conversion"){
                    TextField("Unit: ", value: $unitTimer, format: .number)
                        .keyboardType(.numberPad)
                    Picker("Time unit", selection: $timeUnit){
                        ForEach(TimerConverter.timeType.allCases, id:\.self) { unit in
                            Text(unit.rawValue)
                        }
                    }
                    
                }
                Section("Output time conversion"){
                    Picker("Time unit", selection: $outputUnit){
                        ForEach(TimerConverter.timeType.allCases, id:\.self) { outputUnit in
                            Text(outputUnit.rawValue)
                        }
                    }
                    .pickerStyle(.palette)
                    let converter = TimerConverter(unitTimer: unitTimer, inputUnit: timeUnit, outputUnit: outputUnit)
                    Text("Converted result is: \(converter.conversionTime, specifier: "%.2f") \(outputUnit.rawValue)")
        
                }
            // Temperature conversion: users choose Celsius, Fahrenheit, or Kelvin.

                Section("Temperature Conversion"){
        
                        TextField("Unit: ", value: $unitTemperature, format: .number)
                            .keyboardType(.numberPad)
                        
                    Picker("Temperature unit: ", selection: $temperatureInput) {
                        ForEach(TemperatureConverter.temperatureType.allCases, id: \.self) { unitTemperature in
                            Text(unitTemperature.rawValue)
                        }
                    }
                }
                
                // Output temperature unit conversion
                Section("Output temperature conversion"){
                    Picker("Select a unit to convert", selection: $temperatureOut){
                        ForEach(TemperatureConverter.temperatureType.allCases, id: \.self) { temperatureOut in
                            Text(temperatureOut.rawValue)}
                    }
                    let tempConverter = TemperatureConverter(unitTemperature: unitTemperature, temperatureInput: temperatureInput, temperatureOut: temperatureOut)
                    Text("\(tempConverter.conversionTemperature, specifier: "%.2f") \(temperatureOut.rawValue)")
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
