//
//  WatchViewModel.swift
//  Stopwatch
//
//  Created by Daniel Budusan on 30.04.2024.
//

import SwiftUI

@Observable
class WatchViewModel {
    var watch: Watch
    
    init(watch: Watch = Watch()) {
        self.watch = watch
    }
    
    func stopTimer() {
        watch.isTimerRunning = false
    }
    
    func startTimer() {
        watch.isTimerRunning = true
    }
    
    func resetTimer() {
        watch.isTimerRunning = false
        watch.elapsedTime = 0
        watch.laps.removeAll()
        watch.currentLap = Lap(time: 0)
    }
    
    func addLap() {
        watch.laps.append(watch.currentLap)
        watch.currentLap = Lap(time: 0)
    }
    
    func updateTime() {
        watch.elapsedTime += 0.01
        watch.currentLap.time += 0.01
        watch.slowestLap = watch.laps.max() ?? Lap(time: 0)
        watch.fastestLap = watch.laps.min() ?? Lap(time: 0)
    }
    
    func timeString(time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        let miliseconds = Int(time.truncatingRemainder(dividingBy: 1) * 100)
        return String(format: "%02d:%02d,%02d", minutes, seconds, miliseconds)
    }
    
    func timeString1(time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        let miliseconds = Int(time.truncatingRemainder(dividingBy: 1) * 100)
        return String(format: "%02d:", minutes)
    }
    
    func timeString2(time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        let miliseconds = Int(time.truncatingRemainder(dividingBy: 1) * 100)
        return String(format: "%02d,", seconds)
    }
    
    func timeString3(time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        let miliseconds = Int(time.truncatingRemainder(dividingBy: 1) * 100)
        return String(format: "%02d", miliseconds)
    }
}
