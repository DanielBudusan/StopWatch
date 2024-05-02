//
//  Lap.swift
//  Stopwatch
//
//  Created by Daniel Budusan on 02.05.2024.
//

import Foundation

struct Lap: Identifiable, Equatable, Comparable {
    var id = UUID()
    var time: TimeInterval
    
//    var timeString: String {
//        let minutes = Int(time) / 60
//        let seconds = Int(time) % 60
//        let miliseconds = Int(time.truncatingRemainder(dividingBy: 1) * 100)
//        return String(format: "%02d:%02d,%02d", minutes, seconds, miliseconds)
//    }
    
    static func == (lhs: Lap, rhs: Lap) -> Bool {
        lhs.time == rhs.time
    }
    
    static func < (lhs: Lap, rhs: Lap) -> Bool {
        lhs.time < rhs.time
    }
    
}
