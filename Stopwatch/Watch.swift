//
//  Watch.swift
//  Stopwatch
//
//  Created by Daniel Budusan on 02.05.2024.
//

import Foundation

struct Watch: Identifiable {
    var id = UUID()
    var isTimerRunning = false
    var elapsedTime: TimeInterval = 0
    var timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    var laps: [Lap] = []
    var currentLap = Lap(time: 0)
    var slowestLap: Lap
    var fastestLap: Lap
    
//    var timeString: String {
//        let minutes = Int(elapsedTime) / 60
//        let seconds = Int(elapsedTime) % 60
//        let miliseconds = Int(elapsedTime.truncatingRemainder(dividingBy: 1) * 100)
//        return String(format: "%02d:%02d,%02d", minutes, seconds, miliseconds)
//    }
    
    init() {
        self.slowestLap = currentLap
        self.fastestLap = currentLap
    }
}
