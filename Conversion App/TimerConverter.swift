//
//  TimerConverter.swift
//  Conversion App
//
//  Created by Joan May on 16/09/24.
//

// UnitConverter.swift
import Foundation

struct TimerConverter {
    enum timeType: String, CaseIterable {
        case seconds = "seconds"
        case minutes = "minutes"
        case hours = "hours"
        case days = "days"
    }

    let unit: Double
    let inputUnit: timeType
    let outputUnit: timeType

    var conversionTime: Double {
        let inputInSeconds: Double
        switch inputUnit {
        case .seconds:
            inputInSeconds = unit
        case .minutes:
            inputInSeconds = unit * 60
        case .hours:
            inputInSeconds = unit * 3600
        case .days:
            inputInSeconds = unit * 86400
        }

        switch outputUnit {
        case .seconds:
            return inputInSeconds
        case .minutes:
            return inputInSeconds / 60
        case .hours:
            return inputInSeconds / 3600
        case .days:
            return inputInSeconds / 86400
        }
    }
}
