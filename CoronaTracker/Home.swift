//
//  Home.swift
//  CoronaTracker
//
//  Created by Catalin Olaru on 4/7/20.
//  Copyright © 2020 Catalin Olaru. All rights reserved.
//

import SwiftUI

struct Home : View {
    
    @State var nowDate: Date = Date()
    let referenceDate: Date = Date(timeIntervalSince1970: 1589587200)
    var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            self.nowDate = Date()
        }
    }
    
    
    @ObservedObject var data = getData()
    @State var pcikerSelectedItem = 0
    var toDate = Calendar.current.date(byAdding: .day,value: 20, to: Date())!
    
    var body : some View {
        
        ZStack {
            Color(#colorLiteral(red: 0, green: 0.840781424, blue: 0.8487269987, alpha: 1)).edgesIgnoringSafeArea(.all)
            
            VStack {
                
                if self.data.countries.count != 0 && self.data.data != nil && self.data.ro != nil {
                    VStack{
                        
                        
                        HStack {
                            
                            Text("#STAMACASA")
                                .font(.system(size: 28))
                                .fontWeight(.heavy)
                                .foregroundColor(Color(#colorLiteral(red: 0, green: 0.6183881375, blue: 0.630186304, alpha: 1)))
                                .padding()
                            
                            Spacer()
                            
                            Button(action: {
                                
                                self.data.data = nil
                                self.data.countries.removeAll()
                                self.data.updateData()
                                
                            }) {
                                
                                Image(systemName: "arrow.clockwise")
                                    .font(.title)
                                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0.6183881375, blue: 0.630186304, alpha: 1)))
                            }.padding()
                            
                        }
                        
                        Picker(selection: $pcikerSelectedItem, label: Text("")) {
                            Text("Romania").tag(0)
                            Text("WorldWide").tag(1)
                        }.pickerStyle(SegmentedPickerStyle())
                            .padding(.horizontal, 24)
                        
                        if pcikerSelectedItem == 0 {
                            
                            HStack {
                                
                                VStack(alignment: .leading, spacing: 10) {
                                    
                                    VStack(alignment: .leading) {
                                        Text("Active")
                                            .font(.system(size: 20))
                                            .foregroundColor(Color(#colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)))
                                        
                                        Text(getValue(data: self.data.ro.active))
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.white)
                                        
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        Text("Recovered")
                                            .font(.system(size: 20))
                                        .foregroundColor(Color(#colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)))
                                        
                                        Text(getValue(data: self.data.ro.recovered))
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.white)
                                        
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        Text("Deaths")
                                            .font(.system(size: 20))
                                        .foregroundColor(Color(#colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)))
                                        
                                        Text(getValue(data: self.data.ro.deaths))
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.white)
                                        
                                    }
                                }
                                
                                Spacer()
                                
                                HStack(spacing: 20) {
                                    ZStack(alignment: .bottom) {
                                        Capsule().frame(width: 30, height: 200)
                                            .foregroundColor(Color(#colorLiteral(red: 0, green: 0.738790859, blue: 0.7528861771, alpha: 1)))
                                        Capsule().frame(width: 30, height: CGFloat(self.data.ro.recovered/3.5))
                                            .foregroundColor(.white)
                                    }
                                    
                                    ZStack(alignment: .bottom) {
                                        Capsule().frame(width: 30, height: 200)
                                            .foregroundColor(Color(#colorLiteral(red: 0, green: 0.738790859, blue: 0.7528861771, alpha: 1)))
                                        Capsule().frame(width: 30, height: CGFloat(self.data.ro.deaths/5))
                                            .foregroundColor(.white)
                                    }
                                    
                                    ZStack(alignment: .bottom) {
                                        Capsule().frame(width: 30, height: 200)
                                            .foregroundColor(Color(#colorLiteral(red: 0, green: 0.738790859, blue: 0.7528861771, alpha: 1)))
                                        Capsule().frame(width: 30, height: CGFloat(self.data.ro.deaths/10))
                                            .foregroundColor(.white)
                                    }
                                }.padding(.top, 24)
                            }.padding(.horizontal)
                            
                            Divider().padding(.horizontal).padding(.bottom)
                            
                        }else {
                            
                            VStack(spacing: 20){
                                VStack {
                                    Text("Cases")
                                        .fontWeight(.bold)
                                        .font(.system(size: 24))
                                    .foregroundColor(Color(#colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)))
                                    
                                    Text(getValue(data: self.data.data.cases))
                                        .fontWeight(.bold)
                                        .font(.title)
                                        .foregroundColor(.white)
                                }
                                
                                HStack {
                                    
                                    VStack {
                                        
                                        Text("Recovered")
                                            .fontWeight(.bold)
                                            .font(.system(size: 24))
                                        .foregroundColor(Color(#colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)))
                                        
                                        Text(getValue(data: self.data.data.recovered))
                                            .fontWeight(.bold)
                                            .font(.title)
                                            .foregroundColor(.white)
                                    }
                                    
                                    Spacer()
                                    
                                    VStack {
                                        
                                        Text("Deaths")
                                            .fontWeight(.bold)
                                            .font(.system(size: 24))
                                        .foregroundColor(Color(#colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)))
                                        
                                        Text(getValue(data: self.data.data.deaths))
                                            .fontWeight(.bold)
                                            .font(.title)
                                            .foregroundColor(.white)
                                    }
                                }.padding()
                                    .padding(.horizontal)
                            }.padding()
                            
                            Divider().padding(.horizontal).padding(.bottom)
                        }
                    }
                    
                    VStack(alignment: .leading){
                        
                        Text("Isolation Time Left:")
                        .foregroundColor(Color(#colorLiteral(red: 0, green: 0.6183881375, blue: 0.630186304, alpha: 1)))
                        
                        
                        VStack {
                             Text(countDownString(from: referenceDate, until: nowDate))
                                       .font(.largeTitle)
                                       .onAppear(perform: {
                                           _ = self.timer
                                       })
                        }
                        .font(.system(size: 42))
                        .foregroundColor(Color(#colorLiteral(red: 0, green: 0.6183881375, blue: 0.630186304, alpha: 1)))
                    }.padding(.horizontal)
                
                Divider().padding(.horizontal)
                
                Spacer()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 15){
                        
                        ForEach(self.data.countries,id: \.self){i in
                            
                            CellView(data: i)
                            
                        }
                    }
                    .padding()
                }
                } else {
                    Indicator()
                }
            }
        }
    }
    
    func countDownString(from date: Date, until nowDate: Date) -> String {
        
        let calendar = Calendar(identifier: .gregorian)
        
        let components = calendar
            .dateComponents([.day, .hour, .minute, .second],
                            from: nowDate,
                            to: date)
        return String(format: "%02dD %02dH %02dM %02dS",
                      components.day ?? 00,
                      components.hour ?? 00,
                      components.minute ?? 00,
                      components.second ?? 00)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


struct Indicator: UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<Indicator>) -> UIActivityIndicatorView {
        
        let view = UIActivityIndicatorView(style: .large)
        view.startAnimating()
        return view
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<Indicator>) {
        
        
    }
}
