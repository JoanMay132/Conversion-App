//
//  TemperatureConverter.swift
//  Conversion App
//
//  Created by Joan May on 16/09/24.
//

import SwiftUI

struct TemperatureConverter{
    
    enum temperatureType: String, CaseIterable {
        case Celsius = "Celsius"
        case Fahrenheit = "Fahrenheit"
        case Kelvin = "Kelvin"
    }
    
    let unitTemperature: Double
    let temperatureInput: temperatureType
    let temperatureOut: temperatureType
    
    var conversionTemperature: Double {
        
        let inputinCelsius : Double
        let resultTemperature: Double
        
        switch temperatureInput {
        case .Celsius:
            inputinCelsius = unitTemperature
        case .Fahrenheit:
            inputinCelsius = (unitTemperature - 32) * (5/9)
        case .Kelvin:
            inputinCelsius = unitTemperature + 273.15
        }
        switch temperatureOut {
        case .Celsius:
            resultTemperature = inputinCelsius
        case .Fahrenheit:
            resultTemperature = (inputinCelsius * (9/5)) + 32
        case .Kelvin:
            resultTemperature = inputinCelsius - 273.15
        }
        return resultTemperature
    }
}
