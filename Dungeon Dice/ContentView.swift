//
//  ContentView.swift
//  Dungeon Dice
//
//  Created by Nia Mitchell on 2/9/26.
//

import SwiftUI

struct ContentView: View {
    enum  Dice: Int, CaseIterable, Identifiable {
        case four = 4, six = 6 , eight = 8, ten = 10 , twenty = 20 , Hundred = 100
        
      
        
        var id: Int {
           self.rawValue
        }
        var roll: Int {
            return Int.random(in: 1...self.rawValue)
        }
    }
    
    @State private var message = "Roll a dice"
    @State private var animationTrigger = false
    @State private var isDoneTrig = true
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
                .rotation3DEffect(isDoneTrig ? .degrees(360) : .degrees(0), axis: (x:1 , y:0, z: 0))
                .onChange(of: animationTrigger) {
                     isDoneTrig = false
                    withAnimation(.interpolatingSpring(duration: 0.6, bounce: 0.4 ) ) {
                        isDoneTrig = true
                    }

                }
            
            Spacer()
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                ForEach( Dice.allCases ) { die  in Button ("\(die.rawValue)-sided") {
                    
                    animationTrigger.toggle()
                    message = "You rolled a \(die.roll) on a \(die)-sided die"
                        }
                    }
                    .font(.title2)
                    .lineLimit(1)
                    .fixedSize(horizontal: true, vertical: false)
                    .buttonStyle(.glassProminent)
                    .tint(.red)
            }
         
        }
        .padding()
    }
    
 
}

#Preview {
    ContentView()
}
