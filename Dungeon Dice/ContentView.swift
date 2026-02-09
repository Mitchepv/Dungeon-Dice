//
//  ContentView.swift
//  Dungeon Dice
//
//  Created by Nia Mitchell on 2/9/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var message = "Roll a dice"
    private let diceType =  [4,6,8,10,12,20,100]
    
    var body: some View {
        VStack {
           
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
                ForEach( diceType , id: \.self ) { diceType in Button ("\(diceType)-sided") {
                        rollDice(Side: diceType)
                    }
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
