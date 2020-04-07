//
//  CellView.swift
//  CoronaTracker
//
//  Created by Catalin Olaru on 4/7/20.
//  Copyright © 2020 Catalin Olaru. All rights reserved.
//

import SwiftUI

struct CellView : View {
    
    
    var data : Details
    var body: some View {
        
        VStack(alignment: .leading, spacing: 15) {
            
            Text(data.country)
                .fontWeight(.bold)
            .foregroundColor(Color(#colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)))
            
            HStack(spacing: 15){
                
                VStack{

                    Text(getValue(data: data.cases))
                        .font(.title)
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                    
                }.padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 12){
                    
                    VStack(alignment: .leading, spacing: 10){
                        
                        Text("Deaths")
                        .foregroundColor(Color(#colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)))
                        
                        Text(getValue(data: data.deaths))
                            .foregroundColor(Color.white)
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 10){
                        
                        Text("Recovered")
                        .foregroundColor(Color(#colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)))
                        
                        Text(getValue(data: data.recovered))
                            .foregroundColor(Color.white)
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 10){
                        
                        Text("Active")
                        .foregroundColor(Color(#colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)))
                        
                        Text(getValue(data: data.active))
                            .foregroundColor(Color.white)
                    }
                    
                }
            }
            
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width - 30)
        .background(Color(#colorLiteral(red: 0, green: 0.738790859, blue: 0.7528861771, alpha: 1)))
        .cornerRadius(20)
    }
}

