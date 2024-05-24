//
//  ContentView.swift
//  Tap100
//
//  Created by 石崎汐音 on 2024/04/14.
//

import SwiftUI



struct ContentView: View {
    
    @State var tapNumber  = 0
    @State var timer: Timer? = nil
    @State var seconds : Double = 0.0
    @State var canTap = false
    @AppStorage ("bestScore") var bestScore = 0.0
    
    
    var body: some View {
        VStack {
            Text("早押し職人")
                .padding()
                .font(.largeTitle)
            
            Text("ベストスコア:\(bestScore)")
                .padding()
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundColor(.red)
            
            
            
            
            
            if tapNumber >= 100 {
                Text("あなたの記録")
            }
            Text(String(format: "%.1f", seconds))
                .font(.system(size: 120 , weight: .black))
            
            
            Text("\(tapNumber)")
                .font(.system(size: 130,weight: .bold,design: .default))
            
            
            //連打のボタン
            
            Button{
                if tapNumber == 99 {
                    if let time = timer{
                        time.invalidate()
                    }
                    
                }
                tapNumber += 1
                if timer == nil {
                    timer = Timer.scheduledTimer (withTimeInterval:0.1 , repeats:true){ _ in
                        seconds += 0.1
                    }
                    
                }
                
                if tapNumber == 100 {
                    canTap = true
                    if seconds <= bestScore {
                        bestScore = seconds
                    } else {
                        return
                    }
                    
                }
            }label: {
                Text("連打")
                    .modifier(TextModifier(backgroundColor: .green))
            }
            
            
            
            
            .disabled(canTap)
            
            
            //もう一度　ボタン
            if tapNumber == 100 {
                
                
                Button{
                    tapNumber = 0
                    canTap = false
                    seconds = 0.0
                    timer = nil
                }label: {
                    Text("もう一度")
                        .modifier(TextModifier(backgroundColor: .red))
                }
                
                
                
            }
            
            
            
        }
        .padding()
    }
}


struct TextModifier : ViewModifier{
    let backgroundColor : Color
    
    
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(width: 300 ,height: 100)
            .background(backgroundColor)
            .foregroundColor(.white)
            .font(.largeTitle)
            .cornerRadius(10)
    }
    
    
}





#Preview {
    ContentView()
}
