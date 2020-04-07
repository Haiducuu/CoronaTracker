//
//  IsolationTimer.swift
//  CoronaTracker
//
//  Created by Catalin Olaru on 4/7/20.
//  Copyright © 2020 Catalin Olaru. All rights reserved.
//

import SwiftUI

struct IsolationTimer: View {
    var toDate = Calendar.current.date(byAdding: .day,value: 20, to: Date())!
    var body: some View {
        
        VStack{
            
            TimerView(setDate: toDate)
        }
    }
}

struct IsolationTimer_Previews: PreviewProvider {
    static var previews: some View {
        IsolationTimer()
    }
}

struct TimerView: View {
    
    @State var nowDate: Date = Date()
    let setDate: Date
    var timer: Timer {
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            self.nowDate = Date()
        }
    }
    
    var body: some View {
        
        Text(TimerFunction(from: setDate))
            .onAppear(perform: {self.timer
            })
    }
    
    func TimerFunction(from date: Date) -> String {
        let calendar = Calendar(identifier: .gregorian)
        let timeValue = calendar
            .dateComponents([.day, .hour, .minute, .second], from: nowDate, to: setDate)
        return String(format: "%02dD %02dH %02dM %02dS",
                      timeValue.day!,
                      timeValue.hour!,
                      timeValue.minute!,
                      timeValue.second!)
    }
}
