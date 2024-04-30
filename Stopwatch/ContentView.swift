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
            DigitalWatchView(time: viewModel.timerString(time: viewModel.elapsedTime))
            
            AnalogWatchView(time: viewModel.elapsedTime, lapTime: viewModel.lap)
        }
        .onReceive(viewModel.timer) { _ in
            if viewModel.isTimerRunning {
                viewModel.updateTime()
            }
        }
        .tabViewStyle(.page)
        
        HStack {
            Button {
                viewModel.isTimerRunning ? viewModel.addLap() : viewModel.resetTimer()
            } label: {
                ZStack {
                    Circle()
                        .frame(width: 80)
                        .foregroundStyle(.gray.opacity(0.3))
                    Text(viewModel.isTimerRunning ? "Lap" : "Reset")
                        .foregroundStyle(viewModel.isTimerRunning ? .white : (viewModel.elapsedTime == 0 ? .white.opacity(0.2) : .white))
                }
            }
            .disabled(viewModel.elapsedTime == 0)
            
            Spacer()
            
            Button {
                viewModel.isTimerRunning ? viewModel.stopTimer() : viewModel.startTimer()
            } label: {
                ZStack {
                    Circle()
                        .frame(width: 80)
                        .foregroundStyle(viewModel.isTimerRunning ? .red.opacity(0.3) : .green.opacity(0.3))
                    Text(viewModel.isTimerRunning ? "Stop" : "Start")
                        .foregroundStyle(viewModel.isTimerRunning ? .red : .green)
                }
            }
        }
        
        ScrollView {
            if viewModel.lap > 0 {
                Divider()
                    .overlay(Color.gray.opacity(0.7))
                HStack {
                    Text("Lap " + "\(viewModel.laps.indices.count + 1)")
                    Spacer()
                    Text(viewModel.timerString(time: viewModel.lap))
                }
                .font(.headline)
                .padding([.leading, .trailing, .top], 5)
            }
            
            ForEach(viewModel.laps.indices.reversed(), id: \.self) { index in
                Divider()
                    .overlay(Color.gray.opacity(0.7))
                HStack {
                    Text("Lap " + "\(index + 1)")
                    Spacer()
                    Text(viewModel.timerString(time: viewModel.laps[index]))
                }
                .font(.headline)
                .padding(5)
                .foregroundColor(viewModel.laps[index] == viewModel.laps.min() ? .green : (viewModel.laps[index] == viewModel.laps.max() ? .red : .primary))
            }
        }
        .padding(.top, 10)
    }
}


#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
