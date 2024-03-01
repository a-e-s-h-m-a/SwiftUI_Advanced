//
//  TimeLineViewBootcamp.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2024-03-01.
//

import SwiftUI

struct TimeLineViewBootcamp: View {
    
    @State private var startTime: Date = .now
    @State private var pauseAnimation: Bool = false
    
    var body: some View {
        VStack {
            TimelineView(.animation(minimumInterval: 1, paused: pauseAnimation)) { context in
                Text("\(context.date)")
                
 //               let seconds = Calendar.current.component(.second, from: context.date)
                let seconds = context.date.timeIntervalSince(startTime)
                
                Text("\(seconds)")
                
                if context.cadence == .live {
                    Text("Cadence Live")
                } else if context.cadence == .minutes {
                    Text("Cadence MIN")
                } else if context.cadence == .seconds {
                    Text("Cadence SEC")
                }
                
                Rectangle()
                    .frame(
                        width: seconds < 10 ? 50 : seconds < 30 ? 200 : 400,
                        height: 100
                    )
                    .animation(.bouncy, value: seconds)
                
                
            }
            
            Button(pauseAnimation ? "PLAY" : "PAUSE") {
                pauseAnimation.toggle()
            }
        }
    }
}

#Preview {
    TimeLineViewBootcamp()
}
