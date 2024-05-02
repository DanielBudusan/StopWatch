//
//  ContentView.swift
//  Stopwatch
//
//  Created by Daniel Budusan on 26.04.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = WatchViewModel()
    
    var body: some View {
        TabView {
            DigitalWatchView(time: viewModel.watch.timeString)
            
            AnalogWatchView(time: viewModel.watch.elapsedTime, lapTime: viewModel.watch.currentLap.time)
        }
        .onReceive(viewModel.watch.timer) { _ in
            if viewModel.watch.isTimerRunning {
                viewModel.updateTime()
            }
        }
        .tabViewStyle(.page)
        
        HStack {
            Button {
                viewModel.watch.isTimerRunning ? viewModel.addLap() : viewModel.resetTimer()
            } label: {
                ZStack {
                    Circle()
                        .frame(width: 80)
                        .foregroundStyle(.gray.opacity(0.3))
                    Text(viewModel.watch.isTimerRunning ? "Lap" : "Reset")
                        .foregroundStyle(viewModel.watch.isTimerRunning ? .white : (viewModel.watch.elapsedTime == 0 ? .white.opacity(0.2) : .white))
                }
            }
            .disabled(viewModel.watch.elapsedTime == 0)
            
            Spacer()
            
            Button {
                viewModel.watch.isTimerRunning ? viewModel.stopTimer() : viewModel.startTimer()
            } label: {
                ZStack {
                    Circle()
                        .frame(width: 80)
                        .foregroundStyle(viewModel.watch.isTimerRunning ? .red.opacity(0.3) : .green.opacity(0.3))
                    Text(viewModel.watch.isTimerRunning ? "Stop" : "Start")
                        .foregroundStyle(viewModel.watch.isTimerRunning ? .red : .green)
                }
            }
        }
        
        ScrollView {
            if viewModel.watch.elapsedTime > 0 {
                LapView(index: viewModel.watch.laps.indices.count, lap: viewModel.watch.currentLap)
            }
            
            ForEach(viewModel.watch.laps.indices.reversed(), id: \.self) { index in
                LapView(index: index, lap: viewModel.watch.laps[index])
                    .foregroundColor(viewModel.watch.laps[index] == viewModel.watch.fastestLap ? .green : (viewModel.watch.laps[index] == viewModel.watch.slowestLap ? .red : .primary))
            }
        }
        .padding(.top, 10)
    }
}


#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
