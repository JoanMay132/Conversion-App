//
//  ContentView.swift
//  Conversion App
//
//  Created by Joan May on 16/09/24.
//

import SwiftUI

struct ContentView: View {
    

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
    // Unit Temperature Input
    @State private var unitLength: Double = 0.0
    @State private var lenghtInput: LengthConverter.lengthType = .meters
    @State private var lenghtOut: LengthConverter.lengthType = .meters
    
    // Unit VOLUME Input
    @State private var unitVolume: Double = 0.0
    @State private var volumeInput: VolumeConverter.volumeType = .liters
    @State private var volumeOut: VolumeConverter.volumeType = .liters
    // Button Done
    @FocusState private var doneButton: Bool
    
    
    var body: some View {
        NavigationStack {
            
            
            Form {
                //Time conversion: users choose seconds, minutes, hours, or days.
                Section(header: Text("Time Conversion").bold()){
                    TextField("Unit: ", value: $unitTimer, format: .number)
                        .keyboardType(.numberPad)
                        .focused($doneButton)
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
                        .focused($doneButton)
                    
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
                    TextField("Unit: ", value: $unitLength, format: .number)
                        .keyboardType(.numberPad)
                        .focused($doneButton)
                    Picker("Length Unit: ",selection: $lenghtInput) {
                        ForEach(LengthConverter.lengthType.allCases, id: \.self) { unitLenght in
                            Text(unitLenght.rawValue)
                        }
                    }
                }
                // Output length unit conversion
                Section("Output length conversion"){
                    Picker("Select a unit to convert", selection: $lenghtOut){
                        ForEach(LengthConverter.lengthType.allCases, id: \.self) { lengthOut in
                            Text(lengthOut.rawValue)}
                    }
                    let lengthConverter = LengthConverter(unitLength: unitLength, lenghtInput: lenghtInput, lenghtOut: lenghtOut)
                    Text("\(lengthConverter.conversionLength, specifier: "%.2f") \(lenghtOut.rawValue)")
                }
                
                // Volume conversion: users choose milliliters, liters, cups, pints, or gallons.
                Section("Volume conversion"){
                    TextField("Unit", value: $unitVolume, format: .number)
                        .keyboardType(.numberPad)
                        .focused($doneButton)
                    Picker("Volume unit", selection: $volumeInput){
                        ForEach(VolumeConverter.volumeType.allCases, id:\.self) { unitVolume in
                            Text(unitVolume.rawValue)
                        }
                    }
                }
                
                // Output volume unit conversion
                Section("Output volume conversion"){
                    Picker("Select a unit to convert", selection: $volumeOut){
                        ForEach(VolumeConverter.volumeType.allCases, id: \.self) { volumeOut in
                            Text(volumeOut.rawValue)}
                    }
                    let volumeConverter = VolumeConverter(unitVolume: unitVolume, volumeInput: volumeInput, volumeOutput: volumeOut)
                    Text("\(volumeConverter.conversionVolume, specifier: "%.2f") \(volumeOut.rawValue)")
                }
            }
            
            .navigationTitle("Convert your Units")
            .toolbar{
                if doneButton {
                    Button("Done"){
                        doneButton = false}
                }
            }
        }
    
    }
}

#Preview {
    ContentView()
}
