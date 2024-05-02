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

    static func == (lhs: Lap, rhs: Lap) -> Bool {
        lhs.time == rhs.time
    }
    
    static func < (lhs: Lap, rhs: Lap) -> Bool {
        lhs.time < rhs.time
    }
    
}
