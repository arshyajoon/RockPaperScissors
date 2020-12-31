//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Arshya GHAVAMI on 12/25/20.
//

import SwiftUI

struct ContentView: View {
    let choices = ["Rock", "Paper", "Scissors"]
    @State private var currentChoice = 0
    @State private var shouldWin = Bool.random()
    @State private var appsChoice = Int.random(in: 0...2)
    @State private var score = 0
    
    func game() {
        let choices = (currentChoice, appsChoice, shouldWin)
    switch choices {
    case (1,2,true):
    score -= 1
    case (0,2,false):
    score -= 1
    case (0,1,true):
    score -= 1
    case (1,0,true):
    score += 1
    case (2,0,false):
    score += 1
    case (2,1,true):
    score += 1
    case (0,0,false):
    fallthrough
    case (0,0, true):
    fallthrough
    case (1,1,true):
    fallthrough
    case (2,2, true):
    fallthrough
    case (1,1,false):
    fallthrough
    case (2,2,false):
    fallthrough
    case (1,2,false):
    score += 1
    case (0,2,true):
    score += 1
    case (0,1,false):
    score += 1
    case (2,0,true):
    score -= 1
    case (2,1,false):
    score -= 1
    case (1,0,false):
    score += 1
    default:
        break
    }
        currentChoice = 0
        shouldWin = Bool.random()
        appsChoice = Int.random(in: 0...2)
        if score == 10 {
            score = 0
        }
    }
    
    var body: some View {
        NavigationView {
        VStack(spacing: 20) {
           Text("Score: \(score)")
            Text("App's Choice: \(choices[appsChoice])")
            if shouldWin {
                Text("You should Win")
            } else {
                Text("You should Lose")
            }
            HStack {
                ForEach(0..<3) { item in
                    Button(action: {
                        currentChoice = item
                    game()
                    }) {
                       Text(choices[item])
                    }
                }
            }
        }
        .navigationBarTitle("Rock, Paper, Scissors")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
