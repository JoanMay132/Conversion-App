//
//  volumeConverter.swift
//  Conversion App
//
//  Created by Joan May on 17/09/24.
//

import Foundation

struct VolumeConverter {
    
    enum volumeType : String, CaseIterable {
        
        case mililiters = "mililiters"
        case liters = "liters"
        case cups = "cups"
        case pits = "pits"
        case gallons = "gallons"
        
    }
    
    let unitVolume : Double
    let volumeInput : volumeType
    let volumeOutput : volumeType
    
    var conversionVolume : Double {
        let inputInLiters : Double
        let outputInLiters : Double
        
        switch volumeInput {
        case .mililiters:
            inputInLiters = unitVolume / 1000
        case .liters:
            inputInLiters = unitVolume
        case .cups:
            inputInLiters = unitVolume / 4.22675
        case .pits:
            inputInLiters = unitVolume / 2.11338
        case .gallons:
            inputInLiters = unitVolume / 0.264172
        }
        
        switch volumeOutput {
        case .mililiters:
            outputInLiters = inputInLiters * 1000
        case .liters:
            outputInLiters = inputInLiters
        case .cups:
            outputInLiters = inputInLiters * 4.22675
        case .pits:
            outputInLiters = inputInLiters * 2.11338
        case .gallons:
            outputInLiters = inputInLiters * 0.264172
        }
        return outputInLiters
    }
}
