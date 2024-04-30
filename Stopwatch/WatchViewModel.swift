//
//  WatchViewModel.swift
//  Stopwatch
//
//  Created by Daniel Budusan on 30.04.2024.
//

import SwiftUI

@Observable
class WatchViewModel {
    var isTimerRunning = false
    var elapsedTime: TimeInterval = 0
    var timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    var laps: [TimeInterval] = []
    var lap: TimeInterval = 0
    
    func stopTimer() {
        isTimerRunning = false
    }
    
    func startTimer() {
        isTimerRunning = true
    }
    
    func resetTimer() {
        isTimerRunning = false
        elapsedTime = 0
        laps.removeAll()
        lap = 0
    }
    
    func addLap() {
        laps.append(lap)
        lap = 0
    }
    
    func updateTime() {
        elapsedTime += 0.01
        lap += 0.01
    }
    
    func timerString(time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        let miliseconds = Int(time.truncatingRemainder(dividingBy: 1) * 100)
        return String(format: "%02d:%02d,%02d", minutes, seconds, miliseconds)
    }
    
}
