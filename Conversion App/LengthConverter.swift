//
//  LengthConverter.swift
//  Conversion App
//
//  Created by Joan May on 16/09/24.
//

import Foundation

struct LengthConverter {
    enum lengthType : String, CaseIterable {
        case meters = "meters"
        case kilometers = "kilometers"
        case feet = "feet"
        case yards = "yards"
        case miles = "miles"
    }
    
    let unitLength : Double
    let lenghtInput : lengthType
    let lenghtOut : lengthType
    
    var conversionLength : Double {
        
        let inputInMeters : Double
        let resultMeters : Double
        
        switch lenghtInput {
        case .meters:
            inputInMeters = unitLength
        case .kilometers:
            inputInMeters = unitLength * 1000
        case .feet:
            inputInMeters = unitLength * 3.28
        case .yards:
            inputInMeters = unitLength * 1.09361
        case .miles:
            inputInMeters = unitLength * 0.000621371
        }
        switch lenghtOut {
        case .meters:
            resultMeters = inputInMeters
        case .kilometers:
            resultMeters = inputInMeters / 1000
        case .feet:
            resultMeters = inputInMeters / 3.28
        case .yards:
            resultMeters = inputInMeters / 1.09361
        case .miles:
            resultMeters = inputInMeters / 0.00621371
        }
        return resultMeters
    }
}
