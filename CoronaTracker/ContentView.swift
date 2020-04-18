//
//  ContentView.swift
//  CoronaTracker
//
//  Created by Catalin Olaru on 4/6/20.
//  Copyright © 2020 Catalin Olaru. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func getValue(data : Double) -> String {
    
    let format = NumberFormatter()
    format.numberStyle = .decimal
    
    return format.string(for: data)!
}

struct Case: Decodable {
    
    var cases: Double
    var deaths: Double
    var recovered: Double
    var active: Double
}

struct Details: Decodable,Hashable {
    
    var country: String
    var cases: Double
    var deaths: Double
    var recovered: Double
    var active: Double
}

class getData: ObservableObject {
    
    @Published var data = [Case]()
    @Published var ro = [Case]()
    @Published var countries = [Details]()
    
    init() {
        
        updateData()
    }
    
    func updateData(){
        
        let url = "https://corona.lmao.ninja/v2/all"
        let url1 = "https://corona.lmao.ninja/v2/countries/"
        let url2 = "https://corona.lmao.ninja/v2/countries/ro"
        
        let session = URLSession(configuration: .default)
        let session1 = URLSession(configuration: .default)
        let session2 = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) { (data, _, err) in
            
            if err != nil {
                
                print((err?.localizedDescription)!)
                return
            }
            
            let json = try! JSONDecoder().decode(Case.self, from: data!)
            
            print(json.active)
            
            DispatchQueue.main.async {
                
                self.data.append(json)
            }
            
        }.resume()
        
        session2.dataTask(with: URL(string: url2)!) { (data, _, err) in
            
            if err != nil {
                
                print((err?.localizedDescription)!)
                return
            }
            
            let json = try! JSONDecoder().decode(Case.self, from: data!)
            
            print(json.active)
            
            DispatchQueue.main.async {
                
                self.ro.append(json)
            }
            
        }.resume()
        
        for i in country {
            
            session1.dataTask(with: URL(string: url1 + i)!) { (data, _, err) in
                
                if err != nil {
                    
                    print((err?.localizedDescription)!)
                    return
                }
                
                let json = try! JSONDecoder().decode(Details.self, from: data!)
                
                print(json.country)
                
                DispatchQueue.main.async {
                    
                    self.countries.append(json)
                }
                
            }.resume()
            
        }
    }
}

var country = ["uk", "romania", "usa", "italy"]





