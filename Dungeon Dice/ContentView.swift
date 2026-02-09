//
//  ContentView.swift
//  Dungeon Dice
//
//  Created by Nia Mitchell on 2/9/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var message = "Roll a dice"
   
    
    var body: some View {
        VStack (spacing: 50) {
           
            Text ("Dungeon Dice!")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundStyle(.red)
            
            Spacer()
            
           Text(message)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            
            Group{
                HStack {
                    Button ("4-sided") {
                        rollDice(Side: 4)
                    }
                    
                    Button ("6-sided") {
                        rollDice(Side: 6)
                    }
                    
                    Button ("8-sided") {
                        rollDice(Side: 8)
                    }
        
                }
                
                HStack {
                    Button ("10-sided") {
                        rollDice(Side: 10)
                    }
                    
                    Button ("12-sided") {
                        rollDice(Side: 12)
                    }
                    Button ("20-sided") {
                        rollDice(Side: 20)
                    }
                    
                }
                
                Button ("100-sided") {
                    rollDice(Side: 100)
                    }
             
            }
            .font(.title2)
            .buttonStyle(.glassProminent)
            .tint(.red)
            
        
        }
        .padding()
    }
    func rollDice (Side:Int) {
        let result = Int.random(in: 1...Side)
        message = "You rolled a \(result) on a \(Side)-sided die"
    }
}

#Preview {
    ContentView()
}
